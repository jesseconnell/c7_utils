#!/bin/bash

function get_script_path() {
    pushd $(dirname $0) > /dev/null
    SCRIPTPATH=$(pwd -P)
    popd > /dev/null
    
    echo $SCRIPTPATH
}
export -f get_script_path


for P in enableX disableX
do
    LNK=/usr/local/bin/$P
    if [ -f $LNK ]; then rm $LNK; fi

    OPT="$1"
    if [ "$OPT" != "-u" ]
    then
        ln -s $(get_script_path)/$P $LNK
        chmod a+x $LNK
    fi
done
