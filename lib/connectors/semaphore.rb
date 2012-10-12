module ApiProxy
  class Semaphore < BaseApiProxy
    API_ENDPOINTS = {
      'branches' => 'https://semaphoreapp.com/api/v1/projects/{{project_token}}/branches?auth_token={{auth_token}}',
      'branch_status' => 'https://semaphoreapp.com/api/v1/projects/{{project_token}}/{{branch_id}}/status?auth_token={{auth_token}}'
    }

    def self.process(params)
      request_params = config[:request_params].merge(
        project_token: config[:projects][params[:project]],
        branch_id: params[:branch_id]
      )
      url = Mustache.render(API_ENDPOINTS[params[:template]], request_params)
      response = HTTParty.get url
      response.body
    end
  end
end
