module RecipesHelper
    def set_recipe_paginator_attrs
      recipe_count = Recipe.count
      {recipe_count: "#{recipe_count}", page: "#{params[:page]}", per_page: "#{params[:per_page]}"}
    end
end