Eastwood
========

> Start your client side out right.

About
-----

Eastwood brings your Rails routes to the client side in a slick, unobtrusive way.

As of v0.3.2, Eastwood supports Rails >= 3.1.0, which means both `ActionDispatch`
and `Journey` routers are supported.

Usage
-----

Include eastwood in your gemfile:

	gem 'eastwood'

Then mount the engine wherever you want:

	mount Eastwood::Engine => '/eastwood

> The place you mount the engine actually doesn't make much of a difference right now.
> The engine itself has no routes, just a single javascript asset you can include
> through the pipeline.

Finally, require `eastwood.js` in your javascript manifest.

	#= require eastwood

Routes
------

Eastwood will give you a namespace for your application, as well as all of your named
route helpers converted to javascript functions. If your app is named **MyApp**, requiring
the Eastwood javascript will give you something like this available on `window`:

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

Configuration
-------------

Create a `config/initializers/eastwood.rb` and you can do the following:

	Eastwood.configure do |config|
		config.default_route_format = :json # or :xml, 'html', etc to change it, or false or '' to leave it blank
	end

Hashes
------

Eastwood can include arbitrary "routes" for the client-side too. In your configure block:

	Eastwood.configure do |config|
		config.hash :foo, '#/foo'
		config.hash :bar, '/bar/:id'
	end

This will give you `foo_hash` and `bar_hash` as functions in `MyApp.routes`, with all segments
interpolated as you would expect.

Reloading
---------

Since Sprockets [doesn't know when your context helpers change](https://github.com/sstephenson/sprockets/blob/master/lib/sprockets/base.rb#L35), you may
need to clear out your sprockets cache when you change your routes. Just run `rake tmp:clear`.

License
-------

> Copyright 2012 Jeremy Ruppel
>
> Permission is hereby granted, free of charge, to any person obtaining
> a copy of this software and associated documentation files (the
> "Software"), to deal in the Software without restriction, including
> without limitation the rights to use, copy, modify, merge, publish,
> distribute, sublicense, and/or sell copies of the Software, and to
> permit persons to whom the Software is furnished to do so, subject to
> the following conditions:
>
> The above copyright notice and this permission notice shall be
> included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
