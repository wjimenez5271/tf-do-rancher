 #!/usr/bin/env bash
BASEDIR=${PWD}

cd ${BASEDIR}/server && terraform apply
cd ${BASEDIR}/rancher-stack && terraform apply
cd ${BASEDIR}/nodes && terraform apply
