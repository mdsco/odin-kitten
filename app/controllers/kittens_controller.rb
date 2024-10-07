class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to kitten_path(@kitten)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    debugger
    @kitten.attributes = kitten_params

    if @kitten.save
      redirect_to kitten_path(@kitten)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy

    redirect_to kittens_path, success: t(".success")
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require('kitten').permit(:name, :age, :softness, :cuteness)
  end
end
