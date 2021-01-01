# this command run by bash.
# T.B.D. challenge makefile. 

BIN_PATH=../../../bin/external/sample/
go build -o "${BIN_PATH}/fibonacci.so" -buildmode=c-shared fibonacci.go

