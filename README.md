# case_transform
Extraction of the key_transform abilities of ActiveModelSerializers

[![Gem Version](https://badge.fury.io/rb/case_transform.svg)](https://badge.fury.io/rb/case_transform-rust-extensions)
[![Build Status](https://travis-ci.org/NullVoxPopuli/case_transform.svg?branch=master)](https://travis-ci.org/NullVoxPopuli/case_transform-rust-extensions)
[![Code Climate](https://codeclimate.com/repos/57e58f06f570544b8b002ca1/badges/2b25db8268d104aed187/gpa.svg)](https://codeclimate.com/repos/57e58f06f570544b8b002ca1/feed)
[![Test Coverage](https://codeclimate.com/repos/57e58f06f570544b8b002ca1/badges/2b25db8268d104aed187/coverage.svg)](https://codeclimate.com/repos/57e58f06f570544b8b002ca1/coverage)
[![Dependency Status](https://gemnasium.com/NullVoxPopuli/case_transform.svg)](https://gemnasium.com/NullVoxPopuli/case_transform-rust-extensions)


## Performance

```
$ ruby benchmark.rb

Comparison:
Memoized Rust: camel:   472652.3 i/s
         Rust: camel:   252846.1 i/s - 1.87x  slower
Memoized Ruby: camel:   182202.1 i/s - 2.59x  slower
         Ruby: camel:    10970.0 i/s - 43.09x  slower


Comparison:
Memoized Rust: camel_lower:   476871.4 i/s
   Rust: camel_lower:   256091.2 i/s - 1.86x  slower
Memoized Ruby: camel_lower:   177601.9 i/s - 2.69x  slower
   Ruby: camel_lower:     8572.1 i/s - 55.63x  slower


Comparison:
 Memoized Rust: dash:   486330.4 i/s
          Rust: dash:   247343.9 i/s - 1.97x  slower
 Memoized Ruby: dash:   180914.7 i/s - 2.69x  slower
          Ruby: dash:    19890.3 i/s - 24.45x  slower


Comparison:
Memoized Rust: unaltered:  6279775.6 i/s
     Rust: unaltered:  6242466.1 i/s - same-ish: difference falls within error
     Ruby: unaltered:  6169666.6 i/s - same-ish: difference falls within error
Memoized Ruby: unaltered:  6163955.1 i/s - same-ish: difference falls within error


Comparison:
Memoized Rust: underscore:   481172.4 i/s
    Rust: underscore:   237281.6 i/s - 2.03x  slower
Memoized Ruby: underscore:   185681.1 i/s - 2.59x  slower
    Ruby: underscore:   146554.5 i/s - 3.28x  slower
```

## Development

### Requirements
- Ruby `2.3.0` with `enable-shared`
  ```shell
  CONFIGURE_OPTS=--enable-shared rbenv install 2.3.0
  ```
- [Rust `nightly`](https://rustup.rs/)

### Setup
- `rustup install nightly`
- `rustup default nightly`
- `bundle install`
- `rake`

## Install

```ruby
gem 'case_transform-rust-extensions', require: 'case_transform'
```

or

```bash
gem install case_transform-rust-extensions
```

### Installation Dependencies

- curl
- git

## Usage

```ruby
require 'case_transform'

CaseTransform.camel_lower(value) # Optionally pass cache boolean
```

`value` can be any of Array, Hash, Symbol, or String.
Any other object type will just be returned.

### Transforms

| &nbsp; | Description |
| --- | --- |
| camel | PascalCase |
| camel_lower | camelCase |
| dash | dash-case |
| underscore | under_score |
| unaltered | pass through |
