FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY . /var/www/html/
EXPOSE 8085
CMD ["nginx","-g","daemon off;"]

