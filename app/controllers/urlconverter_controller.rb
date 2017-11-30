class UrlconverterController < ApplicationController
    
    def create
    @originurl = params[:originurl] 
    @shorturl = params[:shorturl]
    
    @short = Converter.create(originurl: @originurl, shorturl: @shorturl)
    render json: @short
  end
  
end
