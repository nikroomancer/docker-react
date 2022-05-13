FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#each from statement starts a new block, we use the build from previoys block called builder
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html
#we don't have to start nginx. It is part of its default command.