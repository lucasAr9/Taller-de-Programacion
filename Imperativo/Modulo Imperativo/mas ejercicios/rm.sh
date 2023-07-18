#!/bin/bash

for file in ./*.o; do
    rm $file
done

for file in ./*.exe; do
    rm $file
done
