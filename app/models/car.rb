class Car < ActiveRecord::Base
  has_many :day_booking
  has_one :username, :class_name => "DayBooking", :conditions => { :primary => true }

  attr_accessible :bookingtype, :forsale, :lastservice, :longtermassigned, :make, :model, :outofaction, :registration, :servicedue, :sold

  validates :make, :presence => :true
  validates :model, :presence => :true
  validates :registration, :presence => :true, :uniqueness => :true
  validates :bookingtype, :presence => { :message => "Availability type must be selected!" }
  #validates :servicedue, :presence => :true,
    #:date => {:after => Date.today, :message => 'must be after today'}, :on => :create
  #validates :lastservice, :presence => :true,
    #:date => {:after => Date.today, :message => 'must be after today'}, :on => :create

  def set_long_term_assigned(ltassigned)
    @longtermassigned = ltassigned
    return ltassigned
  end
end
