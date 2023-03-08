
# goals for this image:
# - everything for a dev container (vs code or github codespaces)
# - everything for a basic python or r project (ideally use debian packages)
# - everything to run jupyter notebooks 

FROM debian:bullseye

# prevent errors in a pipeline from being masked
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /build

RUN useradd cosmo && mkdir /home/cosmo/ && chown cosmo:cosmo /home/cosmo && adduser cosmo staff

# search for packages here: https://packages.debian.org/index
# python packages: https://packages.debian.org/bullseye/python/
# r packages: https://packages.debian.org/bullseye/gnu-r/
# Do not need to run apt-get upgrade when using official images
#   see https://github.com/docker-library/official-images/pull/13443#issuecomment-1297829291
RUN apt-get update && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        ed \
        gcc \
        gfortran \
        git \
        julia \
        jupyter \
        jupyter-notebook \
        less \
        libc6 \
        libstdc++6 \
        libv8-dev \
        locales \
        make \
        openssh-client \
        openssh-server \
        pandoc \
        python3 \
        python3-dev \
        python3-matplotlib \
        python3-numpy \
        python3-pandas \ 
        python3-pip \
        python3-scipy \
        python3-seaborn \
        python3-sklearn \
        python3-statsmodels \
        r-base-core \
        r-base-dev \
        r-cran-bh \
        r-cran-devtools \
        r-cran-glmnet \
        r-cran-irkernel \
        r-cran-rmarkdown \
        r-cran-rstan \
        r-cran-rstanarm \
        r-cran-tidyverse \
        tar \
        unzip \
        vim-tiny \
        virtualenv \
        wget \
        zsh \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# install the R jupyter kernel
RUN R -e "IRkernel::installspec(user = FALSE)"

# switch back to root if you need to extend image
USER cosmo

CMD ["/bin/bash"]


# to create an interactive shell:
# docker run -it --rm -v chasestolworthy/base /bin/bash

# to start jupyter lab
# docker run -it --rm -p 8888:8888 -v $(pwd):/workspace -w /workspace chasestolworthy/base jupyter notebook --ip 0.0.0.0

