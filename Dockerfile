FROM golang:1.23.5 as builder

WORKDIR /app
ARG TARGETPLATFORM TARGETOS TARGETARCH
ARG GOOS=$TARGETOS GOARCH=$TARGETARCH

COPY go.mod ./
RUN go mod download
COPY . .
RUN env CGO=0 GOOS=$GOOS GOARCH=$GOARCH go build -ldflags "-X main.buildTargetOS=${TARGETOS} -X main.buildTargetArch=${TARGETARCH} -X main.buildTargetPlatform=${TARGETPLATFORM}" -o ./main ./cmd/

FROM debian:12.9

COPY --from=builder /app/main ./main
ENTRYPOINT ["./main"]
