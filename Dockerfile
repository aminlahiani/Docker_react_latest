# stage 1 
FROM node:latest as node 
WORKDIR /app
COPY  . . 
RUN npm install 
RUN npm run-script build
# stage 2 
FROM nginx:alpine
COPY  --from=node /app/build  /usr/share/nginx/html
