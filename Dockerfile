FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git openssl

# Clone Evolution API
RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

# Install dependencies
RUN npm install

# 🔥 REQUIRED: Generate Prisma client
RUN npx prisma generate

# Render needs this
ENV PORT=8080
EXPOSE 8080

CMD ["npm", "run", "start"]
