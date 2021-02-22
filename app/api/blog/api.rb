module Blog
  class API < Grape::API
    mount Blog::Posts
  end
end
