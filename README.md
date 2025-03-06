[![Docker Repository on Quay](https://quay.io/repository/bgruening/vpt/status "Docker Repository on Quay")](https://quay.io/repository/bgruening/vpt)

# docker-vpt

Docker image with [VPT](https://github.com/Vizgen/vizgen-postprocessing) (The Vizgen Post-processing Tool) version 1.3.0 and [cellpose](https://github.com/MouseLand/cellpose) version 2.2.3

## How to build the container

To build this container you can use the following command:

```bash
git clone https://github.com/usegalaxy-eu/docker-vpt.git
cd docker-vpt
docker build -t CONTAINER_NAME .
```

## How to pull the container from Quay.io

The container is stored on Quay.io and you can get it via:

```bash
docker pull quay.io/bgruening/vpt:1.3.0-1
```

## How to use the container

To analyze your data with the container:

```bash
docker run -it -v ./your_local_directory/:/directory_on_container CONTAINER_NAME:tag bash
```

## How to install vpt via conda environment

To use vpt in a conda environment you can use the "vpt_cp2_env.yml" file and then install vpt via:

```bash
conda env create -n ENVIRONMENT_NAME -f vpt_cp2_env.yml -y
conda activate ENVIRONMENT_NAME
```
