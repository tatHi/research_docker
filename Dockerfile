FROM ubuntu

RUN apt-get update

# git
RUN apt-get -y install git

# vim
RUN apt-get -y install vim && \
    git clone https://github.com/tatHi/vimrc.git && \
    cp vimrc/.vimrc ~/.vimrc && \
    rm -rf vimrc

# mecab
RUN apt-get -y install mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8

# python2, python3
RUN apt-get -y install python3-pip python3-dev && \
    apt-get -y install python-pip python-dev

# deeplearning flameworks
RUN pip3 install chainer && \
    pip3 install tensorflow && \
    pip3 install https://download.pytorch.org/whl/cpu/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl && \
    pip3 install torchvision

# python packages
RUN pip3 install tqdm && \
    pip3 install matplotlib && \
    pip3 install sklearn && \
    pip3 install dill && \
    pip3 install pandas && \
    pip3 install nltk && \
    apt-get -y install swig && \
    pip3 install mecab-python3

# make workspace
RUN mkdir work
WORKDIR /work

# my common package
RUN git clone https://github.com/tathi/common && \
    python3 common/setup.py develop
