FactoryGirl.define do
  factory :map_challenge, class: Challenge do
    name "Map"
    problem_statement "Do ruby"
    initial_data "[1,2,3]"
    expected_output "[2,3,4]"
  end

  factory :select_challenge, class: Challenge do
    name "Select"
    problem_statement "Do ruby"
    initial_data "[1,2,3]"
    expected_output "[2,3,4]"
  end
end

