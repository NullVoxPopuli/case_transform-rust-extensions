# frozen_string_literal: true
require 'test_helper'
SCENARIOS_DASH = [
  {
    value: { some_key: 'value' },
    expected: { :"some-key" => 'value' }
  },
  {
    value: { 'some_key' => 'value' },
    expected: { 'some-key' => 'value' }
  },
  {
    value: { SomeKey: 'value' },
    expected: { :"some-key" => 'value' }
  },
  {
    value: { 'SomeKey' => 'value' },
    expected: { 'some-key' => 'value' }
  },
  {
    value: { someKey: 'value' },
    expected: { :"some-key" => 'value' }
  },
  {
    value: { 'someKey' => 'value' },
    expected: { 'some-key' => 'value' }
  },
  {
    value: :some_value,
    expected: :"some-value"
  },
  {
    value: :SomeValue,
    expected: :"some-value"
  },
  {
    value: 'SomeValue',
    expected: 'some-value'
  },
  {
    value: :someValue,
    expected: :"some-value"
  },
  {
    value: 'someValue',
    expected: 'some-value'
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
      { 'some_value' => 'value' }
    ],
    expected: [
      { 'some-value' => 'value' }
    ]
  }
].freeze

describe CaseTransform do
  describe 'Transforms' do
    describe 'dash' do
      it 'transforms to dash (hyphenated words)' do
        SCENARIOS_DASH.each do |s|
          result = CaseTransform.dash(s[:value])
          assert_equal s[:expected], result
        end
      end
    end
  end
end
