cd ~/sre-fundamentals-may-23/Hands-on/02-Docker/11-calculator-v1

docker-compose down
docker-compose up -d

docker ps | grep calculator
docker rm -f 11-calculator_calculator_1_1 11-calculator_calculator_3_1 11-calculator_calculator_2_1
docker ps | grep calculator

docker images | grep calculator
docker rmi atingupta2005/calculator_1:v1 atingupta2005/calculator_2 atingupta2005/calculator_3:v1
docker rmi atingupta2005/1-calculator atingupta2005/2-calculator atingupta2005/3-calculator
docker rmi 11-calculator_calculator_1 11-calculator_calculator_2 11-calculator_calculator_3
docker rmi atingupta2005/calculator_3 atingupta2005/calculator_1 atingupta2005/calculator_2
docker rmi atingupta2005/calculator_3:v2 atingupta2005/calculator_2 11-calculator_1-calculator
docker rmi 05e71

docker images | grep calculator

docker build -t atingupta2005/calculator_1:v1 1-calculator

docker build -t atingupta2005/calculator_2:v1 2-calculator

docker build -t atingupta2005/calculator_3:v1 3-calculator

docker images | grep calculator


docker login -u atingupta2005

docker push atingupta2005/calculator_1:v1
docker push atingupta2005/calculator_2:v1
docker push atingupta2005/calculator_3:v1

docker logout
