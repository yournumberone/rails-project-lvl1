# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  class Error < StandardError; end

  def self.form_for(object, action = { url: '#' }, &block)
    form = FormBuilder.new(object)
    block.call form if block_given?
    Tag.build('form', action: action[:url], method: 'post') {form.fields}
  end

end
