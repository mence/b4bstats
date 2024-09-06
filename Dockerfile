FROM node:18-alpine

USER node

WORKDIR /app

COPY yarn.lock package.json ./

# check yarn exists otherwise attempt to install yarn via corepack
RUN yarn exec env || corepack enable

RUN yarn install --production --frozen-lockfile

COPY --chown=node . .

EXPOSE 3000

CMD ["yarn", "dev"]
