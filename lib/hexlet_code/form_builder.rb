# frozen_string_literal: true

class FormBuilder
  def initialize(params)
    @object = params
    @form = []
  end

  def fields
    @form.join
  end

  def label(name)
    @form.push HexletCode::Tag.build('label', for: name) { name.to_s.capitalize }
  end

  def input(field, options = {})
    response = @object.public_send(field)
    label(field)
    type = options[:as] || :basic
    @form.push Object.const_get(type.to_s.capitalize).new(field, response, options).render
  end

  def submit(value = 'Save', options = {})
    params = { name: 'commit', type: 'submit', value: value }
    params.merge!(options)
    @form.push HexletCode::Tag.build('input', params)
  end
end
