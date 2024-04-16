class NotificationController < ApplicationController
	before_action :authenticate_request

	def notify_user
		users = User.all
		users.each do |user|
			user.notifications.create(message: params[:message])
		end
		render json: { response_message: 'success' }
	end

	private

	def authenticate_request
		token = request.headers[:token]
		decoded = JsonWebToken.decode(token)
		unless decoded.dig('data') == 'secret'
			return render json: { errors: 'unauthorize request' }, status: 422
		end
	end
end
