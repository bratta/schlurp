class HomeController < ApplicationController
  def profile
    twitter_handle = params['t']
    @twitter_profile = Twitter.find_by_screen_name(twitter_handle)
    @twitter_profile = fetch_profile(twitter_handle) unless @twitter_profile
  end

  private

  def fetch_profile(twitter_handle)
    url = "http://api.twitter.com/1/users/show.json?screen_name=#{twitter_handle}&include_entities=true"
    response = RestClient.get(url)
    parsed_response = JSON.parse(response.body)
    profile = Twitter.new
    profile.screen_name = twitter_handle
    profile.name = parsed_response["name"]
    profile.profile_image_url = parsed_response["profile_image_url"]
    profile.profile_background_image_url = parsed_response["profile_background_image_url"]
    profile.save
    profile
  end
end
