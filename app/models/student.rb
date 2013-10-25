require_relative '../../db/config'
require 'date'
require 'time'


class Student < ActiveRecord::Base  
  def name
    self[:first_name] + " " + self[:last_name]
  end

  def age
    Time.now.year - self[:birthday].year
  end

  def get_phone_number
    self[:phone].scan(/\d/).join
  end

  validates :email, :format => { :with => /.*[@].*[.].{2}/ }
  validates :email, :uniqueness => true 
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validates :get_phone_number, :length => { :minimum => 10 }
# implement your Student model here

end