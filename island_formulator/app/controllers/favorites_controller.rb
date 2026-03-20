class FavoritesController < ApplicationController
  before_action :require_authentication

  def index
    @favorited_recipes = Current.user.favorited_recipes.order(created_at: :desc)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = Current.user.favorites.build(recipe: @recipe)

    if @favorite.save
      redirect_back(fallback_location: recipes_path, notice: "Added to favorites! ❤️")
    else
      redirect_back(fallback_location: recipes_path, alert: "Already in favorites!")
    end
  end

  def destroy
    @favorite = Current.user.favorites.find_by(recipe_id: params[:recipe_id])
    @favorite&.destroy
    redirect_back(fallback_location: recipes_path, notice: "Removed from favorites")
  end
end
