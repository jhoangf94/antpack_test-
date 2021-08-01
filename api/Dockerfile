# set the node.js version
FROM node:14

# create directory app
RUN mkdir -p /usr/src/app

# move to directory app
WORKDIR /usr/src/app

# copy all package json files
COPY package*.json ./

# install node_modules
RUN npm install

# copy all files to directory app
COPY . .

# expose app port
EXPOSE 3000

# start server
CMD [ "npm", "start" ]
