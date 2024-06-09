from fabric2 import Connection
from invoke import Responder

client = Connection(
		host = "",					#input ur remote host addsress or domain
		user = "",					#input ur remote host user
		connect_kwargs={				#helper to input password
			"password": "",				#input ur password
		},
)

trans = client.put('manPurge.sh', remote='/bin')		#copy or send the bash script to /bin directory

print ("Uploaded {0.local} to {0.remote}".format(trans))

command = "sh /bin/manPurge.sh"					#running the bash script in remote host

result = client.run(command, pty=True, watchers=[sudoers,yp])	#incase u need sudo level

#result = client.run(command, pty=True)

print ("Ran {0.command!r} on {0.connection.host}, got stdout:\n{0.stdout}".format(result)) 

client.close()
