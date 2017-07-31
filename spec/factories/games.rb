FactoryGirl.define do
    factory :game do |f|
        f.name "Random"
        f.description "descrizione di un gioco random"
        f.genre "genere random"
        f.maker "random production"
        f.pegi '18'
        f.year '2000-01-01'
    end
end
