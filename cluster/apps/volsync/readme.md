# RESTORE EXAMPLE

https://volsync.readthedocs.io/en/stable/usage/restic/index.html#performing-a-restore

```
---
apiVersion: volsync.backube/v1alpha1
kind: ReplicationDestination
metadata:
  name: esphome-restore
  namespace: default
spec:
  trigger:
    manual: restore-once
  restic:
    repository: esphome-restic-secret
    # Use an existing PVC, don't provision a new one
    destinationPVC: config-esphome-0
    copyMethod: Direct
    moverSecurityContext:
      runAsUser: 568
      runAsGroup: 568
     fsGroup: 568
```