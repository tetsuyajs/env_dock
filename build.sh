image_name=$1
dockerfile_path=`dirname $0`/images/$image_name

cd $dockerfile_path
docker build -t $image_name .
