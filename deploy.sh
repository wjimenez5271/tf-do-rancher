 #!/usr/bin/env bash
BASEDIR=${PWD}
c=0
sleeptime=30

echo "\n------\Applying Rancher server TF plan\n"
cd ${BASEDIR}/server && terraform apply

echo "\n------\Applying Rancher stack TF plan\n"
until [ $c -ge 7 ]
do
   cd ${BASEDIR}/rancher-stack && terraform apply && break
   c=$(($c+1))
   echo "\n------\nTerraform apply of Rancher Stack failed, probably still waiting for server to be ready. Sleeping "${sleeptime}"\n"
   sleep ${sleeptime}
done
echo "\n------\Applying node TF plan\n"
cd ${BASEDIR}/nodes && terraform apply
