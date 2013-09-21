require 'spec_helper'

describe "Static pages" do
  before{ visit contact_path}
  subject {page}

  describe "Contact Page" do
    it {should have_selector('h1',:text=>'Contact')}    
    it {should have_selector('title',:text=> "Sample App | Contact")}
    
  end
end
