class MicroRnasController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def browse
    @all = MicroRna.browse(params[:browse])
    respond_to do |format|
      format.html 
    end
  end

end
