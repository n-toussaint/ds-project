#########
# Global Install
#########

FROM python:3.10 AS base

COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt


#########
# Dev Only Install
#########

FROM base AS dev

COPY dev-requirements.txt dev-requirements.txt 
RUN pip install -r dev-requirements.txt


COPY src .

#########
# Prod Only Install
#########

FROM base AS prod