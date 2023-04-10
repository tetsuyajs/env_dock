home_path=$HOME/nginx

docker run --rm -d --name ftpd -p 21:21 -p 30000-30009:30000-30009 -v $home_path:/home/ftpusers -e "PUBLICHOST=localhost" -e "FTP_USER_NAME=aibliss" -e "FTP_USER_PASS=aibliss" -e "FTP_USER_HOME=/home/ftpusers" stilliard/pure-ftpd
