class ProductPolicy < ApplicationPolicy
  def index?
    if current_system_user.roles.present?
      current_system_user_role_permission_en_names.include?('order_reference')
    end
  end

  def show?
    if current_system_user.roles.present?
      current_system_user_role_permission_en_names.include?('order_reference')
    end
  end

  def edit?
    if current_system_user.roles.present?
      current_system_user_role_permission_en_names.include?('order_update')
    end
  end

  def update?
    if current_system_user.roles.present?
      current_system_user_role_permission_en_names.include?('order_update')
    end
  end

  private def current_system_user_role_permission_en_names
    role_permission_en_names = current_system_user.roles.map { |role| role.permissions.pluck(:en_name).compact.uniq }
    role_permission_en_names[0]
  end
end
