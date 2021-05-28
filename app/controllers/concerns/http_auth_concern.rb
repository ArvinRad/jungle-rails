module HttpAuthConcern
  extend ActiveSupport::Concern
  included do
      before_action :http_authenticate
  end
  def http_authenticate ()
    return true unless request.fullpath == "/admin/products"
    authenticate_or_request_with_http_basic('You need to authenticate as admin:') do |username, password|
      username == ENV["HTTP_ADMIN_USER"] && password == ENV["HTTP_ADMIN_PASSWORD"]
    end
  end
end
