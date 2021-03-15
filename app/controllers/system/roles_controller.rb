class System::RolesController < ApplicationController

  # before_action :authorize_role, only: %i(index new create)

  def index
    @q = Role.ransack(params[:q])
    @roles = @q.result.page(params[:page])
  end

  def new
    @role = Role.new
    @role.roles_permissions.build
  end

  def create
    @role = Role.create(role_params)
    if @role.save
      redirect_to :controller => "system/roles", :action => "index"
    else
      render :new
    end
  end

  def edit
    set_role
    @role.roles_permissions
  end

  def update
    set_role
    if @role.update(role_params)
      redirect_to :controller => "system/roles", :action => "index"
    else
      render :edit
    end
  end

  def destroy
    set_role
    if @role.destroy
      redirect_to :controller => "system/roles", :action => "index"
    else
      render :edit
    end
  end

  private def authorize_role
    # authorize Role
  end

  private def set_role
    @role = Role.find(params[:id])
    # authorize @role
  end

  private def role_params
    params.require(:role).permit(:id, :name, permission_ids: [])
  end
end
