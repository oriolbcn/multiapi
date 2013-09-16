require 'spec_helper'

describe Multiapi::Youtube do

  it "Sould return Multiapi::Youtube object with correct attributes", :vcr do
    info = Multiapi::Youtube.get("http://www.youtube.com/watch?v=SyDGJ3L30hw")
    info.provider.should == "Youtube"  
    info.url.should == "http://www.youtube.com/watch?v=SyDGJ3L30hw"  
    info.video_id.should == "SyDGJ3L30hw"
    info.embed_url.should == "http://www.youtube.com/embed/SyDGJ3L30hw"
    info.raw_info.should_not be_nil
    info.title.should == "Shakira (2002) - Grandes Exitos - High Quality MP3 320Kbps" 
    info.description.should_not be_nil
    #info.keywords.should == ""
    info.duration.should == 3473
    info.date.should < Time.now
    info.thumbnail_small.should == "http://i1.ytimg.com/vi/SyDGJ3L30hw/default.jpg" 
    info.thumbnail_medium.should == "http://i1.ytimg.com/vi/SyDGJ3L30hw/mqdefault.jpg"
    info.thumbnail_large.should == "http://i1.ytimg.com/vi/SyDGJ3L30hw/hqdefault.jpg"
    info.view_count.should > 5228532
  end
  
  it "should return info for non WWW URL too", :vcr do
    info = Multiapi::Youtube.get("http://youtube.com/watch?v=SyDGJ3L30hw")
    info.title.should == "Shakira (2002) - Grandes Exitos - High Quality MP3 320Kbps"
  end
  
  it "should return info for non WWW URL too", :vcr do
    info = Multiapi::Youtube.get("http://youtube.com/watch?v=SyDGJ3L30hw")
    info.title.should == "Shakira (2002) - Grandes Exitos - High Quality MP3 320Kbps"
  end
  
  it "should return info for WWW and HTTPS URL too", :vcr do
    info = Multiapi::Youtube.get("https://www.youtube.com/watch?v=SyDGJ3L30hw")
    info.title.should == "Shakira (2002) - Grandes Exitos - High Quality MP3 320Kbps"
  end
  
  it "should return info without http or www URL too", :vcr do
    info = Multiapi::Youtube.get("youtube.com/watch?v=SyDGJ3L30hw")
    info.title.should == "Shakira (2002) - Grandes Exitos - High Quality MP3 320Kbps"
  end

end
