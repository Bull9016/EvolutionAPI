FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git openssl

# Copy package files first (better caching)
COPY . .

# Install dependencies
RUN npm install

# Render-required
ENV PORT=8080
EXPOSE 8080

# Start Evolution API (this internally runs prisma)
CMD ["npm", "run", "start"]
