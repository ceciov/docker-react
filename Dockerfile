FROM node:alpine as builder
WORKDIR /'app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- all the stuf we need about
FROM nginx
# copy something from builderface
COPY --from=builder /app/build /usr/share/nginx/html