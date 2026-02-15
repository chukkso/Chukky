#!/bin/bash

# This script deletes all GitHub Actions artifacts from a specified repository, due to limitaeion of private repositories which only allow .5gb( 500MB) artifact It uses the GitHub API to list and delete artifacts.
# You get the token from your GitHub account settings under Developer settings > Personal access tokens.


OWNER="chukkso"
#REPO="chukkso.github.io"
PAT="enter your token here call from github secretts


read -t 40 -p "Enter Repo name (e.g. actionsprofile-udemy): " REPO

if [[ -z "$REPO" ]]; then
  echo "Timed out or no input."
  exit 99
fi


curl -s -H "Authorization: token $PAT" \
  "https://api.github.com/repos/$OWNER/$REPO/actions/artifacts?per_page=100" \
  | jq -r '.artifacts[].id' \
  | while read -r artifact_id; do
      echo "Deleting artifact $artifact_id..."
      curl -s -X DELETE -H "Authorization: token $PAT" \
        "https://api.github.com/repos/$OWNER/$REPO/actions/artifacts/$artifact_id"
    done


    ### you can list artifacts with this command:

    # curl -s -H "Authorization: token $PAT" \
    #   "https://api.github.com/repos/$OWNER/$REPO/actions/artifacts?per_page=100" \
    #   | jq '.artifacts[] | {id: .id, name: .name, size_in_bytes: .size_in_bytes, created_at: .created_at}'
