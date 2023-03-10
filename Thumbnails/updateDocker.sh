cd ./../..
docker stop nodeserver 
docker rm nodeserver 
cp Mongo_myflix/Thumbnails/* myflix_react/src/Thumbnails
cat password.txt | docker login --username jackmoinc --password-stdin
docker build -t jackmoinc/myflix_react:remote .
docker push jackmoinc/myflix_react:remote
docker pull jackmoinc/myflix_react:remote
docker run -d -it -p 80:80 -p 8080:8080 --name nodeserver jackmoinc/myflix_react:remote