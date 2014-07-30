require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :assigntaxon, [:filename] => :environment do
		CSV.foreach('assigntaxon.csv', :headers => true) do |row|
		Spree::Classification.create!(row.to_hash)
	end
end