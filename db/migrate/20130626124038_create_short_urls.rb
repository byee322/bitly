class CreateShortUrls < ActiveRecord::Migration
	def change
		create_table :shortened_urls do |t|
			t.string :url
			t.string :short_url
		end
	end
end
