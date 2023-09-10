FROM oven/bun:1.0 AS builder

WORKDIR /app
COPY . .
RUN bun install --frozen-lockfile
RUN bun run build

FROM oven/bun:1.0

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/dist/server.js /app/server.js

CMD ["bun", "run", "server.js"]
