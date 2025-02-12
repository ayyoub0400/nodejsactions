FROM node:18-alpine AS builder

WORKDIR /app

COPY ./src .

RUN npm ci

COPY ./src .

FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app .

RUN npm ci

EXPOSE 80

CMD ["node", "index.js"]