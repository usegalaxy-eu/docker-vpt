FROM vzgdocker/vpt:1.3

LABEL maintainer="Amirhossein N. Nilchi <nilchia@informatik.uni-freiburg.de>"


RUN pip install --no-cache-dir vpt-plugin-cellpose2
