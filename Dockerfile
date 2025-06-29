FROM node
WORKDIR /autoscaling-webapp
COPY . . 
EXPOSE 3000
RUN npm install 
CMD ["npm","start"]