module Messages
  class Posts
    def initialize(posts)
      @posts = posts
    end

    def to_s
      @posts.map.with_index do |post, i|
        "#{i.next}\\. #{post.to_message}"
      end.join("\n")
    end
  end
end
