# podctl
Shell macros for using systemd to manage podman pods.


These macros simplify the process of managing a pod defined in kubernetes-yaml.


## Background
For background on how the integration works see this Red Hat article:
[How to run Kubernetes workloads in systemd with Podman](https://www.redhat.com/sysadmin/kubernetes-workloads-podman-systemd)


TLDR - a systemd template is used, which is not very nice to use syntatically.
It looks like this:


```
systemctl --user start podman-kube@(systemd-escape /path/to/pod/definition.yaml).service
```

with the macros provided here this would become:


```
podctl start /path/to/pod/definition.yaml
```

## Usage

```
podctl [-s/--system] <start / stop / enable / disable> <path/to/pod/definition.yaml>
```

If `--system` flag is provided the pod will be run rootful, otherwise by default it will be rootless.