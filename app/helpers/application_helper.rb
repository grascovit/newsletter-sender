# frozen_string_literal: true

module ApplicationHelper
  FLASH_TYPES = {
    alert: 'alert-danger',
    notice: 'alert-primary'
  }.freeze

  def active_item(name)
    'active' if name == controller_name
  end

  def flash_class(type)
    FLASH_TYPES[type.to_sym]
  end
end
