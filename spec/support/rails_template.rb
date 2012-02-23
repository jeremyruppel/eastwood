# Clean up the app a bit
run 'rm -r test'
run 'rm -r doc'
run 'rm -r README.rdoc'
run 'rm -r vendor'

# Add our eastwood dependency
gem 'eastwood'

# Mount the eastwood app
route "mount Eastwood::Engine => '/eastwood'"

# Create the eastwood initializer
# initializer 'eastwood.rb', <<-CODE
# # TODO write the initializer
# CODE
