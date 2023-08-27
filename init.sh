#  if the container is already running, stop it
docker stop rf-upload
#  if the container exists, remove it
docker rm rf-upload
#  build the image
docker build -t rf-file-upload .
#  run the container
docker run -d -p 80:80 -v .:/app --name rf-upload rf-file-upload

echo "running on port 80"