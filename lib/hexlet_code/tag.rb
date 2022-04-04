module HexletCode
  class Tag
    def self.build(tag, options = {})
      html_attributes = options.map { |k, v| "#{k}='#{v}'" }.join(' ')
      block_given? ? "<#{tag} #{html_attributes}>#{yield}</#{tag}>" : "<#{tag} #{html_attributes}>".gsub(' >', '>')
    end
  end
end
