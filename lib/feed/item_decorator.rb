module Feed
  class ItemDecorator < SimpleDelegator
    def to_message
      "[#{sanitize(title.strip)}](#{sanitize(link)})"
    end

    def markdown_description
      @markdown_description ||= ReverseMarkdown.convert description, github_flavored: true
    end

    private

    def sanitize(str)
      str.gsub(/[-#\[\]().+_!]/, '\\\\\0')
    end
  end
end
