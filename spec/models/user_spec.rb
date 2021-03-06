# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
  before {@user=User.new(:name=>"example user",:email=>"user@example.com",:password=>"foobar",:password_confirmation => "foobar")}
  
  subject{@user}
  it {should respond_to(:name)}
  it {should respond_to(:admin)}
  it {should respond_to(:email)}
  it {should respond_to(:password_digest)}
  it {should respond_to(:remember_token)}  
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should_not be_admin}
  
  describe "with admin attribute set to trie" do
    before {@user.toggle!(:admin)}
    it {should be_admin}
  end
  
  describe "remember token" do
    before {@user.save}
    its(:remember_token) {should_not be_blank}
  end
  
  describe "when the password is not present" do
    before{@user.password=@user.password_confirmation=" "}
    it {should_not be_valid}
  end
  
  describe "when the password doesnot match confirmation" do
    before{@user.password_confirmation="mismatch"}
    it {should_not be_valid}
  end
    
  describe "when name is not present" do
    before{@user.name=""}
    it {should_not be_valid}
  end

  describe "when email is not present" do
    before{@user.email=""}
    it {should_not be_valid}
  end
  
  describe "when name is too long" do
    before{@user.name="a"*51}
    it {should_not be_valid}
  end
  
  describe "when the email address is not valid" do
    it "should be invalid" do
      addresses= %w[user_at_gmail.com user_at_gmail,com]
      addresses.each do |invalid_address|
        @user.email=invalid_address
        @user.should_not be_valid
      end
    end
  end   

  describe "when the email address is valid" do
    it "should be valid" do
      addresses= %w[user@gmail.com user_mohisn@gmail.com]
      addresses.each do |valid_address|
        @user.email=valid_address
        @user.should be_valid
      end
    end
  end   
  
  describe "when email address is already taken" do
    before do
      user_with_same_email=@user.dup
      user_with_same_email.email=@user.email.upcase
      user_with_same_email.save
    end
     it {should_not be_valid}
  end
  
    
end
