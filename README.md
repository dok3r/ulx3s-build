# dok3r/ulx3s-build
Dockerized build env for ulx3s

# Examples

Run docker:

```
docker run -it dok3r/ulx3s-build
```

# Usage

Simple example (if your license is in /host/fpga dir):
```
docker run -it -v /host/fpga:/fpga -e LM_LICENSE_FILE=/fpga/license.dat dok3r/ulx3s-build
```

Command line usage:
```
export ETHMAC=your-mac-from-license
docker run -it -e LM_LICENSE_FILE=/fpga/license.dat --mac-address=$ETHMAC --privileged --ipc host -v /host/fpga:/fpga  -v /dev/bus/usb/:/dev/bus/usb/ dok3r/ulx3s-build:latest
```

Support for GUI:
```
export ETHMAC=your-mac-from-license
export XSOCK=/tmp/.X11-unix
export XAUTH=/tmp/.docker.xauth
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run -it -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH -e LM_LICENSE_FILE=/fpga/license.dat --mac-address=$ETHMAC --privileged --ipc host -v /host/fpga:/fpga  -v /dev/bus/usb/:/dev/bus/usb/ dok3r/ulx3s-build:latest
```


