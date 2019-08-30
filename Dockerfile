FROM codait/max-base:v1.1.1

ARG model_bucket=http://max-assets.s3-api.us-geo.objectstorage.softlayer.net/object-detector/1.0
ARG model_file=mymodel.tar.gz
ARG data_file=mydata.tar.gz

WORKDIR /workspace

# mymodel.tar.gz
RUN wget -nv --show-progress --progress=bar:force:noscroll https://uce113c0a2cb7f3726c4182969d0.dl.dropboxusercontent.com/cd/0/get/Anm-SAer0l1QgBY5IVoCagVJK88PLOXixEhU6_mFlzBKsPnxPrFrhK7aLZIE8f-7C5DmoRICNrhbx1OwvwNz-3nG5aTImpzM4hrD0EkWs3D6dlnKD3rAG2bVAocpbeASdXQ/file?dl=1# --output-document=assets/${model_file} && \
  tar -x -C assets/ -f assets/${model_file} -v && rm assets/${model_file} 

# mydata.tar.gz
RUN wget -nv --show-progress --progress=bar:force:noscroll https://uc375b8eafcd61be5b524d5a7334.dl.dropboxusercontent.com/cd/0/get/AnkF6tb0tF1zF9b3OkvSZIO0Eb2AocY9oNnwBPtleNWachcrHn-tT6-VuID9hl72eBCFT8_OVUn3xqOQHG6pj5EXxtGg5bVVfM3xNYex2O-Tj2GHLU955YYCq6u-tfhbLCs/file?dl=1# --output-document=assets/${data_file} && \
  tar -x -C assets/ -f assets/${data_file} -v && rm assets/${data_file}

RUN wget -nv --show-progress --progress=bar:force:noscroll https://github.com/IBM/MAX-Object-Detector-Web-App/archive/v1.2.tar.gz && \
  tar -xf v1.2.tar.gz && rm v1.2.tar.gz

RUN mv ./MAX-Object-Detector-Web-App-1.2/static static

COPY requirements.txt /workspace
RUN pip install -r requirements.txt

COPY . /workspace

EXPOSE 5000

CMD python app.py
