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

  factory :challenge_with_invalid_intial_data, class: Challenge do
    name "Select"
    problem_statement "Do ruby"
    initial_data "asd"
    expected_output "[2,3,4]"
  end


  factory :challenge_with_invalid_expected_output, class: Challenge do
    name "Select"
    problem_statement "Do ruby"
    initial_data "[1,2,3]"
    expected_output "asd"
  end

end

