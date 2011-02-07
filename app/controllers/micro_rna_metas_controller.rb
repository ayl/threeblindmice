class MicroRnaMetasController < ApplicationController
  # GET /micro_rna_metas
  # GET /micro_rna_metas.xml
  def index
    @meta = MicroRnaMeta.all.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @micro_rna_metas }
    end
  end

end
