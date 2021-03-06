require 'spec_helper'
describe "Authentication" do
  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
	  fill_in "Email",:with=> user.email
	  fill_in "Password",:with=> user.password
	  click_button "Sign in"
	end
      describe "after signing in" do
	it "should render the desired protected page" do
	page.should have_selector('title', :text=> 'Edit user')
      end
    end
  end
  
  describe "in the users controller" do
    describe "visiting the users indes" do
      before {visit user_path}
      it {should have_selector('title',:text=>'Sign in')}
    end
  end
  
end
end
end

