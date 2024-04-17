# this using to simulate 200 status
while true
do
  sleep 1
  curl -I http://hello-app.com
done

# this using to simulate 503 status
while true
do
  sleep 1
  curl -I http://hello-app.com/do-not-exists
done