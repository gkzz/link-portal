# pull official base image
FROM python:3.7.9-buster

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# add user
ARG APPUSER_UID=1000
ARG APPUSER=app
ARG APPUSER_PASSWORD=app
　RUN useradd -m --uid ${APPUSER_UID} --groups sudo ${APPUSER} \
  && echo ${APPUSER}:${APPUSER_PASSWORD} | chpasswd

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
ARG HOME_DIR=/home/app
RUN mkdir -p ${HOME_DIR} \
  && chown -R ${APPUSER}:${APPUSER} ${HOME_DIR}
RUN mkdir -p ${HOME_DIR}/static \
  && chown -R ${APPUSER}:${APPUSER} ${HOME_DIR}/static

WORKDIR ${HOME_DIR}

# install postgres client
RUN apt-get update \
    && apt-get install -y \
    locales locales-all \
    postgresql \
    vim
#    vim \
#    tree

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

#RUN tree -L 3 -d


# su - ${APPUSER}
USER ${APPUSER}

# run entrypoint.sh
CMD ["bash", "-xe", "scripts/entrypoint.nginx.sh"]
