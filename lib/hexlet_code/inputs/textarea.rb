  class Text
    attr_reader :render

    def initialize(field, response, options)
      @render = HexletCode::Tag.build('textarea', {cols: 20, rows: 40, name: field}.merge(options).except(:as)) { response }
    end
  end
