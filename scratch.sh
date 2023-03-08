
# run docker container
docker run -it --rm chasestolworthy/base /bin/bash

# list all packages installed on debian
apt list --installed

# search for installed package by name 
apt list --installed | grep r-cran-bh