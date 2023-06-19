# Auto Scaling Group Instance Refresh Script
A bash script that allows you to trigger an AWS Auto Scaling Group (ASG) instance refresh, and monitor its status until completion.


## What the script does
The script takes an ASG name as an argument, updates a required JSON config file to specify the details of the instance-refresh, and then runs the refresh.

The script then enters a monitoring loop, querying the status of the instance refresh every minute.


## How to run
Make sure that the script file (refresh_asg.sh) is executable. If not, run the following command:

`./refresh_asg.sh YOUR_ASG_NAME`\
\
Replace your_asg_name with the name of the Auto Scaling Group you wish to refresh.
