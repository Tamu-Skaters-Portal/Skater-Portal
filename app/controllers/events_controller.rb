class EventsController < ApplicationController
     before_action :set_event, only: %i[show edit update destroy]

     # GET /events or /events.json
     def index
          @current_member ||= Member.find_by_token(cookies[:token]) if cookies[:token]
          @events = Event.all
     end

     # GET /events/1 or /events/1.json
     def show
          @current_member ||= Member.find_by_token(cookies[:token]) if cookies[:token]
          @current_event = Event.find(params[:id])
          @val = Event.sign_in_page(@current_member, @current_event)
          if @val != 1
               flash[:notice] = "Member has received points for the event."
          elsif @val == 1
               flash[:notice] = "Event 60 minute sign in window is over."
          else
               flash[:notice] = 'Member is not signed in, please sign in to receive points.'
               redirect_to '/auth/google_oauth2'
          end
     end

     # GET /events/new
     def new
          @event = Event.new
     end

     # GET /events/1/edit
     def edit; end

     # POST /events or /events.json
     def create
          @event = Event.new(event_params)

          respond_to do |format|
               if @event.save
                    format.html { redirect_to(@event, notice: 'Event was successfully created.') } #message that returns if event was successfully created
                    format.json { render(:show, status: :created, location: @event) }
               else
                    format.html { render(:new, status: :unprocessable_entity) }
                    format.json { render(json: @event.errors, status: :unprocessable_entity) }
               end
          end
     end

     # PATCH/PUT /events/1 or /events/1.json
     def update
          respond_to do |format|
               if @event.update(event_params)
                    format.html { redirect_to(@event, notice: 'Event was successfully updated.') } #message that returns if event was successfully updated
                    format.json { render(:show, status: :ok, location: @event) }
               else
                    format.html { render(:edit, status: :unprocessable_entity) }
                    format.json { render(json: @event.errors, status: :unprocessable_entity) }
               end
          end
     end

     # DELETE /events/1 or /events/1.json
     def destroy
          @event.destroy
          respond_to do |format|
               format.html { redirect_to(events_url, notice: 'Event was successfully destroyed.') } #message that returns if event was successfully destroyed
               format.json { head(:no_content) }
          end
     end

     private

     # Use callbacks to share common setup or constraints between actions.
     def set_event
          @event = Event.find(params[:id])
     end

     # Only allow a list of trusted parameters through.
     def event_params
          params.require(:event).permit(:date, :location)
     end
end
