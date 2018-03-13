task 'db:migrate' => :environment do
  ENV['RAILS_ENV'] ||= "development"
  sh "ridgepole -E#{ENV['RAILS_ENV']} -c config/database.yml --apply"
  sh "ridgepole -E#{ENV['RAILS_ENV']} -c config/database.yml --export -o Schemafile"

  #sh "ridgepole -E#{ENV['RAILS_ENV']} -c config/database.yml --apply -f CarSchemafile"
  #sh "ridgepole -E#{ENV['RAILS_ENV']} -c config/database.yml --export -o CarSchemafile"
end

task 'db:dump' => :environment do
  ENV['RAILS_ENV'] ||= "development"
  sh "ridgepole -E#{ENV['RAILS_ENV']} -c config/database.yml --export -o Schemafile"
  #sh "ridgepole -E#{ENV['RAILS_ENV']} -c config/database.yml --export -o CarSchemafile"
end