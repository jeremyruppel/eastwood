# Eastwood

> Start your client side out right.

[![Build Status](https://secure.travis-ci.org/jeremyruppel/eastwood.png)](http://travis-ci.org/jeremyruppel/eastwood)
[![Dependency Status](https://gemnasium.com/jeremyruppel/eastwood.png)](https://gemnasium.com/jeremyruppel/eastwood)

## About

Eastwood brings your Rails routes to the client side in a slick, unobtrusive way.

As of v0.3.2, Eastwood supports Rails >= 3.1.0, which means both `ActionDispatch`
and `Journey` routers are supported.

## Usage

Include eastwood in your gemfile:

``` rb
gem 'eastwood'
```

Then mount the engine wherever you want:

``` rb
mount Eastwood::Engine => '/eastwood'
```

> The place you mount the engine actually doesn't make much of a difference right now.
> The engine itself has no routes, just a single javascript asset you can include
> through the pipeline.

Finally, require `eastwood.js` in your javascript manifest.

``` coffee
#= require eastwood
```

## Routes

Eastwood will give you a namespace for your application, as well as all of your named
route helpers converted to javascript functions. If your app is named **MyApp**, requiring
the Eastwood javascript will give you something like this available on `window`:

``` js
MyApp : {
  env : 'development',
  routes : {
    new_user_path : function( format ){
      // javascript to return you a string route, with segment keys
      // interpolated, and including either the format you specify
      // or the default 'json'.
    }
  }
}
```

> This namespace is also a great place to put the rest of your client-side code!

## Configuration

Create a `config/initializers/eastwood.rb` and you can do the following:

``` rb
Eastwood.configure do |config|
  config.default_route_format = :json         # pass false or '' to omit it entirely
  config.javascript_route_style = :underscore # or :camelcase
  config.javascript_namespace = 'MyApp'       # defaults to your app name
  config.excludes << /admin/                  # add patterns here to exclude routes from being exported
end
```

## Hashes

Eastwood can include arbitrary "routes" for the client-side too. In your configure block:

``` rb
Eastwood.configure do |config|
  config.hash :foo, '#/foo'
  config.hash :bar, '/bar/:id'
end
```

This will give you `foo_hash` and `bar_hash` as functions in `MyApp.routes`, with all segments
interpolated as you would expect.

## Exports

Eastwood can also export arbitrary values to the client side:

``` rb
Eastwood.configure do |config|
  config.export :foo => 'bar', :baz => 123.45
end
```

## Pro Tips

Eastwood plays *really* well with [Sammy.js](http://sammyjs.org/):

``` coffee
# include all of our eastwood routes as sammy helpers
@helpers MyApp.routes

# ...

# use our eastwood routes in the event context
@render @clients_path( 'wal' ), result, -> $( '#clients' ).html @content
```

It also plays well with backbone and friends with a little configuration:

``` coffee
# mix-in route helpers into backbone prototypes
_( Backbone.Model.prototype  ).extend MyApp.routes
_( Backbone.Router.prototype ).extend MyApp.routes
```

Eastwood even plays well with client-side templating solutions that treat
functions like first-class citizens like, *ahem*, [walrus](https://github.com/jeremyruppel/walrus):

``` html
<li>
  <a href="{{@clients_path( 'html' )}}">Clients</a>
</li>
```

## I18n (work in progress)

Eastwood will also be able to export your i18n to the client side. Simply:

``` coffee
#= require eastwood/i18n
```

And your translations will be attached to your namespace. Afterwards, use
`MyApp.t( 'key.to.translate' )` to look up translations. `t` accepts a hash
as a second parameter to use as the context for any interpolation the
translation string needs.

## Reloading

Since Sprockets [doesn't know when your context helpers change](https://github.com/sstephenson/sprockets/blob/master/lib/sprockets/base.rb#L35), you may
need to clear out your sprockets cache when you change your routes. Just run `rake tmp:clear`.

## License

Eastwood is released under the MIT license.
