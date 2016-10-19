# frozen_string_literal: true

require_relative './case_transform/version'
require 'thermite/config'
require 'fiddle'

ruby_dir = File.dirname(File.dirname(__FILE__))
ext_dir =  ruby_dir + '/ext/case_transform'
config = Thermite::Config.new(cargo_project_path: ext_dir, ruby_project_path: ruby_dir)
# Do I have to use fiddle? :-\
library = Fiddle.dlopen(config.ruby_extension_path)
func = Fiddle::Function.new(
  library['initialize_case_transform'],
  [], Fiddle::TYPE_VOIDP
)
module CaseTransform
  class << self
    def camel_cache
      @camel_cache ||= {}
    end

    def camel_lower_cache
      @camel_lower_cache ||= {}
    end

    def dash_cache
      @dash_cache ||= {}
    end

    def underscore_cache
      @underscore_cache ||= {}
    end

    def camel(value, cache=false)
      return camel_rust(value) unless cache
      camel_cache[value] ||= camel_rust(value)
    end

    def camel_lower(value, cache=false)
      return camel_lower_rust(value) unless cache
      camel_lower_cache[value] ||= camel_lower_rust(value)
    end

    def dash(value, cache=false)
      return dash_rust(value) unless cache
      dash_cache[value] ||= dash_rust(value)
    end

    def underscore(value, cache=false)
      return underscore_rust(value) unless cache
      underscore_cache[value] ||= underscore_rust(value)
    end

    def unaltered(value)
      value
    end
  end
end
func.call
