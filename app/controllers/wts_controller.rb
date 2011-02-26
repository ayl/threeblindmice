class WtsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def browse
    @method = params[:method]
    if (@method["algor"] == "absmindiff") 
      @all = Wt.browse(params[:browse])
    elsif (@method["algor"] == "abslogmindiff") 
      @all = Wt.logbrowse(params[:browse])
    end
    respond_to do |format|
      format.html 
    end
  end


  def genesearch
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def search
    @all = Wt.search(params[:search])
    @genename = params[:search]
    @intron = Wt.calculateIntronAvg(@all)
    @exon = Wt.calculateExonAvg(@all)
    respond_to do |format|
      format.html 
    end
  end

end
