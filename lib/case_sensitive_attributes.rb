require "case_sensitive_attributes/version"
require "case_sensitive_attributes/incorrect_kind"
require "case_sensitive_attributes/transformer"
require "case_sensitive_attributes/middleware"

module CaseSensitiveAttributes
  def case_sensitive_attributes(params)
    params.each do |attribute, kind|
      before_validation do |record|
        value = Transformer.call(record[attribute], kind)
        record[attribute] = value
      end
    end
  end
end

ActiveSupport.on_load(:active_record) { extend CaseSensitiveAttributes } if defined? ActiveRecord
