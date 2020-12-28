class Student < ApplicationRecord
    self.table_name="student"

    belongs_to :group
    validates :group_id ,presence: true
    validates :vardas ,presence: true
    validates :pavarde ,presence: true
    validates :slaptazodis ,length: {in:6..20}
    validates :elpastas ,presence: true
    validates :gimimodata ,presence: true

    def create_student(grupe1,vardas,pavarde,slaptazodis,slaptazodis2,elpastas,gimimodata)
        if slaptazodis==slaptazodis2 then
            if grupe1.to_i>0 then
                stud=Student.new(group_id:grupe1,vardas:vardas,pavarde:pavarde,slaptazodis:slaptazodis,elpastas:elpastas,gimimodata:gimimodata)
                if stud.valid? then
                    stud.save
                    return "Naudotojas issaugotas"
                else
                    return "Slaptazodis per trumpas"
                end
            else
                return "Pasirinkite grupe"
            end
        else
            return "Slaptazodziai nesutapo"
        end
    end

    def authentification(given_name,given_surname,given_password)
        stud=Student.find_by(vardas: given_name,pavarde: given_surname, slaptazodis: given_password)
        if stud!=nil then
            return stud
        else
            return stud
        end
    end

    def update_student(stud_id,vardas,pavarde,slaptazodis,grupes_id,el_pas)
        studentai=Student.all
        student=Student.find_by(id: stud_id)
        student.update_columns(vardas: vardas, pavarde: pavarde, slaptazodis: slaptazodis,group_id: grupes_id,elpastas: el_pas)
        return "dp"
    end

end
