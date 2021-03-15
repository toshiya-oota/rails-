# frozen_string_literal: true

module ProductDetailDecorator
  def color_label
    enum_i18n(:color)
  end

  def size_label
    enum_i18n(:size)
  end

  def season_label
    enum_i18n(:season)
  end

  def product_country_label
    enum_i18n(:product_country)
  end
end
