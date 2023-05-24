FROM ubuntu:latest
# use the latest LTS of the ubuntu base image

# USAGE: docker run -it -v ~/raspberry/hello:/build lorenzmende/pi-cross-compile

LABEL de.lorenzmende.pi-cross-compile.original_author="docker@mitchallen.com"
LABEL de.lorenzmende.pi-cross-compile.author="https://github.com/LorenzMende"

LABEL de.lorenzmende.pi-cross-compile="{\"Description\":\"Cross Compile for Raspberry Pi\",\"Usage\":\"docker run -it -v ~/myprojects/mybuild:/build lorenzmende/pi-cross-compile\",\"Version\":\"0.1.0\"}"

RUN apt-get update && apt-get install -y git build-essential

RUN git clone --progress --verbose https://github.com/raspberrypi/tools.git --depth=1 pitools

ENV BUILD_FOLDER /build

WORKDIR ${BUILD_FOLDER}

CMD ["/bin/bash", "-c", "make", "-f", "${BUILD_FOLDER}/Makefile"]
# CMD ["make", "clean"]
