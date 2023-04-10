image_name=ngs
container_name=ngs
share_hpath1=$HOME
share_cpath1=/home/work
share_hpath2=/mnt/ab_srv
share_cpath2=/mnt/ab_srv
jupyter_port=9999
ssh_port=2222
password=`cat password.txt`
if [ -n $password ] ; then
    echo "cant find password.txt, so use deafult password(\"pass\")"
    password="pass"
fi

docker run \
    -it \
    --rm \
    --name $container_name \
    -h $container_name \
    -v $share_hpath1:$share_cpath1 \
    -v $share_hpath2:$share_cpath2:ro \
    -p $jupyter_port:8888 \
    -p $ssh_port:22 \
    -e PASSWORD=$password \
    $image_name

