# Grapics

- Change system from starting gui on boot 

```bash
sudo systemctl set-default multi-user.target
```

to revert

```bash
sudo systemctl set-default graphical.target
```


#
#
# Containerization

## Podman.

- List running containers

```bash
podman ps
```

- Inspect a container

```bash
podman inspect <id | name>
```

- Stop a running container

```bash
podman stop <id | name>
```

- Viewing logs

```bash
postman logs <container_id>
```

- Viewing the container's pids

```bash
postman top <container_id>
```

### Creating a container to run qwen AI model.

- Create a volume to save models incase of backup

```bash
podman volume create ollama-models
```

- List all volumes

```bash
podman volume ls
```

- Inspect a volumne

```bash
podman volume inspect ollama-models
```

- Delete a volume

```bash
podman volume rm ollama-models
```

- Create and Run the container

```bash
podman run -d --name ollama \
  -v ollama-models:/root/.ollama \
  -p 11434:11434 \
  docker.io/ollama/ollama:latest
```

__*-p*__   Is the portmapping in the format hostPort:containerPort
where cointainer post is always 11434 (matching the port in
the config). <br>
__*-d*__ Detaches the container from the terminal, thus allowing
it to run in background.
__*docker.io/ollama/ollama:latest*__ is the blue print podman
uses to create the container.

- Enter an already running container to perform a task

```bash
podman exec -it ollama ollama run qwen2.5:3b
```

__*-i*__ Interactive. <br>
__*-t*__ TTY. <br>
__*ollama run deepseek-v2*__ The command you want to run. <br>

- Drop into a container shell

```bash
podman exec -it ollama /bin/bash
```

- to connect to a running model

```bash
podman exec -it ollama ollama run qwen2.5-coder:3b
```

- How to stop a running model

```bash
podman exec -it ollama ollama stop qwen2.5:3b
```

- How to start an existing container

```bash
podman start <container_name_or_id>
podman start -ai <container_name_or_id>
```
 
#
#
# Battery

```bash
upower -e | grep 'BAT'
```

```bash
upower -i /org/freedesktop/UPower/devices/battery_BAT0
```

or a one line
```bash
upower -i $(upower -e | grep BAT) | grep percentage
```

#
#
# REDUCE KEYBOARD BRIGHTNESS FROM TERMINAL.

```bash
ls /sys/class/leds
```

```bash
echo 1 | sudo tee /sys/class/leds/dell\:\:kbd_backlight/brightness
```

