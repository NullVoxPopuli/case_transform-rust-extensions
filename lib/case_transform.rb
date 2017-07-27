# frozen_string_literal: true

require_relative './case_transform/version'

require 'helix_runtime'

begin
  require "case_transform/native"
rescue LoadError
  warn "Unable to load case_transform/native. Please run `rake build`"
end
