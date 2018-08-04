class FriendsController < ApplicationController
  
  # GET /friends
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  def show
    @friend = Friend.find(params[:id])
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  def create
    @friend = Friend.new(friend_params)

    if @friend.save
      redirect_to @friend, notice: 'Friend was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /friends/1
  def update
    @friend = Friend.find(params[:id])
    
    if @friend.update(friend_params)
      redirect_to @friend, notice: 'Friend was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /friends/1
  def destroy
    @friend = Friend.find(params[:id])
    
    @friend.destroy
    redirect_to friends_url, notice: 'Friend was successfully destroyed.'
  end
  
  def import_csv
    file_name = params[:csv].tempfile
    
    CSV.foreach(file_name, headers: true) do |row|
      first_name = row['first_name']
      last_name = row['last_name']
      date_of_birth = row['date_of_birth']
      email = row['email']
      
      Friend.create(first_name: first_name, last_name: last_name, date_of_birth: Date.parse(date_of_birth), email: email)
    end
    
    redirect_to friends_url
  end
  
  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def friend_params
    params.require(:friend).permit(:first_name, :last_name, :date_of_birth, :email)
  end
end
