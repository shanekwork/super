require 'csv'

desc "Imports a CSV file into an ActiveRecord table"

task :onlineassigntaxon, [:filename] => :environment do
		CSV.foreach('id_test.csv', :headers => true) do |row|
		Spree::Classification.create!(row.to_hash)
	end
end