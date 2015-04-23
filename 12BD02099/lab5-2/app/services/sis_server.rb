class SisServer

  def initialize(ch)
    @ch = ch
  end

  def start(queue_name)
    @q = @ch.queue(queue_name)
    @x = @ch.default_exchange

    @q.subscribe(:block => true) do |delivery_info, properties, payload|
      r = self.class.parse(payload)
      @x.publish(r.to_s, :routing_key => properties.reply_to, :correlation_id => properties.correlation_id)
    end
  end

  def self.parse(url)
    url1 = url.split("+")
    url = url1[1].to_s
    path = url1[0].to_s
    require 'rubygems'
    require 'nokogiri'
    require 'open-uri'
    require 'fileutils'

    @dir = "/home/akzhol/Repositories/lab5/lab5-1/app/assets/htmls/"

    response = ""
    begin
      @main = Nokogiri::HTML(open("http://"+url, :proxy => nil, :read_timeout=>10))
      url = url.gsub("/", "\\")
      File.write(@dir+path+"/"+url+".html".to_s, @main.to_html(encoding: 'UTF-8'))
      @links = @main.css("a")
      @links.each do |link|
        response += "+"+link['href']
      end
    rescue
      dosomething = 1
    end
      return response
  end
end
