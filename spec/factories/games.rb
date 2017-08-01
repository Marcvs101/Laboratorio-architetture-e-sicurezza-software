FactoryGirl.define do
    factory :game do |f|
        f.name "Random"
        f.description "Descrizione di un gioco random"
        f.genre "Genere random"
        f.maker "Random production"
        f.pegi '18'
        f.year '2000-01-01'
    end
end
