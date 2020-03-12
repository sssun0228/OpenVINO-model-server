#!/bin/bash
set -ex

TEST_DIRS=tests
DOCKER_OVMS_TAG="ie-serving-clearlinux:latest"
export TESTS_SUFFIX="clearlinux"

make DOCKER_OVMS_TAG=${DOCKER_OVMS_TAG} docker_build_clearlinux

. .venv-jenkins/bin/activate

py.test ${TEST_DIRS}/functional/ -v --test_dir=/var/jenkins_home/test_models_mzeglars
