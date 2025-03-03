FROM continuumio/miniconda3

LABEL maintainer="Amirhossein N. Nilchi <nilchia@informatik.uni-freiburg.de>"

COPY vpt_cp2_env.yml /tmp/vpt_cp2_env.yml

RUN conda env create -n vpt -f /tmp/vpt_cp2_env.yml -y

ENV PATH=/opt/conda/envs/vpt/bin:$PATH

RUN echo "conda activate vpt" >> ~/.bashrc