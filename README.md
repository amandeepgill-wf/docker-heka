## A Heka docker container

### System Requirements:
 - [Docker](http://www.docker.com/)
 - [cmake](http://www.cmake.org/cmake/resources/software.html)

### Before starting:


Modify the Makefile to replace the existing tag 'your-docker-hub-of-choice/your-username/heka:latest' with a tag of your choosing.  If not planning to commit the built container to a hub, you can replace the entire tag with something simple like 'heka'.  Otherwise, replace 'your-docker-hub-of-choice' and 'your-username'.

### Use:
###### TO BUILD THE CONTAINER:
`make build`

###### TO RUN THE BUILT CONTAINER:
`make run`

###### TO RUN THE BUILT CONTAINER WITH DEBUG MESSAGES:
`make debug`

###### TO CLEAN UP EXITED CONTAINERS:
`make clean`
