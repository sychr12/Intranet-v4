# Etapa 1: construir a aplicação
FROM node:20 AS builder

# Define o diretório de trabalho
WORKDIR /app

# Copia apenas arquivos de dependências (melhor aproveitamento de cache)
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# Compila o projeto Next.js
RUN npm run build

# Etapa 2: rodar a aplicação
FROM node:20-alpine AS runner

WORKDIR /app

# Define variáveis de ambiente
ENV NODE_ENV=production
ENV PORT=3000

# Copia apenas os arquivos necessários do builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Expõe a porta 3000
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
