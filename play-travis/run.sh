#!/bin/bash

docker exec hw-test bash -c './play-travis/packer_test.sh'
docker exec hw-test bash -c './play-travis/terraform_test.sh'
docker exec hw-test bash -c './play-travis/ansible_test.sh'
