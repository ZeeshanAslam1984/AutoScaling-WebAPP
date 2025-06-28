FROM node
WORKDIR /autoscaling-webapp
COPY . . 
RUN npm install 
CMD ["npm","start"]