class WtMetasController < ApplicationController
  def index
    @meta = WtMeta.all.first

    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
