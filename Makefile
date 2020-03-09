#
# Makefile
#


# Docker Tensorflow
DOCKER_DIR = .
DOCKER_IMAGE = tensorblock
DOCKER_CONTAINER = tensorblock-container

# Current working directory
PATH_SHARED = $(shell pwd)

FLAGS = --rm -ti
VOLUME = -v $(PATH_SHARED):/work/tensorpack -v $(HOME)/Datasets:/work/Datasets
DISPLAY = -v="$(HOME)/.Xauthority:/root/.Xauthority:rw" --env="DISPLAY" --net=host
GPU = --gpus all
PORTS = -p 6006:6006 -p 8888:8888
KERNEL_CMD = "jupyter kernelgateway --KernelGatewayApp.ip=0.0.0.0 --KernelGatewayApp.port=8888"

DOCKER_FLAGS = $(FLAGS) --name $(DOCKER_CONTAINER) $(VOLUME) $(DISPLAY) $(GPU)

#############################################
#############################################
#############################################

all: build run

build:
	docker build -t $(DOCKER_IMAGE) $(DOCKER_DIR)

bash:
	docker run $(DOCKER_FLAGS) $(DOCKER_IMAGE) bash

run:
	docker run $(DOCKER_FLAGS) $(DOCKER_IMAGE)

clean:
	docker rm $(DOCKER_CONTAINER)
	docker rmi $(DOCKER_IMAGE)
