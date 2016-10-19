# frozen_string_literal: true
require 'test_helper'
SCENARIOS = [
  {
    value: { :"some-key" => 'value' },
    expected: { some_key: 'value' }
  },
  {
    value: { SomeKey: 'value' },
    expected: { some_key: 'value' }
  },
  {
    value: { some_key: 'value' },
    expected: { some_key: 'value' }
  },
  {
    value: { 'some-key' => 'value' },
    expected: { 'some_key' => 'value' }
  },
  {
    value: { 'SomeKey' => 'value' },
    expected: { 'some_key' => 'value' }
  },
  {
    value: { 'some_key' => 'value' },
    expected: { 'some_key' => 'value' }
  },
  {
    value: :"some-value",
    expected: :some_value
  },
  {
    value: :SomeValue,
    expected: :some_value
  },
  {
    value: :some_value,
    expected: :some_value
  },
  {
    value: 'some-value',
    expected: 'some_value'
  },
  {
    value: 'SomeValue',
    expected: 'some_value'
  },
  {
    value: 'some_value',
    expected: 'some_value'
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
      { some_value: 'value' }
    ]
  }
].freeze
describe CaseTransform do
  describe 'Transforms' do
    describe 'underscore' do
      it 'transforms to underscore (snake case)' do
        SCENARIOS.each do |s|
          result = CaseTransform.underscore(s[:value])
          assert_equal s[:expected], result
        end
      end
    end
  end
end
