FROM node:18

# Install pnpm globally
RUN npm install -g pnpm turbo

# Set workdir
WORKDIR /app

# Copy everything
COPY . .

# Install dependencies for the monorepo
RUN pnpm install --frozen-lockfile

# Build all packages using turbo
RUN turbo run build

# Expose the port n8n runs on
EXPOSE 5678

# Start n8n from built packages
CMD ["pnpm", "start"]
