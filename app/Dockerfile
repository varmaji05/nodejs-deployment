# Stage 1: Build dependencies in a safe environment
FROM node:20-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

# Stage 2: Production image
FROM node:20-alpine

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app
COPY --from=builder /app .

ENV NODE_ENV=production
EXPOSE 3000

USER appuser
CMD ["node", "src/server.js"]
