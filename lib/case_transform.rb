# frozen_string_literal: true

require 'case_transform/version'
require 'thermite/config'

ruby_dir = File.dirname(File.dirname(__FILE__))
ext_dir =  ruby_dir + '/ext/case_transform'
config = Thermite::Config.new(cargo_project_path: ext_dir, ruby_project_path: ruby_dir)
# Do I have to use fiddle? :-\


module CaseTransform
  module_function

    # Transforms values to UpperCamelCase or PascalCase.
    #
    # @example:
    #    "some_key" => "SomeKey",
    def camel(value)
      case value
      when Array then value.map { |item| camel(item) }
      when Hash then value.deep_transform_keys! { |key| camel(key) }
      when Symbol then camel(value.to_s).to_sym
      when String then value.to_snake_case.to_class_case
      else value
      end
    end

    # Transforms values to camelCase.
    #
    # @example:
    #    "some_key" => "someKey",
    def camel_lower(value)
      case value
      when Array then value.map { |item| camel_lower(item) }
      when Hash then value.deep_transform_keys! { |key| camel_lower(key) }
      when Symbol then camel_lower(value.to_s).to_sym
      when String then value.to_snake_case.to_camel_case
      else value
      end
    end

    # Transforms values to dashed-case.
    # This is the default case for the JsonApi adapter.
    #
    # @example:
    #    "some_key" => "some-key",
    def dash(value)
      case value
      when Array then value.map { |item| dash(item) }
      when Hash then value.deep_transform_keys! { |key| dash(key) }
      when Symbol then dash(value.to_s).to_sym
      when String then value.to_snake_case.to_kebab_case
      else value
      end
    end

    # Transforms values to underscore_case.
    # This is the default case for deserialization in the JsonApi adapter.
    #
    # @example:
    #    "some-key" => "some_key",
    def underscore(value)
      case value
      when Array then value.map { |item| underscore(item) }
      when Hash then value.deep_transform_keys! { |key| underscore(key) }
      when Symbol then underscore(value.to_s).to_sym
      when String then value.to_snake_case
      else value
      end
    end

    # Returns the value unaltered
    def unaltered(value)
      value
    end
end
