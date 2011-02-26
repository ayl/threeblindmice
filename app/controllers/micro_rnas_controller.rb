class MicroRnasController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def browse
    @method = params[:method]
    if (@method["algor"] == "absmindiff") 
      @all = MicroRna.browse(params[:browse])
    elsif (@method["algor"] == "abslogmindiff") 
      @all = MicroRna.logbrowse(params[:browse])
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
    @all = MicroRna.search(params[:search])
    @genename = params[:search]
    @intron = MicroRna.calculateIntronAvg(@all)
    @exon = MicroRna.calculateExonAvg(@all)
    respond_to do |format|
      format.html 
    end
  end

end
