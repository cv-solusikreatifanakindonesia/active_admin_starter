ActiveAdmin.register AdminUser, as: "User" do
  menu :label => "Users", :priority => 2
  permit_params :email, :password, :password_confirmation

  index :title=>"Users" do
    selectable_column
    column :email
    column :created_at
    actions
  end

  filter :email_contains
  filter :created_at, as: :date_range

  form do |f|
    f.inputs "User" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions do
      if resource.persisted?
        # edit
        f.action :submit, as: :input, type:'submit', label: 'Update Existing User'
      else
        # new
        f.action :submit, as: :input, type:'submit', label: 'Create New User'
      end
      f.action :cancel, as: :link, label: 'Cancel'
    end
  end

end
