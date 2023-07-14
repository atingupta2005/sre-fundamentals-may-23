cd ~/sre-fundamentals-may-23/Hands-on/02-Docker/11-calculator-v2

docker-compose down
docker-compose up -d

docker ps | grep calculator
docker rm -f 11-calculator_calculator_1_1 11-calculator_calculator_3_1 11-calculator_calculator_2_1
docker ps | grep calculator

docker images | grep calculator

docker build -t atingupta2005/calculator_1:v2 1-calculator

docker build -t atingupta2005/calculator_2:v2 2-calculator

docker build -t atingupta2005/calculator_3:v2 3-calculator

docker images | grep calculator


docker login -u atingupta2005

docker push atingupta2005/calculator_1:v2
docker push atingupta2005/calculator_2:v2
docker push atingupta2005/calculator_3:v2

docker run -it --name testcalc atingupta2005/calculator_1:v2 bash
docker rm -f testcalc

docker logout
