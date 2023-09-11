import { Elysia } from 'elysia';

if (!process.env.PORT) throw new Error('PORT is not defined');

const app = new Elysia()
	.get('/', () => 'Hello Elysia')
    .get('/ping', () => 'pong')
	.listen(process.env.PORT);


console.log(`🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`);



export type App = typeof app;