#!/bin/bash                                                                                                                                                                       
                                                                                                      
export INPUT_DIR=/path/to/input/mses/
export WORK_DIR=/path/for/intermediate/files/work/
export OUTPUT_DIR=/path/for/output/files/output/
export LOG_DIR=/path/for/logfiles/log/

mkdir -p ${WORK_DIR}
mkdir -p ${OUTPUT_DIR}
mkdir -p ${LOG_DIR}

ulimit -n 10000

export LINC_DATA_ROOT=/path/to/local/LINC/

chmod 755 ${LINC_DATA_ROOT}/scripts/*.py

export PATH=${LINC_DATA_ROOT}/scripts:$PATH
export PYTHONPATH=${LINC_DATA_ROOT}/scripts:$PYTHONPATH


#export APPTAINERENV_CUDA_VISIBLE_DEVICES=0
#export SINGULARITYENV_CUDA_VISIBLE_DEVICES=0

cwltool --no-container \
        --parallel \
        --preserve-entire-environment \
        --outdir ${OUTPUT_DIR} \
        --tmpdir-prefix ${WORK_DIR} \
        --log-dir ${LOG_DIR} \
        --leave-tmpdir \
        --timestamps \
        ${LINC_DATA_ROOT}/workflows/HBA_target.cwl \
        /local/work/e.derubeis/4C6908/mslist_LINC_target.json