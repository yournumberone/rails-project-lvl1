# frozen_string_literal: true

# textarea field
class Text
  attr_reader :render

  def initialize(field, response, options)
    @render = HexletCode::Tag.build('textarea', { cols: 20, rows: 40, name: field }.merge(options).except(:as)) do
      response
    end
  end
end
