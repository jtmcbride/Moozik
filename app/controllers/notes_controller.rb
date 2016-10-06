class NotesController < ApplicationController

  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.track_id = params[:track_id]
    note.save
    redirect_to track_url(params[:track_id])
  end

  def destroy
    note = Note.find(params[:id])
    if current_user.id = note.user_id
      Note.destroy(params[:id])
      redirect_to track_url(params[:track_id])
    else
      render text: "Forbidden: You did not author this note." , status: 403
    end

  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
