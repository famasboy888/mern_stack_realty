# Stage 1: Builder
FROM node:20-slim AS builder

# Set working directory
WORKDIR /app

# Copy package.json object
COPY package*.json ./

# Install all deps and build
RUN npm ci

# Copy everything
COPY . .

# Build dist
RUN npm run build



# Stage 2: Final image
FROM nginx:stable-alpine

# Copy built frontend
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy env template and script
COPY env.js /usr/share/nginx/html/env-config.template.js
COPY env.sh /docker-entrypoint.d/40-env-config.sh
RUN chmod +x /docker-entrypoint.d/40-env-config.sh

# Custom nginx config (optional but recommended)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

#Test tringger for workflow v2