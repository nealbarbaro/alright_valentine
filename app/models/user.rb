# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)
#  crypted_password :string(255)
#  salt             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation

  has_one :subscription
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id', :dependent => :destroy
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id', :dependent => :destroy
  has_many :messages

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end
