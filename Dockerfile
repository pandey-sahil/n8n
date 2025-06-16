FROM node:18

# Set working directory
WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

# Copy source code
COPY . .

# Install dependencies
RUN pnpm install

# Build n8n packages
RUN pnpm build

# Expose default port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
