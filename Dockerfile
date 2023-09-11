FROM oven/bun:1.0 AS builder

WORKDIR /app

COPY package.json /app/package.json
COPY bun.lockb /app/bun.lockb

RUN bun install --frozen-lockfile

COPY src /app/src
RUN bun run build

FROM oven/bun:1.0
WORKDIR /app
ENV NODE_ENV=production

COPY --from=builder /app/dist/server.js /app/server.js

ENV PORT=8080
EXPOSE $PORT

CMD ["bun", "run", "server.js"]
