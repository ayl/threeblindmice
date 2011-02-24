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
