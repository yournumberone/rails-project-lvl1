# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'hexlet_code/inputs/basic'
require 'hexlet_code/inputs/textarea'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  class Error < StandardError; end

  def self.form_for(object, action = { url: '#' }, &block)
    form = FormBuilder.new(object)
    block.call form if block_given?
    form.render_html(action[:url])
  end
end
