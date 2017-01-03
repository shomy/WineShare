class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :update, :basics, :hyouka, :country, :photos, :publish, :smell, :address]
  before_action :access_deny, only: [:basics, :hyouka, :country, :photos, :publish, :smell, :address]

  def index
    @listings = current_user.listings
  end

  def show
    @photos = @listing.photos
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

def address
end

def photos
  @photo = Photo.new
end

def publish
end

private
def listing_params
  params.require(:listing).permit(:name, :price, :wine_color, :wine_desc, :country, :hinsyu, :sanchi, :hyouka, :smell, :shop, :address, :active)
end

def set_listing
  @listing = Listing.find(params[:id])
end

def access_deny
  if !(current_user == @listing.user)
    redirect_to root_path, notice: "他人の編集ページにはアクセスできません"
  end
end

end