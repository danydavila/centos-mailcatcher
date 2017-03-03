.PHONY: all

all:   build run stop

build:
	     docker build -t danydavila/mailcatcher .
run:
	     docker run -d --name mailcatcher -p 1025:1025 -p 1080:1080 danydavila/mailcatcher

stop:
	     docker stop mailcatcher

clean:
	     docker rm mailcatcher
	     docker rmi -f danydavila/mailcatcher