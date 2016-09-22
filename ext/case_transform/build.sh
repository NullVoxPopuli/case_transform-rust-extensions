rust_path=$(which rustc)
cargo_path=$(which cargo)

if [ -z rust_path ]
then
  echo "rustc is missing. rustup will be installed to provide rustc..."

  if [ -z cargo_path ]
  then
    echo "cargo is missing. rustup will be installed to provide cargo..."

    curl https://sh.rustup.rs -sSf | sh
  fi
fi

echo "rustc and cargo are installed"
echo "rustc: "
echo `which rustc`
echo "cargo: "
echo `which cargo`

if [ -z rust_path ]
then
  echo "Rust still not installed..."
  exit 1
fi

cargo build
