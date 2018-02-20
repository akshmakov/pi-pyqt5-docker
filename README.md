# pi-pyqt5-docker
Raspberry Pi Compatible (arm32v7) PyQT5 (python3) Source Built Docker Image. Used to deploy PyQT5 applications with docker while the official repository does not yet


This image is based on `arm32v7/debian:stretch` and replicates the environment of the current release of raspbian to some extent. It is tested to work with raspberry pi

The image follows the build steps described [in this stackexchange answer](https://raspberrypi.stackexchange.com/a/63058/71180) 



[**Github Project**](https://github.com/akshmakov/pi-pyqt5-docker) `akshmakov/pi-pyqt5-docker`
[**Dockerhub Image**](https://hub.docker.com/r/akshmakov/piqt5) `akshmakov/piqt5`



## Usage

Extend the image to create users and install necessary applications

**Dockerfile**

    from akshmakov/piqt5

    run adduser --uid $my_uid --disable-password --gecos "" developer && mkdir /app && chown -R developer:developer /app


    copy . /app

    user developer

    workdir /app
    
    run pip install -r /app/requirements.txt

    entrypoint ['python3', '/app/run.py']

To run this image with X exposed, you must share with the docker image your Xorg socket and DISPLAY variable. 

    docker run --rm -it -e "DISPLAY=$DISPLAY" -v '/tmp/.X11-unix:/tmp.X11-unix' my-piqt5-image APP ARGS

While it is not technically necessary to run a seperate user, if you are sharing the display of a logged in user, it makes life easier.








    
    

    
    


    



