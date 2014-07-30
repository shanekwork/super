require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :assigntaxonlocal, [:filename] => :environment do
		CSV.foreach('assigntaxonlocal.csv', :headers => true) do |row|
		Spree::Classification.create!(row.to_hash)
	end
end