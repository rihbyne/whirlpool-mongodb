### whirlpool-mongodb

This image overrides the defacto/standard mongodb image available at docker hub with custom settings for 
only whirlpool project implemented as part of my master's project.

To quickly run this image, issue following command

`
docker run -v /covered/whirlpool/mongodbdata/:/data/db -p 27017:27017 -td rihbyne/whirlpool-mongodb
`

To build the image, running the following command

`
docker build --no-cache -t whirlpool-mongodb \
--build-arg MONGO_INITDB_ROOT_USERNAME=<username> \
--build-arg MONGO_INITDB_ROOT_PASSWORD=<pwd>\
--build-arg WHIRLPOOL_MONGODB_CRAWLER_USERNAME=<user1>\
--build-arg WHIRLPOOL_MONGODB_CRAWLER_PWD=<pwd>\
--build-arg WHIRLPOOL_MONGODB_WEBAPP_USERNAME=<user2>\
--build-arg WHIRLPOOL_MONGODB_WEBAPP_PWD=<pwd>\
.
`

After successful build, start the container with the following command. Create a external storage
directory and map it to the volume inside docker.

`
docker run --name whirlpool-mongodb -v /covered/whirlpool/mongodbdata/:/data/db -p 27017:27017 -td whirlpool-mongodb:latest
`

