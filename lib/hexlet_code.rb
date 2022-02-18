# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  class Tag

    def self.build(tag, params = {})
      html_attributes = params.to_s.delete('{}:,').gsub('=>', '=').gsub('"', "'")
      if block_given?
        "<#{tag} #{html_attributes}>#{yield}</#{tag}>"
      else
        "<#{tag} #{html_attributes}>"
      end
    end

  end

end
