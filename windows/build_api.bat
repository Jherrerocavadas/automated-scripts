@set dockerRepository=%1
@IF "%dockerRepository%"=="" ( goto parameterRequired ) else (goto buildFunction)

:buildFunction
@set currentDirectory=%CD%
@cd %currentDirectory%
@echo "--------------------< Gerando jar da API >--------------------" &
@call mvn clean package -DskipTests &
@echo "--------------------< Gerando docker image >--------------------" &
@call docker image build -t %dockerRepository% . &
@echo "--------------------< Subindo imagem do docker >--------------------" &
@call docker push %dockerRepository% &
@EXIT /B 0

:parameterRequired
@echo "Campo dockerRepository obrigatorio"
@EXIT /B 0