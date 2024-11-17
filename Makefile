REPORT = report/final_report.pdf
RMD = report/final_report.Rmd
DATA = data/diabetes.csv
FAKE_DATA = data/diabetes_fake.csv

all: $(REPORT)

$(REPORT): $(RMD) scripts/*.R data/*.csv
	Rscript -e "rmarkdown::render('$(RMD)', output_format='pdf_document')"

clean:
	rm -f $(REPORT) figures/*.png tables/*.md

.PHONY: all clean