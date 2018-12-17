circleci build -e GOOGLE_SERVICE_KEY="$(cat key.txt)" -e GOOGLE_PROJECT_ID="k8s-lab-225719" -e GOOGLE_COMPUTE_ZONE="us-east1-b" -e CIRCLE_PROJECT_REPONAME=k8s-infra --job plan-$1
