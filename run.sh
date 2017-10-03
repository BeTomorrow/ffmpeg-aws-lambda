#!/bin/bash

docker build . -t ffmpeg-aws-lambda

docker run -it -v "$PWD":/data ffmpeg-aws-lambda:latest