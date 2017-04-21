# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM jupyter/scipy-notebook

MAINTAINER Vitaliy Radchenko
USER root

RUN pip install --upgrade pip

RUN apt-get update && apt-get -y install cmake

# XGBoost
RUN git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && \
    make -j4 && \
    cd python-package; python setup.py install && cd ../..

# LightGBM
RUN cd /usr/local/src && git clone --recursive --depth 1 https://github.com/Microsoft/LightGBM && \
    cd LightGBM && mkdir build && cd build && cmake .. && make -j $(nproc) && \
    cd /usr/local/src/LightGBM/python-package && python setup.py install 

RUN pip install theano

# TensorFlow 
RUN wget https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.10.0rc0-cp35-cp35m-linux_x86_64.whl && \
    pip install tensorflow-0.10.0rc0-cp35-cp35m-linux_x86_64.whl

# install fasttext
RUN git clone https://github.com/facebookresearch/fastText.git && \
    cd fastText && \
    make && \
    cd ..

RUN pip install fasttext

# install spacy
RUN pip install -U spacy

# install gensim library
RUN pip install --upgrade gensim

# Keras with TensorFlow backend
RUN pip install https://github.com/fchollet/keras/tarball/1.2.2

# update main conda packages
RUN conda update --quiet --yes numpy scipy pandas matplotlib seaborn statsmodels scikit-learn

# some other useful libraries
RUN pip install https://pypi.python.org/packages/source/n/nltk/nltk-3.2.1.tar.gz textblob beautifulsoup4 lxml pydot 

RUN python3 -m textblob.download_corpora
RUN python3 -m spacy download en
RUN python3 -m nltk.downloader stopwords
RUN python3 -m nltk.downloader sentiwordnet

# Switch back to user to avoid accidental container runs as root
USER $NB_USER
