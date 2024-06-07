import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { validate } from 'class-validator';
import 'reflect-metadata';
import { ValidationPipe } from '@nestjs/common';
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.useGlobalPipes(new ValidationPipe)
  //app.useGlobalGuards(new RolesGuard())
  app.enableCors({

    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    allowedHeaders: 'Content-Type,Authorization',
    preflightContinue: false,
    optionsSuccessStatus: 204,
    credentials: true,
  });
  await app.listen(3000);
}
bootstrap();