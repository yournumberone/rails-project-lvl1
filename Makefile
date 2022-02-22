#installing/updating dependencies
install:
	bundle install

lint:
	rubocop

test:
	rake test



.PHONY: test