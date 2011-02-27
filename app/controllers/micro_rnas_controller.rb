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
    if (params[:one] == "yes")
      @all = Array(MicroRna.find(params[:id]))
      @genename = @all.first.gene
    else 
      @all = MicroRna.search(params[:search])
      @genename = params[:search]
    end
    @intron = MicroRna.calculateIntronAvg(@all)
    @exon = MicroRna.calculateExonAvg(@all)
    @intergen = MicroRna.calculateIntergenicAvg(@all)
    if @exon.first["y"].nan?
      @exon = []
    end
    if @intergen.first["y"].nan?
      @intergen = []
    end
    if @intron.first["y"].nan?
      @intron = []
    end
    respond_to do |format|
      format.html 
    end
  end

end
