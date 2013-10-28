map = Challenge.create(name: "Map", problem_statement: "Return a new array
  in which each element in the new array is one greater than it was in the initial array.", expected_output: "[2, 3, 4, 5]", initial_data: "nums = [1,2,3,4]")

select = Challenge.create(name: "Select", problem_statement: "Give me all of 
  the elements from the given array that are bigger than 13", 
  expected_output: "[14, 235, 325, 325, 643, 53, 62, 634, 23, 32] ", initial_data: "nums = [14,235,325,1,325,643,1,53,1,62,1,6,634,23,32]")

max = Challenge.create(name: "Max", problem_statement: "Give me the
  biggest element in the given array", 
  expected_output: "643 ", initial_data: "nums = [14,235,325,1,325,643,1,53,1,62,1,6,634,23,32]")


map.doc = Doc.create(method: "map")
select.doc = Doc.create(method:"select")
max.doc = Doc.create(method:"max")
