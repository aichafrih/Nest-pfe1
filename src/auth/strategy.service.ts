import { ExecutionContext, Injectable, UnauthorizedException } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { PrismaService } from "src/prisma/prisma.service";
import { JwtService } from '@nestjs/jwt';
type Payload = {
    sub: number,
    email: string,
    id:number
}
@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
    canActivate(context: ExecutionContext): boolean | Promise<boolean> {
        throw new Error('Method not implemented.');
    }
    constructor(configService: ConfigService, private readonly prismaService: PrismaService,jwtService: JwtService) {
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            secretOrKey: configService.get("SECRET_KEY"),
            ignoreExpiration: false
        })
    }
    async validate(payload: Payload) {
      const user = await this.prismaService.user.findUnique({ where: { email: payload.email } })
        if (!user) throw new UnauthorizedException("Unauthorized")
        
       Reflect.deleteProperty(user, "MotDePasse")
      
       return {user}
    }
  
  /*async validate(payload: Payload, req: Request) {
    const user = await this.prismaService.user.findUnique({
      where: { email: payload.email },
    });

    if (!user) {
      throw new UnauthorizedException();
    }

    const admin = await this.prismaService.admin.findUnique({
      where: { email: payload.email },
    });

    if (!admin || !admin.isAdmin) {
      throw new UnauthorizedException();
    }

    // add the user object to the request object
    req['user'] = user;

    return user;
  }*/
}