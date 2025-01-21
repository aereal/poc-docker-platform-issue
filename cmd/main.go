package main

import (
	"fmt"
	"runtime"
)

var (
	buildTargetOS       string
	buildTargetArch     string
	buildTargetPlatform string
)

func main() {
	fmt.Printf(
		"GOARCH=%s GOOS=%s build.targetOS=%s build.targetArch=%s build.targetPlatform=%s",
		runtime.GOARCH, runtime.GOOS,
		buildTargetOS, buildTargetArch, buildTargetPlatform,
	)
	fmt.Println()
}
