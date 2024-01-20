FROM ubuntu:latest as base
ENV DB_NAME=userDB
ENV DB_URL=database-3.ctap86niaksk.ap-south-1.rds.amazonaws.com
ENV DB_USERNAME=admin
ENV DB_PASSWORD=password
RUN apt update -y && apt upgrade -y
RUN apt install openjdk-17-jdk -y && apt install maven -y && apt install git -y && git clone https://github.com/balaji-kp/Mysql-Springboot.git
WORKDIR /Mysql-Springboot
RUN mvn clean install 
EXPOSE 8090
ENTRYPOINT ["java","-jar","target/springboot-Mysql-loginpageDemo.jar"]