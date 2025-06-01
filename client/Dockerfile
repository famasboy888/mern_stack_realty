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

# Custom nginx config (optional but recommended)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy env template and script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]

#Test tringger for workflow client v4