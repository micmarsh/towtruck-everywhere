all: javascripts

javascripts: coffee/*
	coffee -cj javascripts/injectscripts.js coffee/injectscripts.coffee
	coffee -cj javascripts/people.js coffee/people.coffee

