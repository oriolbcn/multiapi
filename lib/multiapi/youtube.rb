require "addressable/uri"
require 'open-uri'
require 'multi_json'

module Multiapi
  module Youtube 
    class << self   
      
      attr_accessor :provider, :url, :embed_url, :raw_info, :title, :description, :keywords, :duration,
                    :date, :thumbnail_small, :thumbnail_medium, :thumbnail_large, :view_count, :video_id
        
      def get(url, options = {})
        @options = options
        @url = url        
        video_info = read_api_url(url)
        attributes_from_response(video_info, @url, @video_id)        
      end
          
      private
      
      def attributes_from_response(video_info, url, video_id)
        self.provider = "Youtube"
        self.url = url
        self.video_id = video_id
        self.embed_url = "http://www.youtube.com/embed/#{video_id}"        
        self.raw_info = video_info
        
        video_info['entry'].tap do |entry|
          self.title            = entry['title']['$t']
          self.description      = entry['media$group']['media$description']['$t']
          self.keywords         = entry['media$group']['media$keywords']['$t']
          self.duration         = entry['media$group']['yt$duration']['seconds'].to_i
          self.date             = Time.parse(entry['published']['$t'], Time.now.utc)
          self.thumbnail_small  = entry['media$group']['media$thumbnail'][0]['url']
          self.thumbnail_medium = entry['media$group']['media$thumbnail'][1]['url']
          self.thumbnail_large  = entry['media$group']['media$thumbnail'][2]['url']
          self.view_count = entry['yt$statistics'] ? entry['yt$statistics']['viewCount'].to_i : 0
        end
        
        return self        
      end
      
      def read_api_url(url)        
        @video_id = get_video_id(url)
        uri   = api_url(@video_id)
        response = MultiJson.load(URI.parse(uri).read)              
      end
      
      def get_video_id(url)
        url = url.sub(/^https?\:\/\//, '').sub(/^www./,'')
        url.gsub(url_regex) { video_id = $1 || $2 || $3 }
      end
  
      def api_url(video_id)
        "http://gdata.youtube.com/feeds/api/videos/#{video_id}?v=2&alt=json"
      end
    
      def url_regex
        /(?:youtube(?:-nocookie)?\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/i
      end    
      
    end
  end 
end