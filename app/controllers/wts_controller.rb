class WtsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def browse
    @all = Wt.browse(params[:browse])
    respond_to do |format|
      format.html 
    end
  end

end
