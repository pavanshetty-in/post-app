class AllpostsController < ApplicationController
    def index
        @allposts =Post.all
    end

end
