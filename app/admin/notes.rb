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
      f.input :body
      f.input :refereces
    end
    f.actions
  end
end
