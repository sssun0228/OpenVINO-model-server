#!/bin/bash
set -ex

TEST_DIRS=tests
DOCKER_OVMS_TAG="ie-serving-ov-base:latest"
export TESTS_SUFFIX="ov-base"
export TESTS_PORTS="9150 9199 5650 5699"

make DOCKER_OVMS_TAG=${DOCKER_OVMS_TAG} docker_build_ov_base

. .venv-jenkins/bin/activate

py.test ${TEST_DIRS}/functional/ -v --test_dir=/var/jenkins_home/test_ovms_models
