class HomeController < ApplicationController

	def about
	end

    def client
    end

	def rpc
	end

    def sis
        val = params[:val]
        path = val
        require "bunny"
        require "thread"

        conn = Bunny.new(:automatically_recover => false)
        conn.start

        ch   = conn.create_channel

        @dir = "/home/akzhol/Repositories/lab5/lab5-1/app/assets/htmls/"

        if File.directory?(@dir+val)
          puts val
        end
        FileUtils.mkdir_p @dir+val
        @used = Hash.new
        @queue = Array.new
        @tmp = 0
        @queue.push(val)
        @used[val] = true
            while @tmp < @queue.length
                if @tmp > 100
                    break
                end
                puts @tmp
                val = @queue[@tmp]
                @tmp += 1
                client   = SisClient.new(ch, "rpc_queue")
                puts " [x] Requesting "+val.to_s+""
                response = client.call(path+"+"+val.to_s)
                puts " [.] Got #{response}"
                responses = response.split("+")
                responses.each do |response|
                    unless response.length == 0
                        unless response[0] == '/' || response[0] == '#'
                            response = '/'+response
                        end
                        if @used.has_key?(response)
                            next
                        end
                        if response[0..4] == "http"
                            @queue.push(response)
                        else
                            @queue.push(path+response)
                        end
                        @used[response] = true
                    end
                end

            end

        ch.close
        conn.close

        path = @dir+path
        gem 'rubyzip'
        require 'zip/zip'
        require 'zip/zipfilesystem'

        path.sub!(%r[/$],'')
          archive = File.join(path,File.basename(path))+'.zip'
          FileUtils.rm archive, :force=>true

          Zip::ZipFile.open(archive, 'w') do |zipfile|
            Dir["#{path}/**/**"].reject{|f|f==archive}.each do |file|
              zipfile.add(file.sub(path+'/',''),file)
            end
          end


        @s = {}
        @s[:status] = response
        render json: @s
    end

      def lab5
        type = params[:type]
        value = params[:value]
        value1 = params[:value1]
        if type == 'exponentiation'
          value = value.to_s+" "+value1.to_s
        end

        require "bunny"
        require "thread"

        conn = Bunny.new(:automatically_recover => false)
        conn.start

        ch   = conn.create_channel

        client   = CalculatorClient.new(ch, "rpc_queue")
        puts " [x] Requesting "+value+""
        response = client.call(type.to_s+"+"+value.to_s)
        puts " [.] Got #{response}"

        ch.close
        conn.close

        @s = {}
        @s[:status] = response
        render json: @s
      end

end
