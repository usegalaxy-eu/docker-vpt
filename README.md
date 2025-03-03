[![Docker Repository on Quay](https://quay.io/repository/bgruening/vpt/status "Docker Repository on Quay")](https://quay.io/repository/bgruening/vpt)

# docker-vpt

Docker image with [VPT](https://github.com/Vizgen/vizgen-postprocessing) (The Vizgen Post-processing Tool) version 1.3.0 and [cellpose](https://github.com/MouseLand/cellpose) version 2.2.3

To build this container you can use the following command:

```bash
docker build -t CONTAINER_NAME .
```

The container is stored on Quay.io and you can get it via:

```bash
docker pull quay.io/bgruening/vpt:1.3.0
```

to analyze your data with the container:

```bash
docker run -it -v ./your_local_directory/:/directory_on_container CONTAINER_NAME:tag bash
```

