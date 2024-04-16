class NotificationController < ApplicationController

	def notify_user
		users = User.all

	end

	private

	def create_post_request(body)
		@res = Faraday.post do |req|
          req.headers[:Content_Type] = 'application/json'
          req.headers[:token] = 'Secret'
          req.params = body.as_json
          req.url  "http://localhost:3000/posts"
        end
	end
end
