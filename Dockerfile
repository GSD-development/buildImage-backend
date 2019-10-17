FROM ubuntu:bionic

RUN apt update
RUN apt install -y \
    git     \
    nodejs  \
    npm     \
    make    \
    curl    \
    jq      \
    unzip   \
    python3 \
    python3-pip

# Install and default to python3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.6 3
RUN update-alternatives --set python /usr/bin/python3.6


WORKDIR /app

RUN npm install \
    npm         \
    node-sass   \
    webpack     \
    eslint      \
    http-server \
    chokidar    \
    chokidar-cli \
    jshint        \
    autoprefixer \
    serverless@1.49.0 \
    pugify@2.2.0   \
    -g --allow-root --unsafe-perm --no-optional

#    sass-loader \
# add the npm stuff to the path
#ENV PATH "RPATH:/root/.npm"

# This build image is also used for development.  We
# expose port 8000 for the http server for test development
EXPOSE 8000


#RUN echo "alias python=python3" >> /etc/profile
RUN ln -s /usr/bin/pip3 /usr/bin/pip
ADD requirements.txt /app/
WORKDIR /app
RUN pip3 install -r requirements.txt
