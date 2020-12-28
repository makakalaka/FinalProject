class AdminController < ApplicationController
  protect_from_forgery with: :null_session
  
  @global_group=Group.all
  # group crud
  def admin_group_update
    @msg=params[:message]
  end

  def confirm_updateAction #update lange spaudziamas mygtukas
    msg=params[:group_name]
    newname=params[:new_name]
    gr=Group.new
    response=gr.update_group(msg,newname)
    if response then
      redirect_to controller:'admin',action: 'groups_display', message: msg+" pavadinimas pakeistas i "+newname
    else
      redirect_to controller:'admin',action: 'groups_display', message: "Prasome ivesti pavadinima"
    end
  end

  def update_groupAction #display lange spaudziamas Redaguoti mygtukas
    msg=params[:group_name]
    redirect_to controller:'admin',action: 'admin_group_update', message: msg
  end
  def groups_display #meniu juostoj (admin) spaudziamas Grupiu perziura mygtukas
    @msg=params[:message]
    @groups=Group.all
  end
  def delete_groupAction #perziuroje spaudziamas Delete mygtukas
    msg=params[:group_name]
    group=Group.find_by(pavadinimas: msg)
    group_to_delete=msg
    group.destroy
    redirect_to controller:'admin',action: 'groups_display', message: group_to_delete+" istrinta."
  end
  def create_group #meniu spaudziamas new group
    @msg=params[:message]
  end
  def create_groupAction #new group lange spaudziama register
    msg=params[:new_group]
    gr=Group.new
    response=gr.create_new_group(msg)
      redirect_to controller:'admin',action: 'create_group', message: response
  end

  # user crud
  def create_user #meniu spaudziamas new user 
    @groups_list=Group.all
    @msg=params[:message]
  end

  def create_userAction # kai spaudziamas mygtukas registruoti naudotoja
    studentas=Student.new
    response=studentas.create_student(params[:pasirinkta_grupe],params[:vardas],params[:pavarde],params[:slaptazodis],params[:slaptazodis2],params[:elpastas],params[:gimimodata])
    redirect_to controller:'admin',action: 'create_user', message: response
  end

  def users_display
    @groups_list=Group.all
    @students=Student.all
    @msg=params[:message]
  end
  #useriai
  def query_usersAction
    grupe=Group.find_by(id: params[:pasirinkta_grupe])
    raktazodis=params[:raktazodis]
    users=Student.all
    @found_users=Array.new
    if grupe==nil then
      if raktazodis==nil then
        @found_users=Student.all
      else
        for i in 0..users.length-1
          if users[i].vardas.include? raktazodis then
            @found_users.append(users[i])
          end
        end
     end
    else
      if raktazodis=="" then
        for i in 0..users.length-1
          if users[i].group_id==grupe.id then
            @found_users.append(users[i])
          end
        end
      else
        for i in 0..users.length-1
          if users[i].vardas.to_s.include?(raktazodis.to_s) && users[i].group_id==grupe.id then
            @found_users.append(users[i])
          end
        end
      end
    end
    redirect_to controller:'admin',action: 'users_display', message: @found_users
  end

  def user_update
    @msg=params[:message]
    naudotojai=Student.all
    @groups_list=Group.all
    @naudotojas=Student.find_by(id: @msg)
    @naudotojo_grupe=Group.find_by(id: @naudotojas.group_id)
  end

  def update_userAction
    redirect_to controller:'admin',action: 'user_update', message: params[:student_id]
  end
  def delete_userAction
    redirect_to controller:'admin',action: 'user_delete', message: params[:student_id]
  end
  def update_userAction2
    stu=Student.find_by(id: params[:stud_id])
    response=stu.update_student(params[:stud_id],params[:vardas],params[:pavarde],params[:slaptazodis],params[:pasirinkta_grupe],params[:el_pastas])
    redirect_to controller:'admin',action: 'users_display', message: response

  end

end
