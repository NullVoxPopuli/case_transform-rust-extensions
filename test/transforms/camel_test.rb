# frozen_string_literal: true
require 'test_helper'
SCENARIOS_CAMEL = [
  {
    value: { :"some-key" => 'value' },
    expected: { SomeKey: 'value' }
  },
  {
    value: { SomeKey: 'value' },
    expected: { SomeKey: 'value' }
  },
  {
    value: { some_key: 'value' },
    expected: { SomeKey: 'value' }
  },
  {
    value: { 'some-key' => 'value' },
    expected: { 'SomeKey' => 'value' }
  },
  {
    value: { 'SomeKey' => 'value' },
    expected: { 'SomeKey' => 'value' }
  },
  {
    value: { 'some_key' => 'value' },
    expected: { 'SomeKey' => 'value' }
  },
  {
    value: :"some-value",
    expected: :SomeValue
  },
  {
    value: :SomeValue,
    expected: :SomeValue
  },
  {
    value: :some_value,
    expected: :SomeValue
  },
  {
    value: 'some-value',
    expected: 'SomeValue'
  },
  {
    value: 'SomeValue',
    expected: 'SomeValue'
  },
  {
    value: 'some_value',
    expected: 'SomeValue'
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
      { SomeValue: 'value' }
    ]
  }
].freeze

describe CaseTransform do
  describe 'Transforms' do
    describe 'camel' do
      it 'transforms to camel case (PascalCase)' do
        SCENARIOS_CAMEL.each do |s|
          result = CaseTransform.camel(s[:value])
          assert_equal s[:expected], result
        end
      end
    end
  end
end
