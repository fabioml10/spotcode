class Api::V1::DashboardController < ApplicationController

  def index
    load_recent_heard
    load_recommendations
  end
 
  private

  #current_user é do devise, então faz a busca por esse usuario (logado)
  def load_recent_heard
    p ">>>>> Ver diferença do metodo MAP."
    p @recent_albums = current_user.recently_heards.order("created_at DESC").limit(4)
    # & significa registro atual, então atual[:album]
    p @recent_albums = current_user.recently_heards.order("created_at DESC").limit(4).map(&:album)
  end

  def load_recommendations
    heard_categories = @recent_albums.map(&:category)
    if heard_categories.present?
      p ">>>>> Ver como o joins e select funcionam."
      p @recommended_albums = Album.joins(:category, :songs).where(category: heard_categories).order("songs.played_count")
                                .select("distinct albums.*").limit(12)
    else
      #sequenciais ou aleatorios
     # @recommended_albums = Album.all.limit(12)
      @recommended_albums = Album.all.sample(12)
    end
  end

end
