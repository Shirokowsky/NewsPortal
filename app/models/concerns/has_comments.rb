module Has_comments
  def self.Included(base)
    base.class_eval do
      has_many :comments, as: :commentable

      def comment_count
        self.comments.size
      end
    end
  end
end
