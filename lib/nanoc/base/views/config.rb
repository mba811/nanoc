# encoding: utf-8

module Nanoc
  class ConfigView
    # @api private
    NONE = Object.new

    # @api private
    def initialize(config)
      @config = config
    end

    # @api private
    def unwrap
      @config
    end

    # @see Hash#fetch
    def fetch(key, fallback=NONE, &block)
      @config.fetch(key) do
        if !fallback.equal?(NONE)
          fallback
        elsif block_given?
          yield(key)
        else
          raise KeyError, "key not found: #{key.inspect}"
        end
      end
    end

    # @see Hash#key?
    def key?(key)
      @config.key?(key)
    end

    # @see Hash#[]
    def [](key)
      @config[key]
    end
  end
end
