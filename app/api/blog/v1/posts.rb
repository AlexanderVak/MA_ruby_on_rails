module Blog
  class Posts < Grape::API
    helpers do
      def declared_params
        declared(params, include_missing: false)
      end
    end

    version 'v1', using: :path
    format :json
    prefix :api

    resources :posts do
      desc 'Return list of posts'
      get do
        posts = Post.published
        present posts, with: Blog::Entities::AllPosts
      end

      desc 'Create new post'
      params do
        requires :title, type: String
        requires :body, type: String
        requires :published_at, type: String
      end
      post do
        Post.create!(declared_params)
      end
      route_param :post_id do
        desc 'Return single post'
        get do
          post = Post.find(params[:post_id])
          present post, with: Blog::Entities::Post
        end

        desc 'Update post'
        params do
          requires :title, type: String
          requires :body, type: String
          requires :published_at, type: String
        end
        patch do
          Post.find(params[:post_id]).update(declared_params)
        end

        desc 'Delete post'
        delete do
          Post.find(params[:post_id]).destroy
        end
      end
    end
  end


end
