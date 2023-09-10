import { Elysia } from 'elysia';

const app = new Elysia()
	.get('/', () => 'Hello Elysia')
    .get('/ping', () => 'pong')
	.listen(8080);


console.log(`🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`);



export type App = typeof app;