# geektechstuff
# using a lot of https://hub.docker.com/r/philm/ansible_playbook/dockerfile/

# Alpine is a lightweight version of Linux.
# apline:latest could also be used
FROM python:3.10.11-buster

WORKDIR /base

RUN mkdir ~/.ssh

# Over rides SSH Hosts Checking
RUN echo "host *" >> ~/.ssh/config &&\
  echo "StrictHostKeyChecking no" >> ~/.ssh/config

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_SSH_PIPELINING True

COPY requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

ENTRYPOINT ["/bin/bash"]