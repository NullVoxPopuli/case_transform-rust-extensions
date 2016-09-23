command_exists () {
  type "$1" &> /dev/null ;
}

build() {
  echo ""
  echo "rustc: $(which rustc)"
  echo "cargo: $(which cargo)"
  echo ""

  if ! command_exists rustc
  then
    echo "Rust still not installed..."
    exit 1
  fi

  cargo build --release
}

echo ""
echo "current directory"
echo `pwd`
echo ""

if ! command_exists rustc
then
  echo "rustc is missing. rustup will be installed to provide rustc..."

  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y
fi

build
