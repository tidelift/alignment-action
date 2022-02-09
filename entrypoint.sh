#!/bin/bash

set -e
set -o pipefail
set -x

echo "Downloading latest CLI"
curl -s -o ./tidelift https://download.tidelift.com/cli/tidelift
chmod +x ./tidelift

echo "Current Tidelift CLI version"
./tidelift version

export TIDELIFT_GO_NO_RESOLVE=1                                                                                                      
export TIDELIFT_MAVEN_NO_RESOLVE=1                                                                                                      
export TIDELIFT_GRADLE_NO_RESOLVE=1                                                                                                      

echo "Uploading manifests for alignment"
./tidelift alignment save --revision ${GITHUB_SHA} --branch ${GITHUB_REF##*/} --directory ${GITHUB_WORKSPACE}
echo "Waiting for the alignment to start"
sleep 15
./tidelift status --wait ${GITHUB_SHA}
