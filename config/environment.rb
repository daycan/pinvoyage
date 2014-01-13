# Load the Rails application.
require File.expand_path('../application', __FILE__)

config.gem "rmagick",
:lib => "RMagick" 

# Initialize the Rails application.
Pinvoyage::Application.initialize!

