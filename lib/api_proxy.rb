require 'base_api_proxy'
require 'sinatra/mustache'

module ApiProxy

  class App < Sinatra::Application

    before do
      content_type :json
    end

    get '/:api/:template' do |api, template|
      params.symbolize_keys!
      connector = BaseApiProxy.find(api)
      @result = connector.process(params)
      mustache "#{api}/#{template}".to_sym
    end

  end
end
