FROM centos:centos8

ARG DEBIAN_FRONTEND=noninteractive

# RUN dnf check-update
RUN dnf upgrade -y
RUN dnf install -y \
    "langpacks-en" \
    "glibc-all-langpacks"

# Install remaining dependencies.
COPY postInstall /
RUN bash /postInstall
