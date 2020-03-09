FROM "tensorflow/tensorflow:1.15.2-gpu-py3"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install build-essential && \
    apt-get -y update

RUN apt-get install -y git nano wget
RUN pip install --upgrade pip

# RUN pip3 install tensorflow==1.6.0
# RUN pip3 install tensorflow-gpu==1.6.0

# ENV PATH="${PATH}:/root/.local/bin"

# RUN apt update && apt install -y libsm6 libxext6 libsm6 libxrender1 libfontconfig1
RUN pip install cython
RUN pip install 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'
RUN pip install scipy
RUN apt-get install -y python3-opencv
RUN pip install 'git+https://github.com/tensorpack/tensorpack.git'
RUN apt-get install -y python-tk
RUN apt-get install -y python-prctl
# RUN pip install numpy
# RUN pip install matplotlib
# RUN pip install numpy
# RUN pip install pandas
# RUN pip install sklearn
# RUN pip install Pillow

WORKDIR /work/tensorpack/examples/FasterRCNN

# CMD ["bash"]

CMD ["bash", "./train.py --config BACKBONE.WEIGHTS=/home/carlos/tensorpack/ImageNet-R50-AlignPadding.npz DATA.BASEDIR=/home/carlos/Datasets/COCO2017"]

#./predict.py /work/Datasets/COCO2017/val2017/000000000285.jpg --load /work/tensorpack/ImageNet-R50-AlignPadding.npz --config config.py
