class MicroRnaMetasController < ApplicationController
  def index
    @meta = MicroRnaMeta.all.first

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
