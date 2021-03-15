class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def enum_i18n(enum_name)
    return nil if send(enum_name).nil?

    I18n.t!("enums.#{model_name.i18n_key}.#{enum_name}.#{send(enum_name)}")
  end

  def self.enums_i18n(enum_name)
    send(enum_name.to_s.pluralize).transform_keys do |key|
      I18n.t!("enums.#{model_name.i18n_key}.#{enum_name}.#{key}")
    end
  end

  def self.enum_i18n(enum_name, enum_value)
    I18n.t!("enums.#{model_name.i18n_key}.#{enum_name}.#{enum_value}")
  end
end
