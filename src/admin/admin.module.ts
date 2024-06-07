import { Module } from '@nestjs/common';
import { AdminService } from './admin.service';
import { AdminController } from './admin.controller';
import { AdminJwtStrategy } from 'src/auth/admin-jwt.strategy';
import { PrismaService } from 'src/prisma/prisma.service';
import { JwtModule } from '@nestjs/jwt';
import { NotificationModule } from 'src/notification/notification.module';
import { PubService } from 'src/pub/pub.service';

@Module({
  
  imports: [
    JwtModule.register({
      secret: 'SECRET_KEY', // replace with your own secret key
    }),NotificationModule
  ],
  providers: [AdminService, PrismaService,AdminJwtStrategy,PubService],
  controllers: [AdminController],
  exports: [],
})
export class AdminModule { }
