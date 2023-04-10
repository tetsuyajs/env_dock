home_path=$HOME/nginx

docker run -d --rm --name nginx -h nginx -v $home_path:/usr/share/nginx/html -p 80:80 nginx

