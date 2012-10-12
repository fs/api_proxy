module ApiProxy
  class Noop < BaseApiProxy
    def self.process(params)
      params
    end
  end
end
