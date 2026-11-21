CC ?= cc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra

.PHONY: all c csharp rust test-c clean
all: c

c:
	$(CC) $(CFLAGS) src/c/crevive.c -lm -o crevive-c

csharp:
	dotnet build src/csharp/cRevive.csproj -c Release

rust:
	cargo build --manifest-path src/rust/Cargo.toml --release

test-c: c
	./tests/test_c.sh

clean:
	rm -f crevive-c
	rm -rf src/csharp/bin src/csharp/obj src/rust/target
