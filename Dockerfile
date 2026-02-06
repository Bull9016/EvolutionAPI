# Use Node LTS
FROM node:18-alpine

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
