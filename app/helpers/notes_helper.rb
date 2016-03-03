module NotesHelper
  def permissions_notes
    current_user.id == @note.user_id
  end
end
