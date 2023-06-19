#!/bin/bash

# check if the input parameter is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 asg_name"
    exit 1
fi

asg_name="$1"

# create a temporary file
temp_file=$(mktemp)

# read the json file and replace CHANGEME with the provided argument
sed 's/CHANGEME/'"$asg_name"'/' config.json > "$temp_file"

# run the start-instance-refresh command with the updated json
aws autoscaling start-instance-refresh --cli-input-json file://"$temp_file" --region us-west-2

# remove the temporary file
rm "$temp_file"

while true
do
    # get the status of the instance refresh
    status=$(aws autoscaling describe-instance-refreshes --auto-scaling-group-name "$asg_name" --query 'InstanceRefreshes[0].Status' --region us-west-2 --output text)

    # check the status
    if [ "$status" = "Pending" ]; then
        echo "Pending..."
    elif [ "$status" = "InProgress" ]; then
        echo "In Progress..."
    else
        echo "The refresh status is: $status"
        break
    fi

    # wait for one minute
    sleep 60
done
