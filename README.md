```text

           8888888b.
           888   Y88b
           888    888
           888   d88P  .d88b.  .d8888b  888  888 88888b.d88b.   .d88b.
           8888888P"  d8P  Y8b 88K      888  888 888 "888 "88b d8P  Y8b
           888 T88b   88888888 "Y8888b. 888  888 888  888  888 88888888
           888  T88b  Y8b.          X88 Y88b 888 888  888  888 Y8b. 
           888   T88b  "Y8888   88888P'  "Y88888 888  888  888  "Y8888
```

This project contains the source code for generating a my resume using [groff](https://www.gnu.org/software/groff/).

## Prerequisites

You need to have `groff` installed on your system.

### Install groff

#### macOS (using Homebrew)

```
brew install groff
```

#### Linux (Debian/Ubuntu)

```
sudo apt-get update
sudo apt-get install groff
```

#### Linux (Fedora)

```
sudo dnf install groff
```

#### Linux (Arch)

```
sudo pacman -S groff
```

## Generating the PDF

To compile the resume and generate a PDF, run:

```
make
```

You can use auto reload by typing

```
./watch.sh
```

This will produce `cleiton-loiola.pdf` in the current directory.

## License

See [LICENSE](LICENSE) for details.
