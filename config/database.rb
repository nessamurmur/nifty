Sequel::Model.plugin(:schema)
Sequel::Model.raise_on_save_failure = false # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("jdbc:postgresql://localhost/nifty_development?user=niftyn8&password=pancakes", :loggers => [logger])
  when :production  then Sequel.connect("jdbc:postgresql://localhost/nifty_production",  :loggers => [logger])
  when :test        then Sequel.connect("jdbc:postgresql://localhost/nifty_test",        :loggers => [logger])
end
