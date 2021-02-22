#!/bin/bash

set -e -u

# Set the
export MAVEN_REPO="$PWD/.m2"

# Package the app. We assume that we've already run unit tests in the previous Job
mvn -f src/pom.xml compile jib:build -DskipTests=true

