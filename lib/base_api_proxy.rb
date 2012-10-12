module ApiProxy
  class BaseApiProxy
    def self.find(api_name)
      if connector_exists?(api_name)
        require "connectors/#{api_name}.rb"
        ApiProxy.const_get api_name.camelize
      end
    end

    def self.config
      class_name = self.name.demodulize.underscore
      @@config ||= YAML::load(File.open("config/#{class_name}.yaml", 'rb').read)
    end

    private

    def self.connector_exists?(api_name)
      !Dir.glob('lib/connectors/*.rb').select do |f|
        File.basename(f).match(/(.+)\.rb/)[1] == api_name
      end.empty?
    end

  end
end
