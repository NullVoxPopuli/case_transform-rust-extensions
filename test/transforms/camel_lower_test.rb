# frozen_string_literal: true
require 'test_helper'
SCENARIOS_CAMEL_LOWER = [
  {
    value: { :"some-key" => 'value' },
    expected: { someKey: 'value' }
  },
  {
    value: { SomeKey: 'value' },
    expected: { someKey: 'value' }
  },
  {
    value: { some_key: 'value' },
    expected: { someKey: 'value' }
  },
  {
    value: { 'some-key' => 'value' },
    expected: { 'someKey' => 'value' }
  },
  {
    value: { 'SomeKey' => 'value' },
    expected: { 'someKey' => 'value' }
  },
  {
    value: { 'some_key' => 'value' },
    expected: { 'someKey' => 'value' }
  },
  {
    value: :"some-value",
    expected: :someValue
  },
  {
    value: :SomeValue,
    expected: :someValue
  },
  {
    value: :some_value,
    expected: :someValue
  },
  {
    value: 'some-value',
    expected: 'someValue'
  },
  {
    value: 'SomeValue',
    expected: 'someValue'
  },
  {
    value: 'some_value',
    expected: 'someValue'
  },
  {
    value: OBJ,
    expected: OBJ
  },
  {
    value: nil,
    expected: nil
  },
  {
    value: [
      { some_value: 'value' }
    ],
    expected: [
      { someValue: 'value' }
    ]
  }
].freeze

describe CaseTransform do
  describe 'Transforms' do
    describe 'camel_lower' do
      it 'transforms to lowerCamelCase' do
        SCENARIOS_CAMEL_LOWER.each do |s|
          result = CaseTransform.camel_lower(s[:value])
          assert_equal s[:expected], result
        end
      end
    end
  end
end
