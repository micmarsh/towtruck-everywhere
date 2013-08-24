all: javascripts

javascripts: coffee/*
	coffee -cj javascripts/page/injectscripts.js coffee/injectscripts.coffee
	coffee -cj javascripts/page/initialize.js coffee/initialize.coffee
	coffee -cj javascripts/loader.js coffee/loader.coffee
	cat javascripts/loader.js javascripts/page/* > javascripts/page.js

clean:
	rm javascripts/*
