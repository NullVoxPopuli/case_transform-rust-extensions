# case_transform
Extraction of the key_transform abilities of ActiveModelSerializers

[![Gem Version](https://badge.fury.io/rb/case_transform.svg)](https://badge.fury.io/rb/case_transform)
[![Build Status](https://travis-ci.org/NullVoxPopuli/case_transform.svg?branch=master)](https://travis-ci.org/NullVoxPopuli/case_transform)
[![Code Climate](https://codeclimate.com/repos/57dafbcc628330006c001312/badges/5f190457aba7c5d5d78c/gpa.svg)](https://codeclimate.com/repos/57dafbcc628330006c001312/feed)
[![Test Coverage](https://codeclimate.com/repos/57dafbcc628330006c001312/badges/5f190457aba7c5d5d78c/coverage.svg)](https://codeclimate.com/repos/57dafbcc628330006c001312/coverage)
[![Dependency Status](https://gemnasium.com/NullVoxPopuli/case_transform.svg)](https://gemnasium.com/NullVoxPopuli/case_transform)


## Performance

```
$ ruby benchmark.rb

         Rust: camel:   238774.9 i/s
         Ruby: camel:    13107.3 i/s - 18.22x  slower

   Rust: camel_lower:   230641.5 i/s
   Ruby: camel_lower:     8244.1 i/s - 27.98x  slower

          Rust: dash:   243197.8 i/s
          Ruby: dash:    20350.9 i/s - 11.95x  slower

     Ruby: unaltered:  6030498.8 i/s
     Rust: unaltered:  1960989.6 i/s - 3.08x  slower

    Rust: underscore:   291052.3 i/s
    Ruby: underscore:   169458.2 i/s - 1.72x  slower

```

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

CaseTransform.camel_lower(value)
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
