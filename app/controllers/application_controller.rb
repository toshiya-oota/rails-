class ApplicationController < ActionController::Base
  before_action :authenticate_system_user!
  include Pundit

  def after_sign_out_path_for(resource_or_scope)
    new_system_user_session_path
  end

  # 例外処理
  rescue_from StandardError, with: :render_500
  rescue_from Pundit::NotAuthorizedError, with: :render_403
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private def render_403(error)
    render 'errors/403', status: :not_found
  end

  private def render_404(error)
    render template: 'errors/404', status: :not_found
  end

  private def render_500(error)
    render template: 'errors/500', status: :internal_server_error
  end
end
