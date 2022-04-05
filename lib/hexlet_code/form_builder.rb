# frozen_string_literal: true

class FormBuilder
  def push(inputs)
    @form << inputs
  end

  def initialize(params)
    @object = params
    @form = []
  end

  def render_html(url)
    string_fields = ''
    @form.each do |field|
      tag, params = field
      if params.include?(:content_text)
        content_text = params.delete(:content_text)
        string_fields += HexletCode::Tag.build(tag, params) { content_text }
      else
        string_fields += HexletCode::Tag.build(tag, params)
      end
    end
    HexletCode::Tag.build('form', action: url, method: 'post') { string_fields }
  end

  def label(name)
    @form << ['label', { for: name, content_text: name.to_s.capitalize }]
  end

  def input(field, options = {})
    response = @object.public_send(field)
    label(field)
    type = options[:as] || :basic
    Object.const_get(type.to_s.capitalize).new(self, field, response, options)
  end

  def submit(value = 'Save', options = {})
    params = { name: 'commit', type: 'submit', value: value }
    params.merge!(options)
    @form << ['input', params]
  end
end
