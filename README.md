# CaseSensitiveAttributes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'case_sensitive_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install case_sensitive_attributes

## Usage

##### Set kinds for your attributes (eg. in User model)

```ruby
class User < ActiveRecord::Base
 #case_sensitive_attributes column_name: :kind, column_name: :kind
  case_sensitive_attributes email: :downcase, first_name: :upcase
end
```
>- allow kinds:
[:capitalize, :downcase, :upcase]


##### Set kinds for your params (form params or query string)

```ruby
module Dummy
  class Application < Rails::Application
    config.middleware.insert_after ActionDispatch::ParamsParser, CaseSensitiveAttributes::Middleware do
     #params attribute: :kind
      params email: :downcase
    end
  end
```
>- allow kinds:
[:capitalize, :downcase, :upcase]
