#!/bin/sh

JMETER_BIN='/opt/jmeter/bin/jmeter'
TEST_FILE='hello_world.jmx'

if [ ! $1 ]; then
    echo 'example:'
    echo './start.sh 1000'
    exit 1
fi

NUMBER_OF_THREADS=$1
OUTPUT_FOLDER="output/${NUMBER_OF_THREADS}"

RESULTS_FILE="${OUTPUT_FOLDER}/result.csv"
LOG_FILE="${OUTPUT_FOLDER}/log"
REPORT_FOLDER="${OUTPUT_FOLDER}/report"

${JMETER_BIN} -n -t ${TEST_FILE} -l ${RESULTS_FILE} -j ${LOG_FILE} -e -o ${REPORT_FOLDER}
