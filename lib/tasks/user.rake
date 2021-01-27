require 'csv'
namespace :user do
  desc "Import"
  task import: :environment do
    csv_file = File.read('users.csv')
    csv = CSV.parse(csv_file, headers: true)
    csv.each do |row|
      User.create!(row.to_hash)
    end
  end

  desc "Export"
  task export: :environment do
    users = User.order(:first_name)

    headers = %w[first_name, last_name, personal_data, password, email, birthday]

    CSV.open('exported_users.csv', 'w', write_headers: true, headers: headers) do |writer|
      users.each { |user| writer << [user.first_name, user.last_name, user.personal_data, user.password, user.email, user.birthday] }
    end
  end

end
