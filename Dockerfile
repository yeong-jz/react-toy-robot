# pull official base image
FROM node:16.13.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
RUN yarn
RUN yarn add -D eslint typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin
RUN npm i --save-dev eslint typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin

# add app
COPY . ./

# start app
CMD ["yarn", "start"]