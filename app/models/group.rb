class Group < ApplicationRecord
   self.table_name="group"
   has_many :students, dependent: :destroy
   validates :pavadinimas ,presence: true


   def update_group(pavadinimas1,new_name)
      group=Group.find_by(pavadinimas: pavadinimas1)
      if new_name!="" and new_name!=nil then
         group.update_columns(pavadinimas: new_name)
         return true
      else
         return false
      end
   end

   def create_new_group(pavadinimas)
      exists=Group.find_by(pavadinimas: pavadinimas)
      if exists==nil then
         group=Group.new(pavadinimas: pavadinimas)
         if group.valid? then   
         group.save
         else
            return "Prasome ivesti pavadinima"
         end
         return pavadinimas+" grupe sukurta sekmingai."
      else
         return "Grupe tokiu pavadinimu jau egzistuoja."
      end
   end
end
