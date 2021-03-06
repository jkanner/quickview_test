
FROM andrewosh/binder-base

MAINTAINER Jeremy Freeman <freeman.jeremy@gmail.com>

USER root

# Add dependency
RUN echo 'deb http://software.ligo.org/lscsoft/debian/ jessie contrib' >> /etc/apt/sources.list
RUN apt-get update
#RUN apt-get install -y graphviz
ENV PATH /home/main/anaconda2/bin:$PATH
RUN yes | apt-get -y --force-yes install lalframe lal lalsimulation lalsimulation-python lal-python lalframe-python

RUN chmod +x /etc/lal-user-env.sh
USER main
RUN echo "source /etc/lal-user-env.sh" >> ~/.bashrc
RUN echo "source /etc/lal-user-env.sh" >> ~/.profile
RUN sed -i '2i source /etc/lal-user-env.sh' start-notebook.sh

#ENV PATH /usr/bin:/usr/sbin:/bin:/sbin:/home/main/.local/bin
#ENV PYTHONPATH $PYTHONPATH:/home/main/anaconda/lib/python2.7/site-packages

# Install requirements for Python 2
#ADD requirements.txt requirements.txt
#RUN pip install -r requirements.txt
#RUN pip2 install pycbc --user

#USER root
#ENV PATH /usr/bin:/usr/sbin:/bin:/sbin:/home/main/.local/bin
#ENV PYTHONPATH $PYTHONPATH:/home/main/anaconda/lib/python2.7/site-packages
#RUN pip2 install pycbc


