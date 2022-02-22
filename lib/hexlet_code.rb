# frozen_string_literal: true
require_relative 'hexlet_code/version'


module HexletCode
  class Error < StandardError; end


  def self.form_for(object, action = {url: "#"}, &block)
    result = ["<form action='#{action[:url]}' method='post'><br>"]
    object.define_singleton_method(:input) do |field, options = {class: ""}|
      response = object.public_send(field)
      result.push("<label for='#{field}'>#{field.capitalize}</label><br>")
      case
        when options[:as] == :text then result.push("<textarea cols='20' class='#{options[:class]}' rows='40' name='#{field}'>#{response}</textarea><br>")
        when options[:as] == nil then result.push("<input name='#{field}' type='text' class='#{options[:class]}' value='#{response}'><br>")
      end
    end
    object.define_singleton_method(:submit) do |value = "Save", options = {class: ""}|
      result.push("<input name='commit' type='submit' class='#{options[:class]}' value='#{value}'><br>")
    end
    block.call object if block_given?
    result.push('</form><br>')
    p result.join
  end


  class Tag


    def self.build(tag, options = {})
      html_attributes = options.to_s.delete('{}:,').gsub('=>', '=').gsub('"', "'")
      block_given? ? "<#{tag} #{html_attributes}>#{block.call}</#{tag}>" : "<#{tag} #{html_attributes}>"
    end

  end

end
