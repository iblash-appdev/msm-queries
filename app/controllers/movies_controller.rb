class MoviesController < ApplicationController

  def index 
    @list_of_movies = Movie.all
    render({ :template => "movie_templates/index.html.erb"})
  end

  def movie_details
    # params looks like {"an_id" =>"42"}

    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id}).at(0)

    @filmography  = Movie.where({ :director_id => @the_director.id })

    render({ :template => "director_templates/show.html.erb" })
  end

end
