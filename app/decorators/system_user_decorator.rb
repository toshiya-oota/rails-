module SystemUserDecorator
  def admin_label
    enum_i18n(:admin)
  end

  def admin_name
    admin_name? ? "管理者" : "一般ユーザ"
  end
end
