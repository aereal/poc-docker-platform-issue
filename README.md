# Run

```
[2025-01-21 17:11:00] ✘╹◡╹✘ < docker run --rm app:latest
WARNING: The requested image's platform (linux/arm64) does not match the detected host platform (linux/amd64/v3) and no specific platform was requested
GOARCH=amd64 GOOS=linux build.targetOS=linux build.targetArch=arm64 build.targetPlatform=linux/arm64
```

# Build

```
[2025-01-21 17:09:22] ✘>﹏<✘ < docker build --build-arg GOOS=linux --build-arg GOARCH=amd64 --platform linux/arm64 -t app:latest .
[+] Building 97.5s (14/14) FINISHED                                                                                                  docker:rancher-desktop
 => [internal] load build definition from Dockerfile                                                                                                   0.0s
 => => transferring dockerfile: 515B                                                                                                                   0.0s
 => [internal] load metadata for docker.io/library/debian:12.9                                                                                         0.9s
 => [internal] load metadata for docker.io/library/golang:1.23.5                                                                                       0.9s
 => [internal] load .dockerignore                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                        0.0s
 => [builder 1/6] FROM docker.io/library/golang:1.23.5@sha256:51a6466e8dbf3e00e422eb0f7a97ac450b2d57b33617bbe8d2ee0bddcd9d0d37                         0.0s
 => CACHED [stage-1 1/2] FROM docker.io/library/debian:12.9@sha256:321341744acb788e251ebd374aecc1a42d60ce65da7bd4ee9207ff6be6686a62                    0.0s
 => [internal] load build context                                                                                                                      0.0s
 => => transferring context: 3.74kB                                                                                                                    0.0s
 => CACHED [builder 2/6] WORKDIR /app                                                                                                                  0.0s
 => CACHED [builder 3/6] COPY go.mod ./                                                                                                                0.0s
 => CACHED [builder 4/6] RUN go mod download                                                                                                           0.0s
 => [builder 5/6] COPY . .                                                                                                                             0.1s
 => [builder 6/6] RUN env CGO=0 GOOS=linux GOARCH=amd64 go build -ldflags "-X main.buildTargetOS=linux -X main.buildTargetArch=arm64 -X main.buildTa  96.3s
 => [stage-1 2/2] COPY --from=builder /app/main ./main                                                                                                 0.0s
 => exporting to image                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                0.0s
 => => writing image sha256:b500e26e8255335544ba364bda9352bb78943930177ee57d5a70e70ce8c353a9                                                           0.0s
 => => naming to docker.io/library/app:latest                                                                                                          0.0s
```

# Version

```
[2025-01-21 17:14:47] ✘╹◡╹✘ < docker system info 2>/dev/null
Client:
 Version:    27.2.1-rd
 Context:    rancher-desktop
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.17.1
    Path:     /Users/ryota.nakazawa/.docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.29.5
    Path:     /Users/ryota.nakazawa/.docker/cli-plugins/docker-compose

Server:
 Containers: 9
  Running: 0
  Paused: 0
  Stopped: 9
 Images: 21
 Server Version: 26.1.5
 Storage Driver: overlay2
  Backing Filesystem: extfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 3a4de459a68952ffb703bbe7f2290861a75b6b67
 runc version: 2c9f5602f0ba3d9da1c2596322dfc4e156844890
 init version:
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.6.51-0-virt
 Operating System: Alpine Linux v3.20
 OSType: linux
 Architecture: x86_64
 CPUs: 2
 Total Memory: 3.835GiB
 Name: lima-rancher-desktop
 ID: b748769e-01ab-4dae-a519-02e92a7893d0
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  127.0.0.0/8
 Live Restore Enabled: false
```
