cd ~/sre-fundamentals-may-23/Hands-on/02-Docker/11-calculator

docker-compose down
docker-compose up -d


docker build -t atingupta2005/calculator_1 1-calculator
docker build -t atingupta2005/calculator_2 2-calculator
docker build -t atingupta2005/calculator_3 3-calculator

docker images


docker login -u atingupta2005

docker push atingupta2005/calculator_1
docker push atingupta2005/calculator_2
docker push atingupta2005/calculator_3

docker logout
