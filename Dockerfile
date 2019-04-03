FROM ubuntu

RUN apt update

# git
RUN apt install git

# vim
RUN apt install vim && \
    git clone https://github.com/tatHi/vimrc.git && \
    cp vimrc/.vimrc ~/.vimrc && \
    rm -rf vimrc

# mecab
RUN apt install mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8

# python2, python3
RUN apt install python3-pip python3-dev && \
    apt install python-pip python-dev

# deeplearning flameworks
RUN pip3 install chainer && \
    pip3 install tensorflow && \
    pip3 install pytorch && \
    pip3 install torch torchvision && \
    pip3 install https://download.pytorch.org/whl/cpu/torch-1.0.1.post2-cp36-cp36m-linux_x86_64.whl && \
    pip3 install torchvision

# python packages
RUN pip3 install tqdm && \
    pip3 install matplotlib && \
    pip3 install sklearn && \
    pip3 install dill && \
    pip3 install pandas && \
    pip3 install nltk && \
    apt install swig && \
    pip3 install mecab-python3

# make workspace
RUN mkdir work && cd work

# my common package
RUN git clone https://github.com/tathi/common && \
    python3 common/setup.py develop
WORKDIR /work

