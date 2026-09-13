# syntax=docker/dockerfile:1

# Stage 1: Build and Optimize the application

ARG NODE_VERSION=22-alpine

FROM node:${NODE_VERSION} AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN --mount=type=cache,target=/root/.npm \
    npm ci

COPY index.html style.css script.js ./

RUN npm run build

# Stage 2: Production Nginx Runtime

FROM nginxinc/nginx-unprivileged:alpine AS production

ARG APP_VERSION=1.0.0

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist/ /usr/share/nginx/html/

EXPOSE 8080

HEALTHCHECK --interval=30s \
            --timeout=5s \
            --start-period=5s \
            --retries=3 \
            CMD wget --quiet --tries=1 --spider http://127.0.0.1:8080/ || exit 1

USER nginx

CMD ["nginx", "-g", "daemon off;"]