class SessionController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def create
    user = User.from_omniauth(env["omniauth.auth"])
    if user.id.present?
      session[:user_id] = user.id
      render json: user
    else
      session[:user_id] = nil
      redirect_to '/'
    end
  end

  def auth
  	require 'google-id-token'
    token = request.headers["Authorization"]
    validator = GoogleIDToken::Validator.new
    token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjE2YmYyZTFmZjU0NjQ4YmI4YzU0YWEzN2ZiNDExYmVhYjQ5MDI2M2MifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWQiOiIxMDgxNDA2NjI3NzU2MDE3NTc0MTAiLCJzdWIiOiIxMDgxNDA2NjI3NzU2MDE3NTc0MTAiLCJhenAiOiI4MTQwMzU5OTU4OTAtY3IzcnZ2dGVxcG12cjFtMGxsbmxuZHRwaGI3YnRhM2guYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJlbWFpbCI6InJhamVlZm1rQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdWQiOiI4MTQwMzU5OTU4OTAtODQ4ZWl0NWljZTExbjVqamMwc3JxZzJwZXNmZnAyam8uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJ2ZXJpZmllZF9lbWFpbCI6dHJ1ZSwiY2lkIjoiODE0MDM1OTk1ODkwLWNyM3J2dnRlcXBtdnIxbTBsbG5sbmR0cGhiN2J0YTNoLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiaWF0IjoxNDEyMDY1NjE2LCJleHAiOjE0MTIwNjk1MTZ9.JILrCL__MH44cv5KX_UBOYKMfMDTlRVa92qYIOm0vQnxdZpvY0CaGJ5CZn-3AkBDZg8WWJf7V6PppOGX7qVZXNAJt7x_C6arusvmz1RkJ3rF5ueiVUykx5tu7jfR9pGZ3rkFIWvfJsCWq2qtECwPFbVni19bb6QGysbXVbYbjrc"
    #token = "ya29.kQAFAWDNDtUWokkLt0rWaA3Dx_bnu8ghZicucxaKYOHBE3Lb27qYeLpe"   accesstoken

    # response = HTTParty.get("https://accounts.google.com/o/oauth2/auth?
    #  scope=email%20profile&
    #  state=%2Fprofile&
    #  redirect_uri=htt&
    #  response_type=token&
    #  client_id=814035995890-848eit5ice11n5jjc0srqg2pesffp2jo.apps.googleusercontent.com")

    
    response_oauth_code = HTTParty.post()
    

		required_audience ="814035995890-848eit5ice11n5jjc0srqg2pesffp2jo.apps.googleusercontent.com"
		required_client_id ="814035995890-cr3rvvteqpmvr1m0llnlndtphb7bta3h.apps.googleusercontent.com"

		jwt = validator.check(token, required_audience, required_client_id)
		if jwt
		  email = jwt['email']
		else
		  puts "Cannot validate: #{validator.problem}"
		end






    # url = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=#{token}"
    #render json: jwt
    # puts url
    # puts token
    # response = HTTParty.get("https://www.googleapis.com/oauth2/v1/userinfo",query: {access_token: token})
    # puts response.body
    render json: jwt


    # require 'oauth2'

    # client = OAuth2::Client.new('814035995890-848eit5ice11n5jjc0srqg2pesffp2jo.apps.googleusercontent.com', 'mhac6RB65RwpBXotqrB1fSXg', :site => 'https://localhost')

    # client.auth_code.authorize_url(:redirect_uri => 'http://localhost:8080/oauth2/callback')
    # # => "https://example.org/oauth/authorization?response_type=code&client_id=client_id&redirect_uri=http://localhost:8080/oauth2/callback"

    # token = client.auth_code.get_token('authorization_code_value', :redirect_uri => 'http://localhost:8080/oauth2/callback', :headers => {'Authorization' => 'Basic some_password'})
    # response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })

  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end



