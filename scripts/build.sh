#!/bin/bash

basepath=$(cd `dirname $0`/../; pwd)

cd $basepath/

main() {
    mkdir -p build/
    cd build/
    rm -rf ./*
    cmake .. -DENABLE_UNIT_TESTS=ON || {
        error_exit "Failed to cmake."
    }

    make || {
        error_exit "Failed to make."
    }

    ./tests || {
        error_exit "Failed to test."
    }
}

error_exit() {
    echo
    echo "Error: $@"
    echo "----------------------------------------------------------------------"
    echo
    exit 1
}

main "$@"
exit 0