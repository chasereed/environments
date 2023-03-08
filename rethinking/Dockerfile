

FROM debian:bullseye-slim

WORKDIR /build
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
USER root
ENV DEBIAN_FRONTEND noninteractive


# System Packages -------------------------------------------------------------

# search for packages here: https://packages.ubuntu.com/

RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc \
        make \ 
        git \
        openssh-client \
        pandoc \
        python3 \
        python3-dev \
        python3-pip \
        r-base-core \
        r-base-dev \
        libopenblas0-pthread \
        libv8-dev \
        littler \
        r-cran-docopt \
        r-cran-littler \
        r-cran-devtools \
        r-cran-irkernel \
	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installBioc.r /usr/local/bin/installBioc.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installDeps.r /usr/local/bin/installDeps.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
	&& rm -rf /var/lib/apt/lists/*


RUN python3 -m pip install \
    jupyterlab \
    radian

COPY install.R /build/install.R
RUN Rscript /build/install.R

COPY extras.R /build/extras.R
RUN Rscript /build/extras.R


RUN useradd cosmo && mkdir /home/cosmo/ && chown cosmo:cosmo /home/cosmo && adduser cosmo staff
USER cosmo
WORKDIR /workspace
ENV SHELL /bin/bash
CMD ["/bin/bash"]

# to create an interactive shell:
# docker run -it --rm -p 8888:8888 -v $(pwd):/workspace chasestolworthy/rethinking /bin/bash

# to start jupyter lab
# docker run -it --rm -p 8888:8888 -v $(pwd):/workspace chasestolworthy/rethinking jupyter lab --ip 0.0.0.0