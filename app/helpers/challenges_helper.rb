module ChallengesHelper

  def evaluate(input)
  
  begin
    user_output = eval input[:attempt_text]
  rescue Exception => e
    user_output = e.message
  end
  
  user_output
 
 end
 
end
