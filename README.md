## To run CI Locally:

1. Download the Google service account key file
2. Save it into `key.txt` as the correct format:
`cat $KEY_FILE_PATH | awk '{printf "%s ",$0} END {print ""}' > key.txt`
3. Run `make plan-staging` or `make plan-prod` to run planning stages locally
