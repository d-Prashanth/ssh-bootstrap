#!/bin/bash


userData=""
date=$(date)

echo "Hello Enter Your Data for the Day"
read userData

echo "$date $userData" >> dataTrackingFile

echo "bye !bye.."
