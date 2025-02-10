FROM node:18
WORKDIR /app

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci

COPY . .
RUN npm run build
RUN npm install --global http-server

RUN mkdir -p /app/collected_static && cp -r /app/build/* /app/collected_static/

CMD ["npx", "-y", "http-server", "-p", "8000", "/app/build"]
