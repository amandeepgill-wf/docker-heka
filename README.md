## A Heka docker container

### System Requirements:
 - [Docker](http://www.docker.com/)
 - [cmake](http://www.cmake.org/cmake/resources/software.html)

### Before starting:


Modify the Makefile, or copy the Makefile to Makefile\_local and modify that one (if you want to hide sensitive make commands from version control).  Replace the existing tag **'your-docker-hub-of-choice/your-username/heka:latest'** with tag of your choosing.  If not planning to commit the built container to a hub, you can replace the entire tag with something simple like **'heka'**.

### Heka Instance Use:
Send UDP communications to this instance on port 8128.
