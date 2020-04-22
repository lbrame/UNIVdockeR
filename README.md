## UNIVdockeR: A plug-and-play Docker image for univr's Computer Science program

This Dockerfile builds a Docker image containing a ready-made environment with all the right tools necessary to get through the first year of Computer Science at the University of Verona. This image is handy since it's built on top of the same operating system that is present in the uni's labs, Ubuntu 18.04 at the moment, thus making it easy to test on an identical setup even if the host system is a different Linux distro or OS and minimize nasty surprises. It's also the most hassle-free way to run `sis` on a different operating system from Ubuntu 18.04, since `sis` is known to work erratically on newer Linux distros and other operating systems. It's much more lightweight on resources than a virtual machine and it's easier to mount host directories and external disks on it.

This image supports every desktop OS that either Docker or Podman runs on - Windows, macOS and any Linux distribution.

### Installing

First, you need to install Docker for your respective operating system for this to work. If you're on Linux, there are extra setup steps to do to get Docker to work properly after installing Docker using your distro's package manager.

```bash
systemctl enable docker --now
sudo usermod -aG docker user    # replace user with your username
reboot  # logging out and back in is fine, too.
```

Once Docker is up and running:

```bash
git clone https://github.com/lbrame/UNIVdockeR
cd UNIVdockeR
docker build . t univr_year_1
```

If this has worked correctly, the output of `docker images` should show an image tagged `univr_year_1`.

### Using

This is a Docker image that can be used as a blueprint to run Docker containers on top of it. Docker containers are meant to be immutable, so it's recommended to save the actual work on the host system. These instructions will create a new empty folder and start a container based on this image for simplicity, but you can mount any host directory using the flag `--volume /path/to/host/directory/:/mount/point/on/guest`.

```bash
mkdir univr
docker run -it --rm --volume /home/user/univr/:/data univr_year_1
```

Your mounted folder will be available in the container's `/data` directory, so you can just `cd` there and start working. Run this command any want you want to work in this environment.