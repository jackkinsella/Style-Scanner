# internal dependencies

# external dependencies
require "log_buddy"

#external setups
LogBuddy.init({
  :logger   => File.open(File.dirname(__FILE__) + "/../log/development.log") 
})

Dir[File.dirname(__FILE__) + '/**/*.rb'].each do |file|
  require file
end

module Style

end
