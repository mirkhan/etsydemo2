class Listing < ActiveRecord::Base

	if Rails.env.development?
		has_attached_file :photo, styles: {medium: "200x>", thumb: "100x100>" }, default_url: "no_image.png"

	else

	 has_attached_file :photo, styles: {medium: "200x>", thumb: "100x100>" }, default_url: "no_image.png",
  #validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/,
  	 					:storage => :dropbox,
    					:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    					:path => ":style/:id_:filename"

    	end
      
end
