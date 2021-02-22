module Blog
  module Entities
    class AllPosts < Grape::Entity
      expose :id
      expose :author do |post|
        post.user.first_name
      end
      expose :title
    end
    class Post < AllPosts
      expose :published_at, as: :published
      expose :body, as: :description
    end
  end
end

