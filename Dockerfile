# Use Node 22 as required by n8n
FROM node:22.2.0

# Set working directory
WORKDIR /app

# Install pnpm & turbo globally
RUN npm install -g pnpm turbo

# Copy project files
COPY . .

# Install dependencies
RUN pnpm install

# Build all packages (monorepo)
RUN turbo run build

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
