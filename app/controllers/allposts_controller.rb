class AllpostsController < ApplicationController
    Post_per_page=5
    def index
        @page=params.fetch(:page,0).to_i
        @allposts =Post.offset(@page * Post_per_page).limit(Post_per_page)
    end

end
