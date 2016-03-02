module CaseSensitiveAttributes
  class Middleware

    def initialize(app, opts={}, &block)
      @app = app
      instance_eval(&block) if block_given?
    end

    def call(env)
      request = Rack::Request.new(env)

      replace(request.GET) if request.GET.present?
      replace(request.POST) if request.POST.present?

      @app.call(env)
    end

    def params(options={})
      @params = options
    end

    private

    def replace(hash)
      transform(hash).each { |key, value| hash[key] = value }
    end

    def transform(hash)
      hash.each do |key, value|
        if value.is_a?(Hash)
          hash[key] = transform(value)
        elsif @params.keys.include?(key.to_sym)
          hash[key] = Transformer.call(value, @params[key.to_sym])
        else
          hash[key] = value
        end
      end
    end
  end
end
