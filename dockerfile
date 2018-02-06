FROM ubuntu:16.04

# environmental value
ENV QT_PATH /opt/Qt

RUN apt-get -y upgrade
RUN apt-get -y update

# install essential packages
RUN apt-get install -y build-essential
RUN apt-get install -y git make

# make directory for Qt
RUN mkdir -p ${QTDIR}

# install qt
RUN apt search build-essential
RUN apt-get install -y qt5-default

RUN git clone https://github.com/qt/qtbase
RUN cd qtbase/
RUN ./configure -opengl -confirm-license -opensource -debug -nomake examples -nomake tests -reduce-exports -release -make libs --prefix=/opt
RUN make
RUN make install

USER user

CMD ["bash"]
