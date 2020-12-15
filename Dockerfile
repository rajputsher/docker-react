FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#COPY --from=0 /app/build /usr/share/nginx/html

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html