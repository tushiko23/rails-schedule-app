class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedules_count = @schedules.length
    @today = Date.today
  end

  def new
    @today = Date.today
    @schedule = Schedule.new
  end


  def create
    @today = Date.today
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:success] = "スケジュールが作成されました"
      redirect_to schedules_path()
    else
      flash[:danger] = "スケジュールの作成に失敗しました。もう一度確認してください。"
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @today = Date.today
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @today = Date.today
    @schedule = Schedule.find(params[:id])
  end

  def update
    @today = Date.today
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:success] = "スケジュールを編集しました"
      redirect_to schedules_path()
    else
      flash[:danger] = "スケジュールの編集に失敗しました。もう一度確認してください。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:success] = "削除が完了しました"
    redirect_to schedules_path()
  end
end

private

def schedule_params
  params.require(:schedule).permit(:title, :start_date, :end_date, :is_allday, :memo)
end
