class FoldersController < ApplicationController
  # GET /folders
  # GET /folders.json
  def index
    # pagination with each page containing 50 folders
    #@folders = Folder.all
    @folders = Folder.of_loggedin_user(current_user)
                      .paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @folders }
    end
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    folderid = params[:id]
    @folder = Folder.of_loggedin_user(current_user).find_by_id(folderid)

# folder is not present?
    if @folder.nil?
      flash[:notice] = "Folder with id "+folderid + " does not exist"
      redirect_to :action => 'index'
      return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  rescue => e
    redirect_to :action => 'index'
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
    @folder = Folder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.of_loggedin_user(current_user).find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(params[:folder])
    @folder.user_id = current_user.id

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render json: @folder, status: :created, location: @folder }
      else
        format.html { render action: "new" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.of_loggedin_user(current_user).find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy

    @folder = Folder.of_loggedin_user(current_user).find(params[:id])
    # binding.pry # exit
    @folder.notes.destroy
    @folder.destroy

    respond_to do |format|
      format.html { redirect_to folders_url }
      format.json { head :no_content }
    end
  end
end
