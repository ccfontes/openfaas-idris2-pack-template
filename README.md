# openfaas-idris2-pack-template
An [OpenFaaS](https://github.com/openfaas) template for writing functions in [Idris 2](https://www.idris-lang.org/) using [pack](https://github.com/stefan-hoeck/idris2-pack) to manage dependencies.

## Installing Chez Scheme on Apple Silicon
Quoting [Idris 2 documentation](https://github.com/idris-lang/Idris2/blob/main/INSTALL.md#installing-chez-scheme-on-apple-silicon):

> The official version of chez scheme does not yet support Apple Silicon. So, on macOS with Apple Silicon (e.g. M1 and M2 macs), you will need to build and install the Racket fork of chez scheme.
```
git clone git@github.com:racket/ChezScheme.git
cd ChezScheme
git submodule init
git submodule update
arch=tarm64osx
./configure --pb
make ${arch}.bootquick
./configure --threads
make
sudo make install
```

## TODO
- [ ] Provision pack
- [ ] Provision Idris 2
- [ ] Use non-root user
- [ ] Support OpenFaaS Function
- [ ] Add Hello world Function example
- [ ] Add more example Functions
