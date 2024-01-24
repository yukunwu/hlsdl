
ifdef OS
	checksum = md5sum
else
	ifeq ($(shell uname), Linux)
		checksum = md5sum
	else
		checksum = md5
	endif
endif

build_osx:
	env GOOS=darwin GOARCH=amd64 go build -o ./bin/hlsdl_osx ./cmd/hlsdl
	@$(checksum) ./bin/hlsdl_osx

build_linux:
	env GOOS=linux GOARCH=amd64 go build -o ./bin/hlsdl_linux ./cmd/hlsdl
	@$(checksum) ./bin/hlsdl_linux

build_linux_arm64:
	env GOOS=linux GOARCH=arm64 go build -o ./bin/hlsdl_linux ./cmd/hlsdl
	@$(checksum) ./bin/hlsdl_linux

build_windows:
	env GOOS=windows GOARCH=amd64 go build -o ./bin/hlsdl_windows.exe ./cmd/hlsdl
	@$(checksum) ./bin/hlsdl_windows.exe

build: build_osx build_linux build_linux_arm64 build_windows