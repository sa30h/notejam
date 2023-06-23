FROM python:2
ENV DockerHOME=/home/app/webapp  
RUN mkdir -p $DockerHOME  
WORKDIR $DockerHOME  
COPY . $DockerHOME  
RUN pip install -r requirements.txt  
RUN pip install psycopg2
# EXPOSE 8003 
CMD ./manage.py syncdb --noinput && ./manage.py runserver 0.0.0.0:8003

# CMD ./manage.py migrate && ./manage.py runserver 0.0.0.0:8003

# CMD ./manage.py syncdb --noinput && ./manage.py migrate && ./manage.py runserver 0.0.0.0:8003
# ENTRYPOINT ["python"]
# CMD ["manage.py", "runserver","0.0.0.0:8001"] 
# ./manage.py schemamigration notes --initial
# sudo docker run -d -e POSTGRES_USER=satish -e POSTGRES_PASSWORD=satish -p 5432:5432 -v /data:/var/lib/postgresql/data --name postgresql postgres

#dockerhub push with