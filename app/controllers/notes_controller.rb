class NotesController < ApplicationController
  before_action :current_note, only:[:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.create(note_params)
 
    if @note.save
      puts "------>#{@note.user_id.class}"
      redirect_to @note
    else
      render 'new'
    end
  end

  def show
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
 
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :user_id, :image) 
  end

  def current_note
    @note = Note.find(params[:id])
  end

end

