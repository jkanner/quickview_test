
FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

# Add dependency
RUN echo 'deb http://software.ligo.org/lscsoft/debian/ jessie contrib' >> /etc/apt/sources.list
RUN apt-get update
#RUN apt-get install -y graphviz
RUN yes | apt-get -y --force-yes install lalframe lal lalsimulation lalsimulation-python lal-python lalframe-python
USER main

ENV PATH /usr/bin:/usr/sbin:/bin:/sbin:/home/main/.local/bin
ENV PYTHONPATH $PYTHONPATH:/home/main/anaconda/lib/python2.7/site-packages

# Install requirements for Python 2
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt



