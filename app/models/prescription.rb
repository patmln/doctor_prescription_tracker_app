class Prescription < ApplicationRecord
  belongs_to :doctor

  validates :title, presence:true
  validates :date, presence:true
  validates :medicine, presence:true
  validates :price, presence:true
  validates :quantity, presence:true
  validates :notes, presence:true
  validate :validate_date

  def validate_date
      if !self.date.nil? && self.date > Date.today
          errors.add(:date, "Date should not be later than today.")
      end
  end
end
