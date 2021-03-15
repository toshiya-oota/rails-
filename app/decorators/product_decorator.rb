# frozen_string_literal: true
module ProductDecorator
  def sale_period
    if sale_start.present? && sale_end.present?
      "#{sale_start.strftime('%Y年%m月%d日')} ~ #{sale_end.strftime('%Y年%m月%d日')}"
    elsif sale_start.present?
      "#{sale_start.strftime('%Y年%m月%d日')} ~ "
    elsif sale_end.present?
      "~ #{sale_end.strftime('%Y年%m月%d日')}"
    else
      "-"
    end
  end

  def category_label
    enum_i18n(:category)
  end

  def sex_label
    enum_i18n(:sex)
  end

  def status_label
    enum_i18n(:status)
  end

  def color_label
    enum_i18n(:color)
  end
end
