# https://stackoverflow.com/questions/11583562/how-to-kill-a-process-running-on-particular-port-in-linux

# technically it actually kills any process listening to port 8080:

kill $(lsof -t -i:8080)