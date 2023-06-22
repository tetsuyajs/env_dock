image_name=cpuw
container_name=cpuw
share_hpath=$HOME
share_cpath=/home/work
jupyter_port=9999
ssh_port=2222
password=`cat password.txt`
if [ -n $password ] ; then
    echo "cant find password.txt, so use deafult password(\"pass\")"
    password="pass"
fi

if [ "$TERM_PROGRAM" = "mintty" ] ; then
    path_letter=${share_hpath:1:1}
    path_dirs=${share_hpath:3}
    share_hpath="${path_letter^^}:\\${path_dirs/\//\\}"
    echo $share_hpath
    
    winpty docker run \
        -it \
        --rm \
        --name $container_name \
        -h $container_name \
        -v $share_hpath:$share_cpath \
        -p $jupyter_port:8888 \
        -p $ssh_port:22 \
        -e PASSWORD=$password \
        $image_name
else
    docker run \
        -it \
        --rm \
        --name $container_name \
        -h $container_name \
        -v $share_hpath:$share_cpath \
        -p $jupyter_port:8888 \
        -p $ssh_port:22 \
        -e PASSWORD=$password \
        $image_name
fi

