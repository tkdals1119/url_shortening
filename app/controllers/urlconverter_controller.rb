class UrlconverterController < ApplicationController

  def create # originurl 과 shorturl 을 받아와서 중복 검사를 한 뒤 DB에 추가하는 함수입니다.
    @originurl = params[:originurl] 
    @shorturl = params[:shorturl]
    
    if Converter.exists?(originurl: @originurl) # 입력 받은 originurl 의 중복검사를 하는 부분입니다.
        @already_short_url = Converter.find_by(originurl: @originurl)
        render json: @already_short_url
    else
        @short = Converter.create(originurl: @originurl, shorturl: @shorturl)
        render json: @short
    end
  end
  
  
  def index
  end
  
  def convert # short URL 을 origin URL 로 redirect 하는 부분입니다.
    @getshort = params[:shorturl]
    @sendshort = "https://"+request.host_with_port + "/" + @getshort

    @getorigin = Converter.find_by(shorturl: @sendshort)
    
    puts "@@@@@@@@@@@@@@@"
    puts @sendshort
    puts @getorigin
    puts "@@@@@@@@@@@@@@@"

    
    
    # if @getorigin.originurl.include? "https://"
    #   puts @getorigin.originurl 
      
    # elsif @getorigin.originurl.include? "http://"
    # puts @getorigin.originurl 

    # else
    #   @getorigin.originurl = "http://"+@getorigin.originurl
    #   puts @getorigin.originurl
    # end
    
      redirect_to @getorigin.originurl

  end
end
