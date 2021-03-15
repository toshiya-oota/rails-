require 'test_helper'

class AcceptOrderPolicyTest < PolicyTest
  # ユーザに権限がある時、成功
  setup do
    @system_user_admin = create(:system_user, administrator: 'admin')
    @role = create(:role)
    permission_reference = create(:permission, en_name: 'order_reference')
    permission_update = create(:permission, en_name: 'order_update')
    roles_permission_reference = create(:roles_permission, role_id: @role.id, permission_id: permission_reference.id)
    roles_permission_update = create(:roles_permission, role_id: @role.id, permission_id: permission_update.id)
    system_users_role = create(:system_users_role, system_user_id: @system_user_admin.id, role_id: @role.id)
    @order = create(:order)
    sign_in @system_user_admin
  end
  describe 'for an system user with role' do
    it { assert_permit @system_user_admin, :order, :index }
    it { assert_permit @system_user_admin, @order, :show }
    it { assert_permit @system_user_admin, @order, :edit }
    it { assert_permit @system_user_admin, @order, :update }
  end
end

class AcceptOrderPolicyTest < PolicyTest
  # ユーザに権限がない時、失敗
  setup do
    @system_user_general = create(:system_user, administrator: 'general')
    @order = create(:order)
  end
  describe 'for an system user without role' do
    it { refute_permit @system_user_general, :order, :index }
    it { refute_permit @system_user_general, @order, :show }
    it { refute_permit @system_user_general, @order, :edit }
    it { refute_permit @system_user_general, @order, :update }
  end
end
