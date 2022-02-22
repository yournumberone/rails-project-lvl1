install: #installing/updating dependencies
	bundle install

lint:
	rubocop

test:
	rake test



.PHONY: test