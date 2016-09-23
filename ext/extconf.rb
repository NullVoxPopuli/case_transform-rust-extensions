# frozen_string_literal: true
# NOTE: This file must be tab-delimited
require 'mkmf'

create_makefile 'rutgem'

mkf = %(
.ONESHELL:
all:
	cd case_transform
	sh ./build.sh

clean:
	rm -rf ./case_transform/target

install: ;
)

File.write('Makefile', mkf)
