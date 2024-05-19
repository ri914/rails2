class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_url 
  end

  def result
    @rooms = Room.where("address LIKE ?", "%#{params[:search]}%")
    @total_rooms = @rooms.count
  end

  def result2
    @rooms = Room.where("name LIKE ? OR detail LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    @total_rooms = @rooms.count # 正しい変数名に修正しました
  end
  
  private

  def room_params
    params.require(:room).permit(:name, :detail, :fee, :address, :room_id)
  end
end
