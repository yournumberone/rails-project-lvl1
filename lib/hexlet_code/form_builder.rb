class FormBuilder
  
  def initialize(params)
    @object = params
    @form = []
  end

  def fields
    p @form.join('')
  end

  def label(name)
    @form.push HexletCode::Tag.build('label', for: name) { name.to_s.capitalize }
  end

  def input(field, options = {})
    response = @object.public_send(field)
    label(field)
    if options[:as] == :text
      @form.push HexletCode::Tag.build('textarea', {cols: 20, rows: 40, name: response}.merge(options).except(:as)) { response }
    else
      @form.push HexletCode::Tag.build('input', {type: 'text', value: response}.merge(options))
    end
  end

  def submit(value = 'Save', options = {})
    params = {name: 'commit', type: 'submit', value: value}
    params.merge!(options)
    @form.push HexletCode::Tag.build('input', params)
  end
end
