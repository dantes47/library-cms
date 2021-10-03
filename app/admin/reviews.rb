# frozen_string_literal: true

ActiveAdmin.register Review do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :rating, :comment, :user_id, :book_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :comment, :user_id, :book_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
