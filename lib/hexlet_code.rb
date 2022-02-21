# frozen_string_literal: true
require_relative 'hexlet_code/version'



module HexletCode
  class Error < StandardError; end


  def self.form_for(object, options = {}, &block)
    url = options.include?(:url) ? options[:url].gsub('"', "'") : "#"
    action="action='#{url}'"
    result = ["<form #{action} method='post'><br>"]
    object.define_singleton_method(:input) do |field, type = {}|
      response = object.public_send(field)
      if type == {:as=>:text}
        result.push("<textarea cols='20' rows='40' name='#{field}'>"); result.push("#{response}</textarea><br>")
      elsif type.empty?
        result.push("<input name='#{field}' type='text' value="); result.push("'#{response}'><br>")
      end
    end
    block.call object
    result.push("</form>")
    p result.join

  end


  class Tag
    # def self.input(attribute)
    #   puts "hi"
    #   puts attribute
    # end

    def self.build(tag, options = {})
      html_attributes = options.to_s.delete('{}:,').gsub('=>', '=').gsub('"', "'")
      block_given? ? "<#{tag} #{html_attributes}>#{block.call}</#{tag}>" : "<#{tag} #{html_attributes}>"
    end

  end

end
