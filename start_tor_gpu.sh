image_name=tor_gpu
container_name=tor_gpu
share_hpath=$HOME
share_cpath=/workspace
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
    --gpus all \
    --name $container_name \
    -h $container_name \
    -v $share_hpath:$share_cpath \
    -p $jupyter_port:8888 \
    -p $ssh_port:22 \
    -e PASSWORD=$password \
    $image_name

