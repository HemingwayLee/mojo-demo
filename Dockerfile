FROM python:3.8

ARG AUTH_KEY

# Avoid prompts with apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    software-properties-common \
    build-essential \
    curl \
    vim \
    python3-opencv

RUN curl https://get.modular.com | MODULAR_AUTH=$AUTH_KEY sh -
RUN modular auth $AUTH_KEY
RUN modular install mojo
RUN echo 'export MODULAR_HOME="/root/.modular"' >> ~/.bashrc
RUN echo 'export PATH="/root/.modular/pkg/packages.modular.com_mojo/bin:$PATH"' >> ~/.bashrc
RUN echo 'PS1="_# "' >> ~/.bashrc


# Verify Python version
RUN python3 --version
RUN python --version

RUN mkdir -p /home/proj/
COPY . /home/proj/
WORKDIR /home/proj/

RUN pip3 install -r requirements.txt

CMD ["/bin/bash"]
