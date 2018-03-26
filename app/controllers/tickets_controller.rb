class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.effectiveness
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    #@ticket = current_user.tickets.build
    @try = current_user.user_tries.last
    #@try.tickets.build(time: "00:00")
    #@try.tickets.build(time: "18:00")
    #@try.tickets.build(time: "19:00")
    #@try.tickets.build(time: "20:00")
    #@try.tickets.build(time: "21:00")
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = current_user.user_tries.last.tickets.build(ticket_params)

    respond_to do |format|
      if @ticket.save
        current_user.user_tries.last.state_machine.transition_to(:recruit)
        format.html { redirect_to root_path, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_tickets
    ticket_params = params[:user_tickets]
    ticket_params.each do |tp|
      current_user.user_tries.last.tickets.create(user_try_id: current_user.user_tries.last.id,time: tp+":00",place:"新宿",point: "2000",talk_theme: current_user.profile.default_talk_theme)
    end
    current_user.user_tries.last.state_machine.transition_to(:recruit)
    redirect_to root_path
  end

  def today_ticket
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.fetch(:ticket, {}).permit(ticket_attributes)
    end

    def ticket_attributes
      [
        :place,:point,:time,:talk_theme
      ]
    end
end
