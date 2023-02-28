class StaticPagesController < ApplicationController
  def root
    respond_to do |format|
      format.html {render :root}
      format.json {remder json: {message: 'Hello Kev'}}
    end
  end
end
