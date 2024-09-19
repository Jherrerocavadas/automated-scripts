dockerRepository=$1

if [ -z "$1" ]; then
   echo "Campo dockerRepository obrigatorio" 
   exit 1 
else 
  echo "--------------------< Gerando jar da API >--------------------" &
  mvn clean package -DskipTests &
  echo "--------------------< Gerando docker image >--------------------" &
  docker image build -t $dockerRepository . &
  echo "--------------------< Subindo imagem do docker >--------------------" &
  docker push $dockerRepository &
fi