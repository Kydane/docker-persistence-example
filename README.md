This repository is to show a quick example of two ways to mount persisted storage inside of docker. Education purposes only.

## Option 1 - Mounting storage from the local machine
In option 1, there is a single script, `file_mount_commands.sh`. This shell script is a simple command that starts a mysql container with its data persisted in 
a directory called `persisted_data`. 

The benefits of this approach is that the data is right on the file system and its relatively easy to set up. One gotcha of this approach is that file permissions
tend to get weird since the container can use any user / group ID they want. You'll need to root to manage those files.

Feel free to run this linux shell script in a linux vm to see how it works. 
You'll notice `persisted_data` gets created and its filled with mysql database files.

You can cleanup this container by running `cleanup.sh` in option1

## Option 2 - Using a docker volume
If you don't want to use the filesystem, docker itself has the concept of a "named" volume.
When you run `named-volume.sh`, I am creating a volume and using that volume to save my data.

All the named data volumes are accessible by the `docker volume ps` command and you'll notice it is 
NOT saved directly on the local filesystem where you mounted it but instead its managed by docker itself somewhere in the bowels of the docker daemon.
This volume will stay regardless of how many times you bring up and down the container, until you delete it with `docker volume rm "VOLUME_NAME"`

You can clean up this container and volume by running `cleanup.sh` in option2