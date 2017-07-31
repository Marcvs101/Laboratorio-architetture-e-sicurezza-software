FactoryGirl.define do
    factory :game do |f|
        f.name "Cod"
        f.description "boh non lo so"
        f.genre "boh"
        f.maker "boh"
        f.pegi '18'
        f.year nil
    end
  
    factory :invalid_game, parent: :game do |f|
        f.name nil
    end
end
