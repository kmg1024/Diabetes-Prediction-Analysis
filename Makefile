REPORT = report/final_report.pdf
RMD = report/final_report.Rmd

PACKAGES = ggplot2 dplyr knitr readr kableExtra ggcorrplot pROC

all: install_packages report

install_packages:
	Rscript -e "packages <- c($(PACKAGES)); new_packages <- packages[!
	(packages %in% installed.packages()[,\"Package\"])]; 
	if(length(new_packages)) install.packages(new_packages, repos='http://cran.rstudio.com/')"

report: $(REPORT)

$(REPORT): $(RMD) scripts/*.R data/*.csv
	Rscript -e "rmarkdown::render('$(RMD)', output_format='pdf_document')"
	
clean:
	rm -f $(REPORT) figures/*.png tables/*.md
	
.PHONY: all clean install_packages report
