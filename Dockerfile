# syntax=docker/dockerfile:1.7

FROM python:3.12-slim-bookworm AS deps

LABEL maintainer="Amirhossein N. Nilchi <nilchia@informatik.uni-freiburg.de>"

ENV DEBIAN_FRONTEND=noninteractive
ENV VENV_PATH=/opt/vpt-venv
ENV PATH=/opt/vpt-venv/bin:$PATH
ENV UV_HTTP_TIMEOUT=300
ENV UV_HTTP_CONNECT_TIMEOUT=60
ENV UV_HTTP_RETRIES=10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        libglib2.0-0 \
        libgomp1 \
        libsm6 \
        libvips42 \
        libxext6 \
        libxrender1 && \
    rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=cache,target=/root/.cache/uv \
    python -m pip install --no-cache-dir --upgrade pip uv && \
    uv venv "$VENV_PATH" --python 3.12

RUN ls . && uv pip install --refresh-package vpt-plugin-cellpose2 \
        --python "$VENV_PATH/bin/python" --upgrade \
        --extra-index-url https://download.pytorch.org/whl/cpu \
        --index-strategy unsafe-best-match \
        "torch==2.4.1+cpu" \
        "torchvision==0.19.1+cpu" \
        "safetensors" \
        "vpt[all] @ git+https://github.com/bgruening/vizgen-postprocessing.git@refs/heads/py312" \
        "spatialdata>=0.7.2" \
        "spatialdata-io>=0.6.0" \
        "anndata>=0.12.10" \
        "ome-zarr<=0.13.0" \
        "rioxarray==0.20.0"

FROM python:3.12-slim-bookworm AS runtime

LABEL maintainer="Amirhossein N. Nilchi <nilchia@informatik.uni-freiburg.de>"

ENV DEBIAN_FRONTEND=noninteractive
ENV VENV_PATH=/opt/vpt-venv
ENV PATH=/opt/vpt-venv/bin:$PATH

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libglib2.0-0 \
        libgomp1 \
        libsm6 \
        libvips42 \
        libxext6 \
        libxrender1 \
        zip \
        unzip && \
    rm -rf /var/lib/apt/lists/*

COPY --from=deps /opt/vpt-venv /opt/vpt-venv
