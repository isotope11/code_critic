GithubConcern::Engine.config do |gc|
  gc.user_lambda = lambda{|email| nil }
  gc.user_class = User
  gc.token = "a_token"
end
