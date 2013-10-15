class Lease < ActiveRecord::Base
  belongs_to :car
  before_save :lease_on
  before_destroy :lease_off

  attr_accessible :username, :registration, :startdate, :enddate

  validates :username, :presence => :true
  validates :registration, :presence => :true
  validates :startdate, :presence => :true
  validates :enddate, :presence => :true

  def lease_on
    car = Car.where(["registration = ?", self.registration]).first
    car.update_attribute(:longtermassigned, car.set_long_term_assigned(true))
  end

  def lease_off
    car = Car.where(["registration = ?", self.registration]).first
    car.update_attribute(:longtermassigned, car.set_long_term_assigned(false))
  end
end
