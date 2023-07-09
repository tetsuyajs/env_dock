image_name=movie
container_name=movie
share_hpath=`pwd`
share_cpath=/out
ssh_port=2222

winpty docker run \
    -it \
    --rm \
    --name $container_name \
    -h $container_name \
    -v /$share_hpath:$share_cpath \
    $image_name \
    $1

