module UsersHelper
   def content_available?
      self.posts.any? || self.comments.any?
   end
end
