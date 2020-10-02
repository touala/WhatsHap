FROM rocker/r-ver:3.5.3

ARG DEBIAN_FRONTEND=noninteractive

RUN dnf check-update && dnf upgarde -y && dnf install -y \
    "langpacks-en" \
    "glibc-all-langpacks"

# Install remaining dependencies.
COPY postInstall /
RUN bash /postInstall
