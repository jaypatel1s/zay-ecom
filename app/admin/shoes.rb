ActiveAdmin.register Shoe do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :category_id, :name, :brand, :size, :active, :price, :discount, :file
  #
  # or
  #
  # permit_params do
  #   permitted = [:category_id, :name, :brand, :size, :active, :price, :discount]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :category_id
  filter :name
  filter :brand
  filter :size
  filter :active
  filter :price
  filter :discount
  filter :file

  form do |f|
    f.inputs do
      f.input :category_id
      f.input :name
      f.input :brand
      f.input :size
      f.input :active
      f.input :price
      f.input :discount
      f.input :file, as: :file
    end
    f.actions
  end
end
