# app/controllers/movies_controller.rb !

class MoviesController < ApplicationController

  def show
    @movie = Movie.find_by_id(params[:id])
    if @movie == nil then
      flash[:notice] = "La pelicula solicitada #{params[:id]} no existe."
      redirect_to movies_path
    end
  end

  def index
    @movies = Movie.all #.sort_by {|movie| movie.title.downcase} #Ejercicio 7: ordenadas 
    # alfabeticamente en index.html.haml
  end

  def new
    # default: render 'new.html.haml' template
  end

  def create
    if params[:commit] == 'Cancel' then
      redirect_to movies_path
    else
      @movie = Movie.create(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movie_path(@movie)
    end
  end

  def edit
    @movie = Movie.find_by_id(params[:id])
    if @movie == nil then
      flash[:notice] = "La pelicula solicitada #{params[:id]} no existe."
      redirect_to movies_path
    end
  end

  def update
    @movie = Movie.find params[:id]
    if params[:commit] == 'Update Movie Info' then
      @movie.update_attributes!(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully updated."
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] =
    "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end


