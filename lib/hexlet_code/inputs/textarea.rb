# frozen_string_literal: true

# textarea field
class Text

  def initialize(object, field, response, options)
    object.push(['textarea', { cols: 20, rows: 40, name: field, content_text: response }.merge(options).except(:as)])
  end
end
