class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end
  # most verbose
  # 
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species}
  # end
  
  #  slice only works for single hashes, not nested one
  
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  # end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:id, :name, :species]
    else
      render json: { message: 'Bird not found' }  
    end
  end

end