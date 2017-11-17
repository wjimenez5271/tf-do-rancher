 #!/usr/bin/env bash
BASEDIR=${PWD}
c=0
if [ -z "$SLEEPTIME" ]
then
    SLEEPTIME=30
fi

echo "\n------\nApplying Rancher server TF plan\n"
cd ${BASEDIR}/server && terraform apply || exit 1

echo "\n------\nApplying Rancher stack TF plan\n"
until [ $c -ge 7 ]
do
   cd ${BASEDIR}/rancher-stack && terraform apply && break
   c=$(($c+1))
   echo "\n------\nTerraform apply of Rancher Stack failed, probably still waiting for server to be ready. Sleeping "${SLEEPTIME}"\n"
   sleep ${SLEEPTIME}
done
echo "\n------\nApplying node TF plan\n"
cd ${BASEDIR}/nodes && terraform apply
