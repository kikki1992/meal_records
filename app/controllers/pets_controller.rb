class PetsController < ApplicationController
  def index
    @pets = current_user.pets.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @pet = current_user.pets.find(params[:id])
    @records = @pet.records.order(id: :desc).page(params[:page]).per(5)
  end
  
  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      flash[:success] = 'ペットデータを登録しました。'
      redirect_to @pet
    else
      flash.now[:danger] = 'ペットの登録に失敗しました。'
      render :new
    end
  end
  
  private

  def pet_params
    params.require(:pet).permit(:name, :animals_kind, :birthday)
  end
  
  
end
