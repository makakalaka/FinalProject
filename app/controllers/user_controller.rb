class UserController < ApplicationController
  skip_before_action :verify_authenticity_token
  @response1
  # prisijungimai/atsijungimai
  def login
    @msg=params[:message]
  end

  def login_user #prisijungimas
    stud=Student.new
    response=stud.authentification(params[:name],params[:surname],params[:password])#autentifikuoja, jei rastas, proceed
    if response==nil then
      redirect_to controller:'user',action: 'login', message: "nil"
    else
      if Group.find_by(id: response['group_id'].to_i).pavadinimas=="Admin" then #jei naudotojas grupes admin narys
        session[:user]=response
        redirect_to controller:'admin',action: 'admin_page', message: "Admin"
      else
        if Group.find_by(id: response['group_id'].to_i).pavadinimas=="Destytojas" then #jei naudotojas grupes destytojas narys
          session[:user]=response
          redirect_to controller:'lecturer',action: 'lect_page', message: "Lecturer"
        else  #jei naudotojas grupes Studentas narys
          session[:user]=response
          redirect_to controller:'student',action: 'student_page', message: "Student"
        end
      end
    end
  end

  def logout #atsijungimas
    session[:user]=nil
    redirect_to controller:'index',action: 'homepage', message: "Atsijungta"
  end
end
