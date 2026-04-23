FROM node:18-alpine
WORKDIR /app

# 1. Copiamos el package.json desde la subcarpeta
COPY Service/reviews/package*.json ./

# 2. Instalamos dependencias
RUN npm install

# 3. Copiamos TODO el contenido del proyecto
# (Docker respetará la estructura, pero esto nos asegura tener el código)
COPY . .

EXPOSE 3000

# 4. Ajustamos el comando de inicio para que encuentre el app.js
# Si app.js también está en reviews, cámbialo a: CMD ["node", "Service/reviews/app.js"]
CMD ["node", "app.js"]