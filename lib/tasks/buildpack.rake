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
	
	p_releases["releases"].each do |item|
	
	RR = Release.new	
	RR.r_id = item["id"]
	RR.version = item["version"]
	RR.release_type = item["release_type"]
	RR.release_date = item["release_date"]
	RR.release_notes_url = item["release_notes_url"]
	RR.availability = item["availability"]
	RR.eula_id = item["eula"]["id"]
	RR.eula_slug = item["eula"]["slug"]
	RR.eula_name = item["eula"]["name"]
	RR.eula_links_self = item["eula"]["_links"]["self"]["href"]
	RR.eccn = item["eccn"]
	RR.license_exception = item["license_exception"]
	RR.updated_at = item["updated_at"]
	RR.software_files_updated_at = item["software_files_updated_at"]
	RR.links_self = item["_links"]["self"]["href"]
	RR.links_eula_acceptance = item["_links"]["eula_acceptance"]["href"]
	RR.links_product_files = item["_links"]["product_files"]["href"]
	RR.links_file_groups = item["_links"]["file_groups"]["href"]
	RR.links_user_groups = item["_links"]["user_groups"]["href"]
 	RR.save
 	end
 end

end
