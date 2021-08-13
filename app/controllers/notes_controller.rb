class NotesController < ApplicationController

	def create
	    @folder = Folder.find(params[:folder_id])
	    #@note = @folder.notes.create(params[:note])


	    @note_params = params[:note]
	    @note_params.merge!({user_id: current_user.id})
	    @note = @folder.notes.create(@note_params)


	    #Note.create!(
	    #	title: @note_params[:title],
	    #	body: @note_params[:body],
	    #	folder_id: params[:folder_id],
	    #	user_id: current_user.id
	    #)



	    redirect_to folder_path(@folder)
  	end

  	def edit
    	@folder = Folder.find(params[:folder_id])
  		@note = @folder.notes.of_loggedin_user(current_user).find(params[:id])
  	end

  	def destroy
  		@folder = Folder.find(params[:folder_id])
  		@note = Note.of_loggedin_user(current_user).find(params[:id])
  		@note.destroy
  		redirect_to folder_path(@folder)
  	end

end


# destroy & delete