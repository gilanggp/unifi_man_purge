from fabric2 import Connection
from invoke import Responder

client = Connection(
		host = "10.0.51.8",
		user = "ubnt",
		connect_kwargs={
			"password": "peRkasa$%",
		},
)

trans = client.put('manPurge.sh', remote='/bin')

print ("Uploaded {0.local} to {0.remote}".format(trans))

command = "ls /bin"

#result = client.run(command, pty=True, watchers=[sudoers,yp])

result = client.run(command, pty=True)

print ("Ran {0.command!r} on {0.connection.host}, got stdout:\n{0.stdout}".format(result)) 

client.close()