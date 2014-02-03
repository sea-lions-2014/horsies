module AuthenticationHelper
	def valid_signin(user, options={})
		visit '/'
		find("#login-name").set(user.name)
		find("#login-pass").set(user.password)
		click_button "Login"
	end
end