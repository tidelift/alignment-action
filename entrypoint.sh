#!/bin/bash

set -e
set -o pipefail
set -x

echo "Downloading latest CLI"
case "$(uname -s)" in
Linux)
    curl -s -o ./tidelift https://download.tidelift.com/cli/tidelift
    ;;
Darwin)
    curl -s -o ./tidelift https://download.tidelift.com/cli/tidelift_darwin
    ;;
*)
    echo "Unable to detect OS. Please contact Tidelift support at support@tidelift.com"
    ;;
esac
chmod +x ./tidelift

echo "Current Tidelift CLI version"
./tidelift version

echo "Uploading manifests for alignment"
./tidelift alignment save --revision ${GITHUB_SHA} --branch ${GITHUB_REF##*/} --directory ${GITHUB_WORKSPACE}
echo "Waiting for the alignment to start"
sleep 15
./tidelift status --wait ${GITHUB_SHA}
