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
RUN mv ${HOME}/.local/share/jupyter/kernels/iperl /usr/local/share/jupyter/kernels/
USER ${NB_USER}

USER $NB_UID
WORKDIR $HOME

ENTRYPOINT []

EXPOSE 8888
