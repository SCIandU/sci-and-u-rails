# encoding: UTF-8

title = "SCI and U Podcast: Self-Management after SCI"
author = "SCI and U"
description = "SCI and U is an online social media and resource centre created by Canadians with Spinal Cord Injury for Canadians with Spinal Cord Injury.  We discuss the ins and outs of life in the community with a Spinal Cord Injury and strategies for independent living."    
keywords = "Spinal Cord Injury, SCI, Health, Self-Management, Well-Being, Independent Living"

if params[:ipod]
  title += " (Mobile)"
  description += " This version is for mobile devices which cannot support the full resolution version."
  keywords += ', mobile'
  image = "my_image.jpg"
  ext = 'm4v'
else
  description += " This is the full resolution version, a lower reoslution for mobile devices is also available."
  image = "my_image.jpg"
  ext = 'mp4'
end

xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",  "xmlns:media" => "http://search.yahoo.com/mrss/",  :version => "2.0" do
  xml.channel do
    xml.title title
    xml.link 'http://sci-and-u.ca'
    xml.description description
    xml.language 'en'
    xml.pubDate @salon_events.first.event_date.to_s(:rfc822)
    xml.lastBuildDate @salon_events.first.event_date.to_s(:rfc822)
    xml.itunes :author, author
    xml.itunes :keywords, keywords
    xml.itunes :explicit, 'clean'
    xml.itunes :image, :href => image
    xml.itunes :owner do
      xml.itunes :name, author
      xml.itunes :email, 'SCIandU@utoronto.ca'
    end
    xml.itunes :block, 'no'
    xml.itunes :category, :text => 'Health' do
      xml.itunes :category, :text => 'Self-Management Support'
    end
    xml.itunes :category, :text => 'Spinal Cord Injury' do
      xml.itunes :category, :text => 'Well-Being'
    end

    @salon_events.each do |salon_event|
      if salon_event.event_date < Time.now
        xml.item do
          xml.title salon_event.title
          xml.description salon_event.description
          xml.pubDate salon_event.event_date.to_s(:rfc822)
          xml.enclosure :url => salon_event.podcast, :length => File.size("/Users/JaglalLab/Desktop/sci-and-u-rails/public/uploads/podcasts/#{File.basename(salon_event.podcast)}"), :type => 'video/mp4'
          xml.link salon_event_url(salon_event)
          xml.guid({:isPermaLink => "false"}, salon_event.podcast)
          xml.itunes :author, author
          xml.itunes :subtitle, truncate(salon_event.description, :length => 150)
          xml.itunes :summary, salon_event.description
          xml.itunes :explicit, 'no'
          #xml.itunes :duration, salon_event.duration
        end
      end
    end
  end
end
