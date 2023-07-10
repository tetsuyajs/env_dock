image_name=movie
container_name=movie
share_hpath=$HOME
share_cpath=/out

if [ "$TERM_PROGRAM" = "mintty" ] ; then
    path_letter=${share_hpath:1:1}
    path_dirs=${share_hpath:3}
    share_hpath="${path_letter^^}:\\${path_dirs/\//\\}\\Videos"
    echo $share_hpath

    winpty docker run \
        -it \
        --rm \
        --name $container_name \
        -h $container_name \
        -v $share_hpath:$share_cpath \
        $image_name \
        $1
else
    docker run \
        -it \
        --rm \
        --name $container_name \
        -h $container_name \
        -v /$share_hpath:$share_cpath \
        $image_name \
	$1
fi
