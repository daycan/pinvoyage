# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Pinvoyage::Application.initialize!

config.gem "rmagick",
:lib => "RMagick" 
