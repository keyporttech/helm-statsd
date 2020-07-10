#!/bin/bash

# Copyright 2020 Keyporttech Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

CHART=$1
VERSION=$2
CHART_DIR=$3

WORK_DIR=/tmp/helm-charts
cr upload --token ${GITHUB_TOKEN} --owner keyporttech --git-repo helm-Charts --package-path $CHART_DIR
rm -rf helm-charts;
git clone https://keyporttech-bot:${GITHUB_TOKEN}@github.com/keyporttech/helm-charts.git $WORK_DIR;
mkdir -p helm-charts/charts/$CHART
cp -rf $CHART_DIR/* $WORK_DIR/charts/$CHART
cd $WORK_DIR;
git checkout gh-pages;
helm package charts/$CHART;
mkdir -p .cr-release-packages .cr-index;
mv *.tgz .cr-release-packages;
git fetch --prune;
cr index --charts-repo https://keyporttech.github.io --owner keyporttech --git-repo helm-charts;
cp -f .cr-index/index.yaml ./index.yaml;
git config --global user.email "bot@keyporttech.com";
git config --global user.name "keyporttech-bot";
git add ./index.yaml;
git commit -m "release $CHART:$VERSION";
git push -u origin gh-pages;
