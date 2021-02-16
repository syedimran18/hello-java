#!/bin/bash

set -e -u

# Build the Java application, but without running tests just yet
mvn -f src/pom.xml clean package -DskipTests=true

# Make this output available to the 'test' Job
cp -R src/* build
