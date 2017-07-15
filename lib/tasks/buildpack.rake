namespace :builpack do
  desc "pull releases from pivotal site"
  task pull_releases: :environment do
  	require "rest-client"
	
	#--------------- Pivotal api end point for downloading products
	pivotal_api_url_products = 'https://network.pivotal.io/api/v2/products'
	
	p_get_products = RestClient.get "#{pivotal_api_url_products}", {:Authorization => 'Token $pivotal_token', :accept => 'json', :content_type => 'json'}

	p_product_list = JSON.parse(p_get_products.body)

	#-------------- Product id for buildpack is 69
	p_buildpack = p_product_list["products"].select{ |a| a["id"] == "69".to_i }
	p_url_releases = p_buildpack[0]["_links"]["releases"]["href"]

	p_get_releases = RestClient.get "#{p_url_releases}", {:Authorization => 'Token $pivotal_token', :accept => 'json', :content_type => 'json'}
	p_releases = JSON.parse(p_get_releases.body)	
 	puts p_releases
 end

end
