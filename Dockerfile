FROM milescsmith/jupyter-perl

ARG NB_USER=jovyan
ARG NB_UID=1000
ARG NB_GID=100
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
COPY jupyter_notebook_config.py /etc/jupyter/
RUN chown -R ${NB_UID} ${HOME}
RUN apt-get update --fix-missing && \
    apt-get dist-upgrade -y && \
    apt-get install --no-install-recommends -y \
        libssl-dev && \
    apt-get clean && \
    rm -rf /tmp/downloaded_packages/* && \
    rm -rf /var/lib/apt/lists/*
RUN /usr/local/bin/cpanm --notest install DDP LWP::Protocol::https

USER $NB_UID
WORKDIR $HOME
RUN iperl


ENTRYPOINT []

EXPOSE 8888
CMD ["iperl","notebook"]
