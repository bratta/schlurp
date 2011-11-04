class HomeController < ApplicationController
  def profile
    twitter_handle = params['t']
    @twitter_profile = Twitter.find_by_screen_name(twitter_handle)
    @twitter_profile = fetch_profile(twitter_handle) unless @twitter_profile
    if @twitter_profile
      @twitpics = fetch_twitpics(twitter_handle)
      @yfrogs = fetch_yfrogs(twitter_handle)
      @social_images = [@twitpics, @yfrogs].flatten.shuffle
    end
  end

  private

  def fetch_profile(twitter_handle)
    url = "http://api.twitter.com/1/users/show.json?screen_name=#{twitter_handle}&include_entities=true"
    begin
      response = RestClient.get(url)
    rescue
      return nil
    end
    return nil unless response.code == 200
    parsed_response = JSON.parse(response.body)
    profile = Twitter.new
    profile.screen_name = twitter_handle
    %w( name profile_image_url profile_background_image_url url ).each do |field|
      profile.send "#{field}=", parsed_response[field]
    end
    profile.save
    profile
  end

  def fetch_twitpics(twitter_handle)
    url = "http://api.twitpic.com/2/users/show.json?username=#{twitter_handle}"
    begin
      response = RestClient.get(url)
    rescue
      return []
    end
    return [] unless response.code == 200
    parsed_response = JSON.parse(response.body)
    images = []
    parsed_response["images"].each do |image_obj|
      images << "<a href=\"http://twitpic.com/#{image_obj["short_id"]}\"><img src=\"http://twitpic.com/show/thumb/#{image_obj["short_id"]}\" /></a>"
    end
    images
  end

  def fetch_yfrogs(twitter_handle)
    url = "http://yfrog.com/api/userphotos.json?limit=25&screen_name=#{twitter_handle}&page=1&devkey=#{YFROG_API_KEY}"
    response = nil
    begin
      response = RestClient.get(url)
    rescue
      return []
    end
    return [] unless response.code == 200
    parsed_response = JSON.parse(response.body)
    logger.info(parsed_response)
    images = []
    if parsed_response["result"]
      parsed_response["result"]["photos"].each do |image_obj|
        images << "<a href=\"#{image_obj["photo_link"]}\"><img src=\"#{image_obj["photo_thumb"]}\" /></a>"
      end
    end
    images
  end
end
