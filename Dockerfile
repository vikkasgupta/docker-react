#BUILD PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#----------------------------------

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#no need to explicitly mention start-up command, as base nginx container's start up command is to start nginx server
