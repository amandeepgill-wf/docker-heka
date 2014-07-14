### Replace 'your-docker-hub-of-choice' and 'your-username' everywhere.  This
### tag format is chosen so that the docker commit command will work, but if not
### committing, 'your-docker-hub-of-choice/your-username/heka:latest' can all be
### replaced with something simple like 'heka'.


build:
	docker build -t your-docker-hub-of-choice/your-username/heka:latest .

run:
	docker run -p 8128:8128/udp your-docker-hub-of-choice/your-username/heka:latest

debug:
	docker run -i -p 8128:8128/udp your-docker-hub-of-choice/your-username/heka:latest

commit:
	docker push your-docker-hub-of-choice/your-username/heka:latest

clean:
	docker ps -a | grep 'Exited' | awk '{ print $$1 }' | xargs docker rm
