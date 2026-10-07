FROM --platform=linux/amd64 registry.inf.ethz.ch/course-su-compiler-design/compiler-design:2026

RUN sudo apt update && apt install ocamlbuild ocaml-findlib
