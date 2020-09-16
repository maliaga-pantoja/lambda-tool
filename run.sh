engine=$ENGINE

if test -z "$engine"
then
  echo "ENGINE is required"
  exit 1
else
  ./build.sh
  if [ $? -eq 0 ]
  then
    echo "zip ok"
    ./lambda-deploy.sh
    if [ $? -eq 0 ]
    then
      echo "Deploy success"
      exit 0
    else
      echo "Can't deploy lambda"
      exit 1
    fi
  else
    echo "Error with zip process"
    exit 1
  fi
fi