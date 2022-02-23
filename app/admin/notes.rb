ActiveAdmin.register Note do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :subject_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :subject_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :body, :refereces, :subject_id
  form do |f|
    f.inputs do
      f.input :subject_id, :as => :select, :collection => Subject.all.map{|s| [s.name, s.id]}
      f.input :title
      f.input :body, as: :quill_editor
      f.input :refereces, :placeholder => "add multiple references by comma"
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :body do |note|
        div class: 'note-body' do
          raw note.body
        end
      end
      row :refereces do |note|
        a = note.refereces.split(',')
        a.map{|r| link_to r, r}

      end
      row :subject.name
    end
  end

  index do
    selectable_column
    column :title
    column :body do |note|
      raw note.body.truncate(200)
    end
    column :refereces do |note|
      a = note.refereces.split(',')
      a.map{|r| link_to r, r}.join('<br><br>').html_safe
    end
    column :subject.name.humanize do |note|
      link_to note.subject.name, admin_subject_path(note.subject)
    end
    column :created_at do |note|
      note.created_at.strftime("%d/%m/%Y")
    end
    column :updated_at do |note|
      note.updated_at.strftime("%d/%m/%Y")
    end
    actions
  end
end
