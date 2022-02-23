ActiveAdmin.register Subject do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, note_ids: [], notes_attributes: [:id, :name, :_destroy]

  show title: :name do
    h3 'You have ' + pluralize(subject.notes.count, 'note') + ' in this subject.'
    subject.notes.each do |note|
      div do
        h4 link_to "[#{note.id}] #{note.title}", admin_note_path(note)
        div do
          note.body.html_safe
        end
      end
    end
  end
end
