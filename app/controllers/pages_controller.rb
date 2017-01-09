class PagesController < ApplicationController
  def index #views/index.html.erbを表示させるというアクション
    @users = User.all
  end


  def namesearch
    if params[:namesearch].present?


      if params["name"].present?

      @name = params["name"]

      namerr = [@name]


    end

      @listings = Listing.where(active: true)

    else

      @listings = Listing.where(active: true).all

    end

    @arrlistings = @listings.to_a

  end



  def search
    if params[:search].present?

      session[:address] = params[:search]

      if params["lat"].present? && params["lng"].present?

      @latitude = params["lat"]
      @longitude = params["lng"]

      geolocation = [@latitude,@longitude]


    else
      geolocation = Geocoder.coordinates(params[:search])
      @latitude = geolocation[0]
      @longitude = geolocation[1]

    end

          @listings = Listing.where(active: true).near(geolocation, 100, order: 'distance')

    # 検索欄が空欄の場合
    else

      @listings = Listing.where(active: true).all
      @latitude = @listings.to_a[0].latitude
      @longitude = @listings.to_a[0].longitude  

    end


    # Q条件をまとめたものをセッションQに入れる
    session[:q] = {"price_gteq"=>session[:price_gteq], "price_lteq"=>session[:price_lteq],"name_cont"=>session[:name_cont]}




    # ransack検索
    @search = @listings.ransack(session[:q])
    @result = @search.result(distinct: true)

  #リスティングデータを配列にしてまとめる 
    @arrlistings = @listings.to_a

  end


  def ajaxsearch
    
    # まずajaxで送られてきた緯度経度をセッションに入れる
    if !params[:geolocation].blank?
      geolocation = params[:geolocation]
    end


 


    @listings = Listing.where(active: true).near(geolocation, 100, order: 'distance')

    #リスティングデータを配列にしてまとめる 
    @arrlistings = @listings.to_a



    respond_to :js
  
  end

end
