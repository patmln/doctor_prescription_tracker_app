class Doctor < ApplicationRecord
    has_many :prescriptions

    validates :name, presence:true
    validates :field, presence:true
    validates :license_number, presence:true, uniqueness: true
end
