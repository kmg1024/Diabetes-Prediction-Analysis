REPORT = report/final_report.pdf
RMD = report/final_report.Rmd

all: report

report: $(REPORT)

$(REPORT): $(RMD) scripts/*.R data/*.csv data/*.RDS
	docker run --rm \
		-v "$(DOCKER_PATH)/report:/usr/src/app/report" \
		-v "$(DOCKER_PATH)/scripts:/usr/src/app/scripts" \
		-v "$(DOCKER_PATH)/data:/usr/src/app/data" \
		kmg1024/diabetes-prediction-analysis:latest

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),MINGW64_NT-10.0)
    DOCKER_PATH := /$(shell echo $(PWD) | sed 's|\\\\|/|g')
else
    DOCKER_PATH := $(PWD)
endif

docker-build:
	docker build --no-cache -t kmg1024/diabetes-prediction-analysis:latest .

docker-run:
	@echo "Running Docker container to generate the report..."
	docker run --rm \
		-v "$(DOCKER_PATH)/report:/usr/src/app/report" \
		-v "$(DOCKER_PATH)/scripts:/usr/src/app/scripts" \
		-v "$(DOCKER_PATH)/data:/usr/src/app/data" \
		kmg1024/diabetes-prediction-analysis:latest

clean:
	rm -f $(REPORT) figures/*.png tables/*.md tables/*.tex

.PHONY: all clean report docker-build docker-run
