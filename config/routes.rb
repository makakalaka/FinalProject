Rails.application.routes.draw do
  
  get 'lecturer/lect_page'
  # index
  get 'index/homepage'
  get 'index/homepage'
  # admin
  get 'admin/groups_display'
  get 'admin/admin_page'
  get 'admin/groups_display'
  get 'admin/create_group'
  get 'admin/create_user'
  get 'admin/users_display'
  post 'admin/query_usersAction'
  get 'admin/admin_group_update'
  get 'admin/user_update'
  get 'admin/user_delete'
  post 'admin/update_userAction2'
  post 'admin/update_userAction' 
  post 'admin/delete_userAction'
  post 'admin/create_userAction'
  post 'admin/create_groupAction'
  post 'admin/delete_groupAction'
  post 'admin/update_groupAction'
  post 'admin/confirm_updateAction'
  # user
  get 'user/login'
  post 'user/login_user'
  post 'user/logout'
  # student
  get 'student/student_page'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
