class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      session[:reservation_params] = reservation_params
      @room = Room.find(@reservation.room_id)
    else
      @room = Room.find(params[:reservation][:room_id])
      render 'rooms/show'
    end
  end

  def create
    reservation_params_from_session = session[:reservation_params]
    @reservation = Reservation.new(reservation_params_from_session)
    @room = Room.find(@reservation.room_id)

    if @reservation.save
      redirect_to reservations_path
    else
      render 'rooms/show'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path 
  end

  private

  def reservation_params
    params.require(:reservation).permit(:checkin, :checkout, :people, :room_id)
  end

  
end

