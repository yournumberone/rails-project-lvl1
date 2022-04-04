  class Text
    attr_reader :render

    def initialize(response, options)
      @render = HexletCode::Tag.build('textarea', {cols: 20, rows: 40, name: response}.merge(options).except(:as)) { response }
    end
  end
