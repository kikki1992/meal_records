class PetsController < ApplicationController
  def index
    @pets = current_user.pets.order(id: :desc).page(params[:page])
  end

  def show
    @pet = current_user.pets.find(params[:id])
    @records = @pet.records.order(:date).page(params[:page])
    @count_records = @pet.records.count
    
    gon.records = @count_records
    gon.date = []
    gon.food_amount =[]
    gon.weight =[]
    if !!@records 
      @records.each do |record|
        
        gon.date << record.date
        gon.food_amount << record.food_amount
        gon.weight << record.weight
      end
    end
    gon.food_amountmin = 0
    gon.food_amountmax = gon.food_amount.max
    gon.weightmin=0
    gon.weightmax=gon.weight.max
    gon.datemin=gon.date.min
    gon.datemax=gon.date.max
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
  
  def destroy
    @pet = current_user.pets.find(params[:id])
    @pet.destroy

    flash[:success] = 'petのデータは正常に削除されました'
    redirect_to current_user
  end
  
  private

  def pet_params
    params.require(:pet).permit(:name, :animals_kind, :birthday, :img)
  end
end