FROM node:22.16.0

# Install pnpm and turbo globally
RUN npm install -g pnpm turbo

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies (monorepo-aware)
RUN pnpm install --frozen-lockfile

# Build everything
RUN turbo run build

# Expose default n8n port
EXPOSE 5678

# Start n8n
CMD ["pnpm", "start"]
