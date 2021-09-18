# To add disks for automatic longhorn configuration:

export LH_NODE="k8s-node"
kubectl label node $LH_NODE node.longhorn.io/create-default-disk=config
kubectl annotate node $LH_NODE node.longhorn.io/default-disks-config='[{"path":"/mnt/longhorn","allowScheduling":true}]'

