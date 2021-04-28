Commands for Part-1:

Execute the commands in sequence to achieve the solution for part -1.

Run the container image infracloudio/csvserver:latest in background

	docker run -it -d infracloudio/csvserver:latest

As the inputFile is not present, the container fails to run. Create the inputFile using the below script

	gencsv.sh

	Script Usage: ./gencsv.sh

		This script accepts a Parameter that holds number of entries(records) required. If no Parameter is passed the default value will be 10.

Run the container in the background with volume mount to add the inputFile to the container.
	
	docker run -v ./inputFile:/csvserver/inputdata -d infracloudio/csvserver:latest

Execute the container.
	
	docker exec -it dda48f1cbdee bash

Run netstat to identify the port on which the application is listening.

	netstat -tnlp
Delete the container.

	docker rm -f dda48f1cbdee
Run the container to expose the container port 9300 to host on 9393 and set the environment variable.

	docker run -p 9393:9300 -e CSVSERVER_BORDER=Orange -v ./inputFile:/csvserver/inputdata -d infracloudio/csvserver:latest