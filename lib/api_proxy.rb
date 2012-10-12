require 'base_api_proxy'

module ApiProxy

  class App < Sinatra::Application

    get '/:api/:template' do |api, template|
      connector = BaseApiProxy.find(api)
      @result = connector.process
      render connector.template_path(template)
    end

  end
end
