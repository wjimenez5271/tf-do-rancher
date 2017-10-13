#!/usr/bin/env bash
BASEDIR=${PWD}

cd ${BASEDIR}/server && terraform destroy -force
cd ${BASEDIR}/rancher-stack && terraform destroy -force
cd ${BASEDIR}/nodes && terraform destroy -force
