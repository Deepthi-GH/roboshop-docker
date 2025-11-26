FROM node:20.19.5-alpine3.22 AS build 
WORKDIR /opt/server    
COPY package.json .
COPY *.js .
# this may add extra cache memory
RUN npm install 

# this is the final image. after copying it deletes above image
FROM node:20.19.5-alpine3.22
# Create a group and user
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
WORKDIR /opt/server 
# it copies the files with roboshop user
COPY --from=build /opt/server /opt/server
EXPOSE 8080
LABEL com.project="roboshop" \
      component="catalogue" \
      created_by="deepthi"
ENV MONGO="TRUE" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
 # to start the container   
RUN chown -R roboshop:roboshop /opt/server 
USER roboshop
CMD [ "server.js"]
ENTRYPOINT ["node"]

# FROM node:20
#  # it creates this directory and automatically moves to that path. no need to do cd.
# WORKDIR /opt/server    
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV MONGO="TRUE" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
#  # to start the container    
# CMD ["node", "server.js"]