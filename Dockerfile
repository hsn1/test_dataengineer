FROM python:3.12-slim

WORKDIR /workspace

# deps système utiles (git pour récupérer certains modèles / outils, build pour certaines wheels)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    curl \
  && rm -rf /var/lib/apt/lists/*

# Jupyter + libs notebook + ML + LLM gratuit
RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir \
    jupyterlab \
    notebook \
    ipykernel \
    pandas \
    numpy \
    matplotlib \
    scikit-learn \
    transformers \
    accelerate \
    sentencepiece \
    torch \
    folium \
    geopy

# (Optionnel) Pour éviter warning sur matplotlib
ENV MPLCONFIGDIR=/tmp/matplotlib

EXPOSE 8888