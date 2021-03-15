class ApplicationPolicy
  attr_reader :current_system_user, :record

  def initialize(current_system_user, record)
    @current_system_user = current_system_user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  protected def current_system_user_role_permission_en_names
    role_permission_en_names = current_system_user.roles.map { |role| role.permissions.pluck(:en_name).compact.uniq }
    role_permission_en_names[0]
  end

  class Scope
    attr_reader :current_system_user, :scope

    def initialize(current_system_user, scope)
      @current_system_user = current_system_user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
