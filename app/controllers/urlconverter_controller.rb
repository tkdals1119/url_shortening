class UrlconverterController < ApplicationController

  
    
  def create
    @originurl = params[:originurl] 
    @shorturl = params[:shorturl]
    
    if Converter.exists?(originurl: @originurl)
        @already_short_url = Converter.find_by(originurl: @originurl)
        render json: @already_short_url
    else
        @short = Converter.create(originurl: @originurl, shorturl: @shorturl)
        render json: @short
    end
  end
  
  
  def index
  end

end
