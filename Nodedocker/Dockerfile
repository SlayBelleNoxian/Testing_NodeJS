FROM node:14-alpine3.12

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

RUN apk add curl

RUN curl www.google.com

CMD [ "node", "index.js" ]