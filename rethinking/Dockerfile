
FROM chasestolworthy/base

USER root

COPY install.r /build/install.r
RUN Rscript /build/install.r

USER cosmo

# to create an interactive shell:
# docker run -it --rm -v chasestolworthy/rethinking /bin/bash

# to start jupyter lab
# docker run -it --rm -p 8888:8888 -v $(pwd):/workspace -w /workspace chasestolworthy/rethinking jupyter notebook --ip 0.0.0.0
