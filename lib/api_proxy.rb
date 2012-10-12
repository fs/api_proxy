require 'base_api_proxy'
require 'sinatra/mustache'

module ApiProxy

  class App < Sinatra::Application

    get '/:api/:template' do |api, template|
      connector = BaseApiProxy.find(api)
      @result = connector.process(params)
      mustache "#{api}/#{template}".to_sym
    end

  end
end
