#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Required two args" 1>&2
  exit 1
fi

script="ansible-playbook -t $2 -i 'localhost,' ansible/setup.yml"
${script}

echo $1
