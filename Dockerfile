FROM rocker/tidyverse:4.4.1

RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    build-essential \
    pandoc \
    texlive-base \
    texlive-fonts-recommended \
    fonts-lmodern \
    libfontconfig1 \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "tinytex::install_tinytex(force = TRUE)" \
    && echo 'PATH="${PATH}:/root/bin"' >> /etc/environment

RUN Rscript -e "\
    packages <- c('ggplot2', 'dplyr', 'knitr', 'readr', 'ggcorrplot', 'pROC', 'rmarkdown', 'tinytex', 'kableExtra'); \
    for(pkg in packages) { \
        cat('Installing', pkg, '\\n'); \
        install.packages(pkg, repos='https://cloud.r-project.org/', dependencies=TRUE); \
        if(!requireNamespace(pkg, quietly=TRUE)) { \
            stop(paste(pkg, 'not installed')) \
        } else { \
            cat(pkg, 'installed successfully', '\\n'); \
        } \
    }"

ENV PATH="${PATH}:/root/bin"

WORKDIR /usr/src/app

COPY . .

RUN Rscript -e "installed <- installed.packages()[,'Package']; print(installed[installed %in% c('kableExtra', 'ggcorrplot')])"

RUN ls -R /usr/src/app

CMD ["Rscript", "-e", "rmarkdown::render('report/final_report.Rmd', output_format='pdf_document')"]