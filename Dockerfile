# Stage 1: Builder
FROM node:20-slim AS builder

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY package*.json ./
COPY api/ ./api/

# Install all deps (prod + dev)
RUN npm ci

# Stage 2: Final image
FROM node:20-slim

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/api ./api

# Install only production dependencies
RUN npm ci --omit=dev

# Expose the port your app listens on
EXPOSE 3000

CMD ["npm", "start"]

# Test trigger for workflow v6