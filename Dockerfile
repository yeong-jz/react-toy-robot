# pull official base image
FROM node:14.15.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
RUN yarn
RUN yarn linting

# add app
COPY . ./

# start app
CMD ["yarn", "start"]