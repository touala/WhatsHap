Bootstrap: docker
From: centos:centos8

%help
For more information, please consult https://github.com/touala/WhatsHap

# Install dependencies
%post
    # Install basic dependencies
    dnf check-update && dnf upgrade -y && dnf install -y \
        "langpacks-en" \
        "glibc-all-langpacks"

    # Install and setup conda
    curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    sh Miniconda3-latest-Linux-x86_64.sh -b
    rm -rf Miniconda3-latest-Linux-x86_64.sh
    echo -e "\n"'export PATH=$PATH:/root/miniconda/bin' >> ~/.bash_profile
    export PATH=$PATH:/root/miniconda/bin
    source /root/.bashrc
    source /root/.bash_profile
    conda config --set auto_activate_base false
    conda init bash
    
    # Install WhatsHap
    conda install -y -c conda-forge mamba
    mamba create -y -c conda-forge -c bioconda -n whatshap whatshap nomkl

    # Set default behavior
    cat > /.singularity.d/env/99-custom.sh <<EOF
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]WhatsHap:\[\033[33;1m\]\w\[\033[m\]$ "
SINGULARITY_SHELL=/bin/bash
EOF
