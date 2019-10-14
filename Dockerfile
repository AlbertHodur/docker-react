FROM node:alpine as builder_face
WORKDIR '/app'

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder_face /app/build /usr/share/nginx/html
