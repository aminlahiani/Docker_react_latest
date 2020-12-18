# stage 1 
FROM node:latest 
WORKDIR /app
COPY  package.json . 
RUN npm install 

COPY . .
RUN npm run-script build

# stage 2 
FROM nginx:alpine
COPY  --from=node /app/build  /usr/share/nginx/html
