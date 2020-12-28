class Semester < ApplicationRecord
    self.table_name="semester"

    has_one :group
end
