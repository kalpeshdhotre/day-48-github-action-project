# ---- Stage 1: install dependencies ----
FROM node:24.18.0-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

# ---- Stage 2: runtime image ----
FROM node:24.18.0-alpine AS runtime
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

EXPOSE 3000
ENV NODE_ENV=production

CMD ["node", "server.js"]
