class SearchController < ApplicationController
  def perform
    tela_origem = session[:tela_origem]
    @search_query = params[:search_query]
    case tela_origem 
      when 'users'
        redirect_to users_path(search_query: @search_query)
      when 'conselhoclasses'
        redirect_to conselhoclasses_path(search_query: @search_query)
      when 'equipes'
        redirect_to equipes_path(search_query: @search_query)
      when 'estabelecimentos'
        redirect_to estabelecimentos_path(search_query: @search_query)
      when 'escalacmpts'
        redirect_to escalacmpts_path(search_query: @search_query)
    end
  end
end
