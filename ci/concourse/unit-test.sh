#!/bin/bash

set -e -u

# Set the Maven artifact cache directory inside 'src' so it can be cached by Concourse
export MAVEN_REPO="$PWD/src/.m2"

# Build the Java application, but without running tests just yet
mvn -f src/pom.xml test

# Make this output available to the 'test' Job
# cp -R src/* build
