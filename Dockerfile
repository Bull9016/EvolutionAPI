FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git openssl

# Clone Evolution API
RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

# Install dependencies
RUN npm install

# 🔥 Tell Prisma where the schema actually is
RUN npx prisma generate --schema=src/infra/database/prisma/schema.prisma

# Render requirements
ENV PORT=8080
EXPOSE 8080

CMD ["npm", "run", "start"]
