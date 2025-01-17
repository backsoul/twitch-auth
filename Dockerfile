# Usa una imagen base ligera de Node.js
FROM node:18-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia solo los archivos de dependencias para aprovechar la caché de Docker
COPY package*.json ./

# Instala las dependencias (usa npm ci para instalación más rápida y confiable)
RUN npm ci --legacy-peer-deps

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto que usará la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["node", "index.js"]