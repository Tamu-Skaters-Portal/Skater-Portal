class MembersController < ApplicationController
     before_action :set_member, only: %i[show edit update destroy]

  # GET /members or /members.json (going to to members table)
  def index
    @current_member ||= Member.find_by_token(cookies[:token]) if cookies[:token]
    if @current_member && @current_member.access_type == 1
      @members = Member.all
    else
      # redirect_to member_url(Member.find_one(@current_member.id))

      # TODO: iterate through memmbers until we find a matching token
      # TODO: if match then redirect to that member

      # redirect_to Member.find(@current_member.id)
      # redirect_to member_url(Member.find_by_token(@current_member.token))

      indexOfTokenMatch = 0
      for i in 1..Member.count do
      # puts "--------Member Token from array: " + Member.find(i).token
      # puts "--------Member Token from current member: " + cookies[:token]

        if Member.find(i).token == cookies[:token]
          indexOfTokenMatch = i
        end
      end

      if indexOfTokenMatch == 0
        redirect_to(root_path) # consider changing this to log in oauth page
      elsif indexOfTokenMatch != nil
        redirect_to action: "show", id: indexOfTokenMatch
      end
    end
  end

     # GET /members/1 or /members/1.json
     def show; end

     # GET /members/new
     def new
          @member = Member.new
     end

     # GET /members/1/edit
     def edit; end

     # POST /members or /members.json
     def create
          @member = Member.new(member_params)

          respond_to do |format|
               if @member.save
                    format.html { redirect_to(@member, notice: 'Member was successfully created.') }
                    format.json { render(:show, status: :created, location: @member) }
               else
                    format.html { render(:new, status: :unprocessable_entity) }
                    format.json { render(json: @member.errors, status: :unprocessable_entity) }
               end
          end
     end

     # PATCH/PUT /members/1 or /members/1.json
     def update
          respond_to do |format|
               if @member.update(member_params)
                    format.html { redirect_to(@member, notice: 'Member was successfully updated.') }
                    format.json { render(:show, status: :ok, location: @member) }
               else
                    format.html { render(:edit, status: :unprocessable_entity) }
                    format.json { render(json: @member.errors, status: :unprocessable_entity) }
               end
          end
     end

     # DELETE /members/1 or /members/1.json
     def destroy
          @member.destroy
          respond_to do |format|
               format.html do
                    redirect_to(members_url, notice: 'Member was successfully destroyed.')
               end
               format.json { head(:no_content) }
          end
     end

     private

     # Use callbacks to share common setup or constraints between actions.
     def set_member
          @member = Member.find(params[:id])
     end

     # Only allow a list of trusted parameters through.
     def member_params
          params.require(:member).permit(:name, :email, :token, :access_type, :paid_status, :points)
     end
end
