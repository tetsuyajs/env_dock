image_name=yt_dlp
container_name=yt_dlp
share_hpath=`pwd`
share_cpath=/out
ssh_port=2222

docker run \
    --rm \
    --name $container_name \
    -h $container_name \
    -v /$share_hpath:$share_cpath \
    $image_name \
    $1

