class Basic
  attr_reader :render

  def initialize(response, options)
    @render = HexletCode::Tag.build('input', {type: 'text', value: response}.merge(options))
  end
end