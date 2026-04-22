#pragma once
// 最小 JSON パーサ (RFC 8259 の主要サブセット: object / array / string /
// number / true / false / null)。エラー時は type=Null を返す。
#include <cstdint>
#include <memory>
#include <string>
#include <unordered_map>
#include <variant>
#include <vector>

namespace mv1conv::json {

class Value;
using Array  = std::vector<Value>;
using Object = std::unordered_map<std::string, Value>;

class Value {
public:
    enum class Type { Null, Boolean, Number, String, Array, Object };

    Value() = default;
    Value(bool b)              : t_(Type::Boolean), b_(b) {}
    Value(double d)            : t_(Type::Number),  d_(d) {}
    Value(std::string s)       : t_(Type::String),  s_(std::move(s)) {}
    Value(Array a)             : t_(Type::Array) { arr_ = std::make_shared<Array>(std::move(a)); }
    Value(Object o)            : t_(Type::Object){ obj_ = std::make_shared<Object>(std::move(o)); }

    Type type() const { return t_; }
    bool is_null()   const { return t_ == Type::Null; }
    bool is_number() const { return t_ == Type::Number; }
    bool is_string() const { return t_ == Type::String; }
    bool is_array()  const { return t_ == Type::Array; }
    bool is_object() const { return t_ == Type::Object; }

    bool        boolean() const { return b_; }
    double      number() const  { return d_; }
    const std::string &str() const { return s_; }
    const Array  &arr() const { static const Array empty; return arr_ ? *arr_ : empty; }
    const Object &obj() const { static const Object empty; return obj_ ? *obj_ : empty; }

    // object から key 取得 (存在しないなら null Value)
    const Value &operator[](const std::string &key) const {
        static const Value null_v;
        if (t_ != Type::Object || !obj_) return null_v;
        auto it = obj_->find(key);
        return (it == obj_->end()) ? null_v : it->second;
    }
    const Value &operator[](std::size_t i) const {
        static const Value null_v;
        if (t_ != Type::Array || !arr_) return null_v;
        return (i < arr_->size()) ? (*arr_)[i] : null_v;
    }
    std::size_t size() const {
        if (t_ == Type::Array)  return arr_ ? arr_->size() : 0;
        if (t_ == Type::Object) return obj_ ? obj_->size() : 0;
        return 0;
    }

    // 数値デフォルト取得
    double as_number(double def = 0.0) const { return is_number() ? d_ : def; }
    std::string as_string(const std::string &def = "") const { return is_string() ? s_ : def; }
    bool as_bool(bool def = false) const { return (t_ == Type::Boolean) ? b_ : def; }

private:
    Type t_ = Type::Null;
    bool b_ = false;
    double d_ = 0;
    std::string s_;
    std::shared_ptr<Array>  arr_;
    std::shared_ptr<Object> obj_;
};

// src を JSON としてパース。失敗時は Null Value を返し、err にメッセージを詰める
Value parse(const char *src, std::size_t len, std::string &err);

}
