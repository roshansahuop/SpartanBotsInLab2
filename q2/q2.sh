#!/bin/bash

path=$1
echo $(find $path -mindepth 1 -maxdepth 1 -type d | wc -l)
