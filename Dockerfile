FROM ubuntu:18.04

RUN apt update
RUN apt install -y \
    git     \
    nodejs  \
    npm     \
    make    \
    curl    \
    jq      \
    unzip   \
    chromium-bsu \
    chromium-chromedriver \
    python3 \
    python3-pip

# Install and default to python3
RUN  update-alternatives --remove python /usr/bin/python2
RUN  update-alternatives --install /usr/bin/python python /usr/bin/python3 1

RUN npm install sass-loader node-sass webpack -g


RUN echo "alias python=python3" >> /etc/profile
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN echo "PATH=\$PATH:/usr/lib/chromium-browser/" >> /etc/profile

ADD requirements.txt /app/
WORKDIR /app
RUN pip3 install -r requirements.txt
