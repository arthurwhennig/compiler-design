FROM --platform=linux/amd64 registry.inf.ethz.ch/course-su-compiler-design/compiler-design:2026

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends ocamlbuild ocaml-findlib \
    && rm -rf /var/lib/apt/lists/*

USER student
