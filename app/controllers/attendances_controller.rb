class AttendancesController < ApplicationController
     before_action :setAttendance, only: %i[show edit update destroy]

     # GET /attendances or /attendances.json
     def index
          @attendances = Attendance.all
     end

     # GET /attendances/1 or /attendances/1.json
     def show; end

     # GET /attendances/new
     def new
          @attendance = Attendance.new
     end

     # GET /attendances/1/edit
     def edit; end

     # POST /attendances or /attendances.json
     def create
          @attendance = Attendance.new(attendance_params)

          respond_to do |format|
               if @attendance.save
                    format.html do
                         redirect_to(@attendance, notice: 'Attendance was successfully created.')
                    end
                    format.json { render(:show, status: :created, location: @attendance) }
               else
                    format.html { render(:new, status: :unprocessable_entity) }
                    format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
               end
          end
     end

     # PATCH/PUT /attendances/1 or /attendances/1.json
     def update
          respond_to do |format|
               if @attendance.update(attendance_params)
                    format.html do
                         redirect_to(@attendance, notice: 'Attendance was successfully updated.')
                    end
                    format.json { render(:show, status: :ok, location: @attendance) }
               else
                    format.html { render(:edit, status: :unprocessable_entity) }
                    format.json { render(json: @attendance.errors, status: :unprocessable_entity) }
               end
          end
     end

     # DELETE /attendances/1 or /attendances/1.json
     def destroy
          @attendance.destroy
          respond_to do |format|
               format.html do
                    redirect_to(attendances_url, notice: 'Attendance was successfully destroyed.')
               end
               format.json { head(:no_content) }
          end
     end

     private

     # Use callbacks to share common setup or constraints between actions.
     def setAttendance
          @attendance = Attendance.find(params[:id])
     end

     # Only allow a list of trusted parameters through.
     def attendanceParams
          params.require(:attendance).permit(:member_id, :event_id)
     end
end
