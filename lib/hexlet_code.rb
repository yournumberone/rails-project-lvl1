# frozen_string_literal: true
require_relative 'hexlet_code/version'


module HexletCode
  class Error < StandardError; end


  def self.form_for(object, options = {}, &block)
    action = options.include?(:url) ? "action='#{options[:url]}'" : "action='#'"
    result = ["<form #{action} method='post'><br>"]
    object.define_singleton_method(:input) do |field, type = {}|
      response = object.public_send(field)
      result.push("<label for='#{field}'>#{field.capitalize}</label><br>")
      case
        when type == {:as=>:text} then result.push("<textarea cols='20' rows='40' name='#{field}'>#{response}</textarea><br>")
        when type.empty? then result.push("<input name='#{field}' type='text' value='#{response}'><br>")
      end
    end
    object.define_singleton_method(:submit) do |value = "Save"|
      submit_tag = "<input name='commit' type='submit' value='#{value}><br>"
      result.push(submit_tag)
    end
    block.call object
    result.push('</form>')
    result.join
  end


  class Tag


    def self.build(tag, options = {})
      html_attributes = options.to_s.delete('{}:,').gsub('=>', '=').gsub('"', "'")
      block_given? ? "<#{tag} #{html_attributes}>#{block.call}</#{tag}>" : "<#{tag} #{html_attributes}>"
    end

  end

end
