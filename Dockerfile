FROM continuumio/miniconda3

LABEL maintainer="Amirhossein N. Nilchi <nilchia@informatik.uni-freiburg.de>"

COPY vpt_cp2_env.yml /tmp/vpt_cp2_env.yml

RUN conda env create -n vpt_cp2 -f /tmp/vpt_cp2_env.yml -y && \
    conda clean -afy && \
    rm -Rf /root/.cache/pip

ENV PATH=/opt/conda/envs/vpt_cp2/bin:$PATH

RUN echo "conda activate vpt_cp2" >> ~/.bashrc