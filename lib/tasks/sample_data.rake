namespace :db do
  desc "Fill database with simple data"
  task :populate=> :environment do
    admin=User.create!(:name=>"Mohsin",:email=>"mohsin@gmail.com",:password=>"mohsin",:password_confirmation=>"mohsin")
    admin.toggle!(:admin)
    
    User.create!(:name=>"Example User",:email=>"example@gmail.com",:password=>"mohsin",:password_confirmation=>"mohsin")
    99.times do |n|
      name=Faker::Name.name
      email="example-#{n+1}@gmail.com"
      password="password"
      User.create!(:name=>name,:email=>email,:password=>password,:password_confirmation=> password)
    end
  end
end
