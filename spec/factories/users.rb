FactoryGirl.define do
    factory :user do |f|
        f.provider "facebook"
        f.uid '12345'
        f.name "Piermenti Sfracellozzi"
        f.role "Admin"
        f.email "piermenti@sfracellozzi.com"
        f.password 'some sort of password'
    end
end
