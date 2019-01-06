FROM node:alpine
FROM nginx:1.13.3-alpine
WORKDIR '/app/'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html