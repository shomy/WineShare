class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :hyouka, :country, :photos, :publish, :smell]

  def index
  end

  def show
  end

  def new
    #現在のユーザーのmodel,Listingの作成
    @listing = current_user.listings.build
  end

  def create
   # パラメータとともに現在のユーザーのリスティングを作成
   @listing = current_user.listings.build(listing_params)

   if @listing.save
    redirect_to manage_listing_basics_path(@listing), notice: "保存しました"
  else
    redirect_to new_listing_path, notice: "保存できませんでした"
  end
end

def edit
end

def update
 @listing.update(listing_params)
 redirect_to :back, notice: "更新完了"
end

def basics
end

def hyouka
end

def country
end

def photos
  @photo = Photo.new
end

def publish
end

private
def listing_params
  params.require(:listing).permit(:name, :price, :wine_color, :wine_desc, :country, :hinsyu, :sanchi, :hyouka, :smell, :active)
end

def set_listing
  @listing = Listing.find(params[:id])
end
end