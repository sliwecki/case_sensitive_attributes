module CaseSensitiveAttributes
  class Transformer

    def self.call(value, kind)
      new(value, kind).call
    end

    def initialize(value, kind)
      @value = value
      @kind = kind.to_sym
    end

    def call
      raise CaseSensitiveAttributes::IncorrectKind.new("Your kind (#{kind}) is not correct.") if whitelist.exclude?(kind)
      value.present? ? value.to_s.send(kind) : value
    end

    private

    attr_reader :value, :kind

    def whitelist
      [:capitalize, :downcase, :upcase]
    end
  end
end
