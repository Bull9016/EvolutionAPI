# Use Node.js 20 (REQUIRED by Evolution API)
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache git openssl

# Clone Evolution API source
RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

# Install dependencies
RUN npm install

# Expose Evolution API port
EXPOSE 8080

# Start the server
CMD ["npm", "run", "start"]
