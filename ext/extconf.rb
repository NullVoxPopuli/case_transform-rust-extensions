# frozen_string_literal: true
# NOTE: Thi file must be tab-delimited
require 'mkmf'

create_makefile 'rutgem'

mkf = %{
.ONESHELL:
all:
	pwd
	ls -la
	cd ./case_transform
	pwd
	cargo build

clean:
	rm -rf ./case_transform/target

install: ;
}

File.write('Makefile', mkf)
