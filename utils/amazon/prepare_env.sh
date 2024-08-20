#!/bin/bash

cd ~
aws s3 cp s3://alexa-science-managed/bgkim/share/others/conda_env/AED_cuda12_1.tar.gz
tar -xvf AED_cuda12_1.tar.gz
conda activate AED_cuda12_1

