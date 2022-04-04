# frozen_string_literal: true

# basic text field
class Basic
  attr_reader :render

  def initialize(field, response, options)
    @render = HexletCode::Tag.build('input', { name: field, type: 'text', value: response }.merge(options))
  end
end
