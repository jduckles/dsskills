FROM node:12    

RUN apt-get update && apt-get install -y imagemagick inkscape && npm install -g svgo 

WORKDIR /data

CMD /bin/bash
