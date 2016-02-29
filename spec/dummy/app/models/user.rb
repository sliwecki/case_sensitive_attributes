class User < ActiveRecord::Base
  case_sensitive_attributes email: :downcase, first_name: :capitalize
end
