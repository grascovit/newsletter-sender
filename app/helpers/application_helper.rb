# frozen_string_literal: true

module ApplicationHelper
  def active_item(name)
    'active' if name == controller_name
  end
end
