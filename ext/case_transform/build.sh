command_exists() {
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

  $HOME/.cargo/bin/cargo build --release
}

CARGO_SOURCE_LINE='source $HOME/.cargo/env'
ensure_cargo_sourced() {
  FILE=~/.bash_profile
  grep -q "$CARGO_SOURCE_LINE" "$FILE" || echo "$CARGO_SOURCE_LINE" >> "$FILE"
}

if ! type rustc > /dev/null; then
  echo "rustc is missing. rustup will be installed to provide rustc..."

  curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

  ensure_cargo_sourced
else
  echo "rustc exists..."
fi

build
