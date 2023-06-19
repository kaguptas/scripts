# Auto Scaling Group Instance Refresh Script
A bash script that allows you to trigger an AWS Auto Scaling Group (ASG) instance refresh, and monitor its status until completion.

## What the script does
The script takes an ASG name as an argument, and replaces a placeholder in a pre-existing JSON configuration file with this name.

The updated JSON configuration is used to start an instance refresh on the specified ASG.

The script then enters a monitoring loop, querying the status of the instance refresh every minute.

While the status is "Pending" or "In Progress", the script outputs these statuses to the console.

When the status is no longer "Pending" or "In Progress", the script will output the final status of the refresh and exit.

## How to run
Clone this repository and navigate to the script directory.

Make sure that the script file (refresh_asg.sh) is executable. If not, run the following command:

`./refresh_asg.sh YOUR_ASG_NAME`
Replace your_asg_name with the name of the Auto Scaling Group you wish to refresh.
