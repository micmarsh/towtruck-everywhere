all: javascripts

javascripts: coffee/* clean
	coffee -cj javascripts/context/injectscripts.js coffee/injectscripts.coffee
	coffee -cj javascripts/context/initialize.js coffee/initialize.coffee
	coffee -cj javascripts/loader.js coffee/loader.coffee
	cat javascripts/loader.js javascripts/context/* > javascripts/context.js

	coffee -cj javascripts/page/runtowtruck.js coffee/runtowtruck.coffee
	cat javascripts/loader.js javascripts/page/runtowtruck.js > javascripts/page.js

clean:
	rm -r javascripts/*
