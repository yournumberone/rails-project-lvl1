# frozen_string_literal: true

# basic text field
class Basic
  def initialize(object, field, response, options)
    object.push(['input', { name: field, type: 'text', value: response }.merge(options)])
  end
end
