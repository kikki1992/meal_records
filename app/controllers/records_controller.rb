class RecordsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @record = current_pet.records.new
  end

  def create
    @pet = Pet.find(params[:record][:pet_id])
    @record = @pet.records.build(records_params)
    
    
    if @record.save
      flash[:success] = 'recordを登録しました。'
      redirect_to @pet
    else
      flash.now[:danger] = 'recordの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    flash[:success] = 'recordのデータは正常に削除されました'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def records_params
    params.require(:record).permit(:pet_id, :food_name, :food_amount, :weight, :date)
  end
  
end
