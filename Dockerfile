FROM node:16

# Working dir
WORKDIR /usr/src/app

# Copy files from Build
COPY package*.json ./

# Install Files
RUN npm install 

# Copy SRC
COPY . .

# Set environment variables for your PostgreSQL database connection
ENV DATABASE_URL postgresql://postgres:PASSWORD@host.docker.internal:5432/$yadb?schema=public

# Initialise prisma client
RUN npx prisma migrate dev


# Build
RUN npm run build

# Open Port
EXPOSE 3000

# Docker Command to Start Service
CMD [ "node", "dist/src/main.js" ]