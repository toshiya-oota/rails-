module System
  class SystemUsersController < ApplicationController
    #before_action :authorize_system_user, only: %i(index new create)

    def index
      @q = SystemUser.ransack(params[:q])
      @system_users = @q.result.page(params[:page] || 1)
    end

    def new
      @system_user = SystemUser.new
      @system_user.system_users_roles.build
    end

    def create
      @system_user = SystemUser.new(system_user_params)
      if @system_user.save
        redirect_to :controller => "system/system_users", :action => "index"
      else
        render :new
      end
    end

    def edit
      load_system_user
    end

    def update
      load_system_user
      @system_user.attributes = system_user_params
      if @system_user.update(system_user_params)
        redirect_to :controller => "system/system_users", :action => "index"
      else
        render :edit
      end
    end

    def destroy
      load_system_user
      if @system_user.destroy
        redirect_to :controller => "system/system_users", :action => "index"
      else
        render :edit
      end
    end

    # private def authorize_system_user
    #   authorize SystemUser
    # end

    private def load_system_user
      @system_user = SystemUser.find(params[:id])
      #authorize @system_user
    end

    private def system_user_params
      permit_params = %i(id login_id name admin)
      if params[:system_user][:password].present?
        permit_params << :password
        permit_params << :password_confirmation
      end
      params.require(:system_user).permit(permit_params, role_ids: [])
    end
  end
end
