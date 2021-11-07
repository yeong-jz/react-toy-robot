# pull official base image
FROM node:16.13.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
RUN npm uninstall react-scripts --save
RUN npm i react-scripts
RUN yarn

# add app
COPY . ./

# start app
CMD ["yarn", "start"]