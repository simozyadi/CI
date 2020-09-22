FROM python:3

 ADD my_script.py /
 RUN pip install pystrich

 CMD [ "python", "./my_script.py" ]


#FROM nginx:alpine
#COPY default.conf /etc/nginx/conf.d/default.conf
#COPY index.html /usr/share/nginx/html/index.html
