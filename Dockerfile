FROM maven:3.9.6-amazoncorretto-17-al2023 as base
ARG DB_NAME=userDB
ARG DB_URL=database-1.ctap86niaksk.ap-south-1.rds.amazonaws.com
ARG DB_USERNAME=root
ARG DB_PASSWORD=rootroot
RUN yum install git -y && git clone -b deployment https://github.com/balaji-kp/Mysql-Springboot.git
WORKDIR /Mysql-Springboot
RUN mvn clean install 

FROM openjdk:17-alpine
ENV DB_NAME=userDB
ENV DB_URL=database-1.ctap86niaksk.ap-south-1.rds.amazonaws.com
ENV DB_USERNAME=root
ENV DB_PASSWORD=rootroot
WORKDIR /Mysql-Springboot
COPY --from=base /Mysql-Springboot/target/springboot-Mysql-loginpageDemo.jar .
EXPOSE 8090
ENTRYPOINT ["java","-jar","springboot-Mysql-loginpageDemo.jar"]

