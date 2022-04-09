#!/bin/sh

# Pass $PROFILE as env var

ansible-playbook \
  --extra-vars @vars/common.yml \
  --extra-vars @vars/$PROFILE.yml \
  playbook.yml -K
