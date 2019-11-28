#!/bin/bash
# There should be an AWS folder in the current directory
# It should contain an AWS "config" file & "credentials" file

# Make sure that the Docker image is generated
docker-compose build .

# Parsing out the profiles and running docker for all of them
grep -E -o "\[(.*)\]" aws/credentials | while read -r line ; do
    line=${line#"["}
    line=${line%"]"}
    echo "Processing Profile: ${line}"
    docker run --rm -v $PWD/reports_${line}:/reports -v $PWD/aws:/root/.aws -e AWS_PROFILE=${line} awsscout2
done

