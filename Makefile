export CGO_ENABLED=1

default: clean linux windows

clean:
	go clean -x

windows:
	GOOS=windows GOARCH=amd64 CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -ldflags="-s -w" -o "bfdns_amd64.exe" bfdns.go; upx --best --lzma bfdns_amd64.exe
linux:
	GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o "bfdns_amd64" bfdns.go; upx --best --lzma bfdns_amd64
	GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o "bfdns_amd64_uncompressed" bfdns.go
	
