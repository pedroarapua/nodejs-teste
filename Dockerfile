FROM node:8

# Create app directory
WORKDIR /opt/app

# Install app dependencies
#COPY package.json .
# For npm@5 or later, copy package-lock.json as well
COPY package.json ./
#COPY package-lock.json ./

RUN npm install

# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 3000

# set maintainer
LABEL maintainer "teste@teste.com"

# set a health check
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
            
CMD [ "npm", "start" ]
