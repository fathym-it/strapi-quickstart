FROM node:16-alpine

ENV PORT 1337
ENV HOST 0.0.0.0
ENV NODE_ENV production

RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev

# Install app dependencies
WORKDIR /opt/
COPY ./package.json ./yarn.lock ./
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /opt/app
COPY ./ .
RUN yarn build
EXPOSE 1337

CMD [ "yarn", "start" ]
