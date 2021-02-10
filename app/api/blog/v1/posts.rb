class Blog::Posts < Grape::API
  namespace :v1 do
    get do
      Post.all
    end

    get ':id' do
      post = Post.find(params[:id])
      present post, with: Blog::Entities
    end

  end
end
