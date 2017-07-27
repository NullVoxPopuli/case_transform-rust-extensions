#[macro_use]
extern crate helix;
extern crate inflections;

// use inflector::cases::{camelcase, classcase, kebabcase, snakecase};
use inflections::Inflect;
use std::any::Any;


use helix::{RubyString, Array, Symbol, Hash};

// use ruru::{Class, Object, VerifiedObject, RString, Hash, Array, Symbol, AnyObject};
// use ruru::types::ValueType;
// use ruru::result::Error as RuruError;


impl Transform for Any {
    fn transform(&self, _transform_function: &Fn(String) -> String) -> Any {
        self
    }
}

impl Transform for RubyString {
    fn transform(&self, transform_function: &Fn(String) -> String) -> Any {
        let result = transform_function(self.to_string());

        RubyString::new(&result).to_any_object()
    }
}

impl Transform for Symbol {
    fn transform(&self, transform_function: &Fn(String) -> String) -> Any {
        let result = transform_function(self.to_string());

        Symbol::new(&result).to_any_object()
    }
}

impl Transform for Hash {
    fn transform(&self, transform_function: &Fn(String) -> String) -> Any {
        let mut result = Hash::new();

        self.each(|key, value| {
            let new_key = transform(key, transform_function);
            let new_value = match value.ty() {
                Hash => transform(value, transform_function),
                _ => value,
            };

            result.store(new_key, new_value);
        });

        result.to_any_object()
    }
}

impl Transform for Array {
    fn transform(&self, transform_function: &Fn(String) -> String) -> AnyObject {
        // Temp hack to consume &self for iterator
        let result = unsafe { self.to_any_object().to::<Array>() };

        result.into_iter()
            .map(|item| transform(item, transform_function))
            .collect::<Array>()
            .to_any_object()
    }
}

trait TryTransform: Object {
    fn try_transform<T>(&self,
                        transform_function: &Fn(String) -> String)
                        -> Result<Any, RuruError>
        where T: VerifiedObject + Transform
    {
        self.try_convert_to::<T>().map(|object| object.transform(transform_function))
    }
}

impl TryTransform for Any {}

fn transform(object: Any, key_transform: &Fn(String) -> String) -> Any {
    let result = object.try_transform::<RubyString>(key_transform)
        .or_else(|_| object.try_transform::<Symbol>(key_transform))
        .or_else(|_| object.try_transform::<Array>(key_transform))
        .or_else(|_| object.try_transform::<Hash>(key_transform))
        .or_else(|_| object.try_transform::<Any>(key_transform));

    result.unwrap()
}

fn to_pascal_case(key: String) -> String {
    // classcase::to_class_case(key)
    key.to_pascal_case()
}

fn to_camel_case(key: String) -> String {
    // camelcase::to_camel_case(key)
    key.to_camel_case()
}

fn to_dashed_case(key: String) -> String {
    // kebabcase::to_kebab_case(key)
    key.to_kebab_case()
}

fn to_snake_case(key: String) -> String {
    // snakecase::to_snake_case(key)
    key.to_snake_case()
}


ruby! {
    class CaseTransform {
        def camel(string: RubyString) -> String {
            transform(string.unwrap(), &to_pascal_case)
        }

        def camel(object: Array) -> Array {
            transform(object.unwrap(), &to_pascal_case)
        }

        def camel(object: Symbol) -> Symbol {
            transform(object.unwrap(), &to_pascal_case)
        }

        def camel(object: Hash) -> Hash {
            transform(object.unwrap(), &to_pascal_case)
        }
        // def camel_lower(object: AnyObject) -> AnyObject {
        //     transform(object.unwrap(), &to_camel_case)
        // }
        // def dash(object: AnyObject) -> AnyObject {
        //     transform(object.unwrap(), &to_dashed_case)
        // }
        // def underscore(object: AnyObject) -> AnyObject {
        //     transform(object.unwrap(), &to_snake_case)
        // }
        // def unaltered(object: AnyObject) -> AnyObject {
        //     object.unwrap()
        // }

    }
}
