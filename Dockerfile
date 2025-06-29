FROM node
WORKDIR /autoscaling-webapp
COPY . . 
EXPOSE 80
RUN npm install 
CMD ["npm","start"]
