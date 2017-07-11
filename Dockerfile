# Version: 0.1
FROM centos
MAINTAINER Pyshen "pyshen@example.com"

# yum update
RUN yum -y update && yum -y install wget

# install lib devel
RUN yum install -y python-devel mysql-devel gcc 

# install pip 
RUN yum -y install epel-release
RUN yum -y install python-pip


# create app web
RUN mkdir -p /opt/webapp/
ADD requirements.txt /opt/webapp/requirement.txt


# install python lib env
WORKDIR /opt/webapp/
RUN pip install --upgrade pip && pip install -r requirement.txt

# modify lib env
COPY __init__.py /lib/python2.7/site-packages/flask_bootstrap/__init__.py
COPY datastructures.py /lib/python2.7/site-packages/werkzeug/datastructures.py

