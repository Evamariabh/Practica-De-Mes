# Etapa 1: Compilar la aplicación Angular
FROM node:14 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN ng build --prod

# Etapa 2: Servir la aplicación compilada
FROM nginx:latest

COPY --from=builder /app/dist/* /usr/share/nginx/html/
EXPOSE 80
