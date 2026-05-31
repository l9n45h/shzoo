#!/bin/sh

declare -a exported_tmp;
declare -a exported_const;

function fprs_unexport_tmp
{
    for var in ${exported_tmp[@]};
    do
        export -n $var;
    done;
}

function fprs_check_pass_or_error
{
    if [ $1 ]; then
        echo $2;
        export CRITICAL_FLAGS_PARSER_ERROR=1;
        flags_unexport_tmp;
    fi;
}

function fprs_export_tmp
{
    flags_check_pass_or_error "$#!=2" "Error! fprs_export_tmp - too much or not enouth args"
    exported_tmp+=$1;
}

function fprs_export_const
{
    flags_check_pass_or_error "$#!=2" "Error! fprs_export_const - too much or not enouth args"
    export $1;
}

export exported_tmp;
export exported_const;
export fprs_unexport_tmp;
export fprs_check_pass_or_error;
export fprs_export_tmp;
export fprs_export_const;