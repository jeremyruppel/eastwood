# Clean up the app a bit
run 'rm -r test'
run 'rm -r doc'
run 'rm -r README.rdoc'
run 'rm -r vendor'

# Add our eastwood dependency
gem 'eastwood'

# Mount the eastwood app
route "mount Eastwood::Engine => '/eastwood'"

# Create a couple of test routes
route "match '/foo'        => 'bar#baz', :as => 'match'"
route "match '/foo/:id'    => 'bar#baz', :as => 'match_with_segment'"

# Create the eastwood initializer
initializer 'eastwood.rb', <<-CODE
Eastwood.configure do |config|
  config.hash :home, '#/home'
  config.hash :user, '#/users/:id'
  config.hash :post, '#/users/:id/posts/:slug'

  config.export :string  => 'foo',
                :float   => 123.45,
                :boolean => true
end
CODE
