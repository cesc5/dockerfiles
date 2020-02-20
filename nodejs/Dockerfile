FROM node:lts-stretch-slim AS builder

WORKDIR /app
ARG PROJECT=""

COPY . /app

RUN mkdir -p "$PROJECT/build" && \
    cd /app/node && npm install && \
    npm run "$PROJECT"build2


FROM node:lts-stretch-slim
WORKDIR /app

COPY --from=builder /app/node/ /app
