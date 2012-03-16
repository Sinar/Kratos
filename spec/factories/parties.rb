FactoryGirl.define do

  factory :party do

    sequence(:code) { |n| "CP#{n}" }
    sequence(:name) { |n| "Capitalist Pigs #{n}" }
    sequence(:name_in_malay) { |n| "Babi-babi Kapitalis #{n}" }
    founded_in 2012

    factory :party_with_coalition do

      after_create do |party|
        coalition = FactoryGirl.create(:coalition)
        FactoryGirl.create(:coalitionship, { coalition: coalition, party: party, joined_at: 1.week.ago.year })
      end

    end

  end
end
