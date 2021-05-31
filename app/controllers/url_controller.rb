class UrlController < ApplicationController
	def index
	end
	def create
		@url = Url.new()
        @url.shorturl =@url.generate_short_url
        @url.url = params[:url]
        @url.save!
        render :template => "url/viewshorturl", data: @url
	end
	def shorturlclick
       @url = Url.find_by_shorturl(params[:id])
       if @url 
			todayDate = Date.parse(Time.now.strftime("%Y-%m-%d"))
			createdat = Date.parse(@url.created_at.strftime("%Y-%m-%d"))
			ip = ((request.remote_ip == "::1") ? "127.0.0.1" : request.remote_ip).to_s
			results = Geocoder.search(ip)
			country = ((results.include? 'country') ? results.country : "India").to_s
			if ((todayDate - createdat).to_i <= 30)
				ipaddr = ((@url.ipaddress==nil) ? ip : (@url.ipaddress+", "+ip))
				countries = ((@url.country==nil) ? country : (@url.country+", "+country))
				@url.update_attributes(:clicked => (@url.clicked + 1), :ipaddress => ipaddr, :country => countries)
				redirect_to @url.url
			else
				redirect_to controller:"url", action: "notfound"
			end
       else
           redirect_to  url_notfound_path
       end
	end
	def notfound
	end
	def stat
		@url = Url.all
	end
end
