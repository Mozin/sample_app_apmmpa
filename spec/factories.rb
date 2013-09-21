FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "person#{n}" }
    sequence(:email) {|n| "person#{n}@gmail.com" }
    password "mohsin"
    password_confirmation "mohsin"
    factory :admin do
      admin true
    end
  end
end

