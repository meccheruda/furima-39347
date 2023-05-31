class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    item_call
  end

  def edit
    item_call
    return unless current_user != @item.user

    redirect_to root_path
  end

  def update
    item_call
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :postage_id,
                                 :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end

  def item_call
    @item = Item.find(params[:id])
  end
end
