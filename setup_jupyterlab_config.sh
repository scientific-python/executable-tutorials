#!/usr/bin/env bash
set -eux

mkdir -p ${CONDA_PREFIX}/share/jupyter/lab/settings
cp jupyterlab_config.json ${CONDA_PREFIX}/share/jupyter/lab/settings/overrides.json
