

# Environments

docker files for all my environments


# Extending Environments

## Python 

### Without locked versions 

Add this to install the latest versions at time of build

    RUN python3 -m pip install \
        tensorflow \
        pytorch

### Locked versions

Add this to the dockerfile:

    COPY requirements.txt /build/requirements.txt
    RUN python3 -m pip install -r /build/requirements.txt


Whenever you install new Python packages:

1.  Run `python3 -m pip freeze > requirements.txt` to lock dependencies
2.  Rebuild docker image 