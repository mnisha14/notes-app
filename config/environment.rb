# Load the rails application
require File.expand_path('../application', __FILE__)
#require File.expand_path('../initializers/abtract_mysql2_adapter', __FILE__)
require File.expand_path('../initializers/abstract_mysql2_adapter', __FILE__)



# Initialize the rails application
NotesApp::Application.initialize!
