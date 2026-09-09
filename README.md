# Adventures in Omarchy
My journey of transforming a vanilla Omarchy installation into a high-performance development powerhouse—or at the very least, a survival guide for the setup process.


## omarchy is your friend

This command `omarchy` can run a multitude of [Omarchy](https://omarchy.org/) specific functions `omarchy update` omarchy `omarchy capture --full-screen` have a look at it and remember `--help` is also your friend.

``` bash
omarchy --help
omarchy update --help
omarchy wifi --help
omarchy capture --help
```


### First Things First, Battery Settings

- Set battery state to *power-saver* with `omarchy powerprofiles set battery power-saver`.
- Set ac power state to *performance* with `omarchy powerprofiles set ac performance`


## Arch and the dreaded ARU (Arch User Repository)

> [!NOTE]
> Omarchy makes it easy to access the Arch User Repository. That doesn't mean you should access it. It assumes you know what you are doing or you would not be running Omarchy in the first place. Do not freely install packages from AUR. Always use packages from:
> [SUPER] + [SPACE] >> Install >> Package
> Use AUR as a last resort only.

This repository is for cutting edge one off software packages. This repository is the Wild West, you don't install from this repository unless you need to. There have been multiple cases of malware being published to this repository. Use at your own risk. To see all the packages installed from AUR run the command `pacman -Qm`. Always make sure the build URL, build script, and dependencies are not pulling in unwanted software. To get basic package information run `yay -Qi1 [PACKAGE NAME]`


## No won can speel all of times

Add the missing spelling dictionaries.

[SUPER] + [SPACE] >> Install >> Package

Search for and add [TAB]:
- Tools:
  - hunspell
  - hyphen-en
- Dictionaries:
  - Australia: hunspell-en_au
  - Canada: hunspell-en_ca
  - United States: hunspell-en_us
  - Great Britain: hunspell-en_gb 


## Install [VictorMono](https://rubjo.github.io/victor-mono/) Nerd Font

[SUPER] + [SPACE] >> Install >> Style >> Font

> Search for `VictorMono Nerd Font`


## [Starship](https://starship.rs/) controls your shell prompt

Use `starship` to configure your prompt. Look at `${HOME}/.config/starship.toml`. Here is an example:

``` ${HOME}/.config/starship.toml
# ~/.config/starship.toml
# Erstwhile : https://github.com/TheErstwhile/adventures-in-omarchy/
# ####

add_newline = true
command_timeout = 200


# ─────────────────────────────────────────────────────────────
# Prompt
# ─────────────────────────────────────────────────────────────
format = """
[╭─«](bold)  [${custom.docker_project}](none)[$directory](none)[$git_branch$git_status](none)[$python](none)[$nodejs](none)[$dotnet](none) $fill $cmd_duration $battery
[╰─▶](bold)  [$character]($style) """


# ─────────────────────────────────────────────────────────────
# Command result
# ─────────────────────────────────────────────────────────────
[character]
error_symbol = "[⚠](bold red)"
success_symbol = "[✓](bold green)"


# ─────────────────────────────────────────────────────────────
# Detect Docker Project
# ─────────────────────────────────────────────────────────────
[custom.docker_project]
#command = "printf ' '"
# when = "test -f compose.yaml || test -f docker-compose.yml || test -f Dockerfile"
# format = "[$output]($style)  "
detect_files = ["compose.yaml", "docker-compose.yml", "Dockerfile", "Containerfile"]
detect_folders = [".devcontainer"]
format = "[]($style)  "
style = "blue"


# ─────────────────────────────────────────────────────────────
# Current Working Directory
# ─────────────────────────────────────────────────────────────
[directory]
truncation_length = 4
truncation_symbol = "…/"
repo_root_style = "italic"
repo_root_format = "[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) "


# ─────────────────────────────────────────────────────────────
# Git branch information
# ─────────────────────────────────────────────────────────────
[git_branch]
format = "[ $branch]($style) "
style = "italic cyan"


# ─────────────────────────────────────────────────────────────
# Git status information
# ─────────────────────────────────────────────────────────────
[git_status]
format = "[$all_status]($style) "
style = "cyan"

ahead      = "⇡${count} "
diverged   = "⇕⇡${ahead_count}⇣${behind_count} "
behind     = "⇣${count} "

conflicted = " "
up_to_date = "✓ "
untracked  = "? "
modified   = " "
stashed    = "≡ "
staged     = "+ "
renamed    = "⇄ "
deleted    = "− "


# ─────────────────────────────────────────────────────────────
# Python environment
# ─────────────────────────────────────────────────────────────
[python]
format = "[ $version · $virtualenv]($style) "
style = "dimmed green"
version_format = "${major}.${minor}"


# ─────────────────────────────────────────────────────────────
# Node.js environment
# ─────────────────────────────────────────────────────────────
[nodejs]
format = "[Node · $version]($style) "
style = "dimmed blue"
version_format = "${major}"


# ─────────────────────────────────────────────────────────────
# .NET environment
# ─────────────────────────────────────────────────────────────
[dotnet]
format = "[ · $version]($style) "
style = "dimmed blue"
version_format = "${major}"


# ─────────────────────────────────────────────────────────────
# Command duration
# ─────────────────────────────────────────────────────────────
[cmd_duration]
# Minimum Time in Milliseconds
# 1_000 = 1 second
min_time = 1_000
format = "[◷ $duration]($style) "
style = "dimmed"


# ─────────────────────────────────────────────────────────────
# Battery
# ─────────────────────────────────────────────────────────────
[battery]
format = "[$symbol$percentage]($style) "

full_symbol = " "
charging_symbol = "⚡ "
discharging_symbol = " "
unknown_symbol = " "


# 0–25%: critical only when discharging
[[battery.display]]
threshold = 25
charging_symbol = "⚡ "
discharging_symbol = "⚠  "
style = "bold inverted red"


# 26–50%: information, but subdued
[[battery.display]]
threshold = 50
charging_symbol = "⚡ "
discharging_symbol = " "
style = "dimmed"


# 51–75%: information, but subdued
[[battery.display]]
threshold = 75
charging_symbol = "⚡ "
discharging_symbol = " "
style = "dimmed"


# 76–100%: healthy, unobtrusive
[[battery.display]]
threshold = 100
charging_symbol = "⚡ "
discharging_symbol = " "
style = "dimmed"
```


## Lose foot (the wayland terminal emulator) for [ghostty](https://ghostty.org/)

[SUPER] + [SPACE] >> Install >> Terminal

Search for
- ghostty

[SUPER] + [SPACE] >> Setup >> Defaults >> Terminal 

Search for
- ghostty

[SUPER] + [SPACE] >> Remove >> Terminal

Search for
- foot

Create a [ghostty](https://ghostty.org/) configuration. Don't like VictorMono fonts? Run `ghostty +list-fonts` to see what you have available.

``` ${HOME}/.config/ghostty/config 
# Dynamic theme colors
config-file = ?"~/.local/state/omarchy/current/theme/ghostty.conf"

# Font
font-family = "VictorMono Nerd Font Mono"
font-style = Regular
font-size = 14

# Window
window-theme = ghostty
window-padding-x = 14
window-padding-y = 14
confirm-close-surface=true
resize-overlay = never
gtk-toolbar-style = flat

# Cursor styling
cursor-style = "block"
cursor-style-blink = true

# Cursor styling + SSH session terminfo
# (all shell integration options must be passed together)
shell-integration-features = no-cursor,ssh-env

# Keyboard bindings
keybind = shift+insert=paste_from_clipboard
keybind = control+insert=copy_to_clipboard
# Send Shift+Enter as CSI-u so TUIs can distinguish it from Enter.
keybind = shift+enter=csi:13;2u
# Legacy encoding sends Alt+Shift+Enter the same as Alt+Enter; send CSI-u so tmux can match M-S-Enter.
keybind = alt+shift+enter=csi:13;4u
keybind = super+control+shift+alt+arrow_down=resize_split:down,100
keybind = super+control+shift+alt+arrow_up=resize_split:up,100
keybind = super+control+shift+alt+arrow_left=resize_split:left,100
keybind = super+control+shift+alt+arrow_right=resize_split:right,100

# Slowdown mouse scrolling
mouse-scroll-multiplier = 0.95

# Fix general slowness on hyprland (https://github.com/ghostty-org/ghostty/discussions/3224)
async-backend = epoll
```


## Install [flatpak](https://flathub.org/)

[SUPER] + [SPACE] >> Install >> Package

Search for:
- flatpak

Add the proper `XDGDATADIRS` path updates so that [flatpak](https://flathub.org/) installs auto populate in the application launcher.

``` bash
echo 'export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:${HOME}/.local/share/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}' > ${HOME}/.config/environment.d/flatpak.conf
```

Download [flatpak](https://flathub.org/) refrence files from the [flatpak](https://flathub.org/) hub and install them like this: 

`flatpak install Downloads\com.provider.www.flatpakref`


## Install [KDE Connect](https://kdeconnect.kde.org/)

[SUPER] + [SPACE] >> Install >> Package

Search for
- kdeconnect

You will need a `ufw` rule to allow TCP traffic to port range `1714:1746`. These are the standard communication ports used by [KDE Connect](https://kdeconnect.kde.org/).

Example firewall rules needed for kdeconnect to work. `from` is the IP of your other device running kdeconnect. `to` is the IP of this device running kdeconnect. This example uses a random private network with a wired Ethernet (en) controller on PCI bus location 3 (p3) slot 0 (s0) making `enp3s0` and a wireless network interface (wl) onboard device index 1 (o1) making `wlo1`. It also assumes the Ethernet and WIFI NICs have seperate static IPs.

``` bash
sudo ufw allow from 192.168.2.12 to 192.168.1.20 port 1714:1764 proto tcp comment "kdeconnect-tcp on LAN (dev enp3s0)"
sudo ufw allow from 192.168.2.12 to 192.168.1.21 port 1714:1764 proto tcp comment "kdeconnect-tcp on WIFI (dev wlo1)"
```


## Replace SUPER + SHIFT + S (Google Maps <=> ScreenCapture)

I have no need of a Google Maps web App shortcut. This key combination is better served as the default screen capture function like all other operating systems.

``` bash
echo -e '\n-- No need for Google Maps\nhl.unbind("SUPER + SHIFT + S")\no.bind("SUPER + SHIFT + S", "Screen Capture", "omarchy-capture-screenshot")' >> ${HOME}/.config/hypr/bindings.lua
```


## Remove web apps you don't need

[SUPER] + [SPACE] >> Remove >> Web App

Remove all the web apps you don't need.


## Install [llama.cpp](https://llama.app/) GitHub:[(ggml-org/llama.cpp)](https://github.com/ggml-org/llama.cpp)

This assumes an Intel CPU build with an Nvidia GPU. AMD CPU and Radeon GPU builds will need to use ROCm instead of OpenBLAS and CUDA.

Using Omarchy >> Install >> Package

Search for and add [TAB]:
- cmake
- base-devel
- openblas
- cuda`

### Add CUDA tools to the users environment variables.

``` bash
echo -e 'export CUDA_HOME="/opt/cuda"\nexport PATH="$PATH:$CUDA_HOME/bin"\nexport LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA_HOME/lib64"\n' > ${HOME}/.config/environment.d/cuda.conf
```

### git clone and build to install [llama.cpp](https://github.com/ggml-org/llama.cpp)

``` bash
cd ${HOME}
git clone https://github.com/ggml-org/llama.cpp
mkdir -p llama.cpp/build
cd llama.cpp/build
cmake -B `pwd` -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DGGML_CUDA=ON -DGGML_CUDA_F8=ON -DGGML_CUDA_F16=ON -DCMAKE_BUILD_TYPE=Release ..
cmake --build `pwd`
```

### git pull and build to update [llama.ccp](https://github.com/ggml-org/llama.cpp) when needed

``` bash
cd ${HOME}/llama.cpp
git pull https://github.com/ggml-org/llama.cpp
cd build
rm -r tools/ui
cmake -B `pwd` -DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DGGML_CUDA=ON -DGGML_CUDA_F8=ON -DGGML_CUDA_F16=ON -DCMAKE_BUILD_TYPE=Release ..
cmake --build `pwd`
```
 
> [!NOTE]
> If you receive `Please commit your changes or stash them before you merge.` run the following: `git checkout -- [FILE NAME OF CONFLICTING FILE]` and try git again.

> [!NOTE]
> If you receive `CMake Error at tools/...` run the following: `cd .. && rm -rf build $$ mkdir build && cd build` and try cmake again.

Below is a bare minimum [llama.cpp](https://llama.app/) execution to get llama-serve  running with Nvidia CUDA and have Intel CPU offloading to cover gaps and overflows. It supports a UI at [http://127.0.0.1:11434/](http://127.0.0.1:11434/) and an OpenAI API at http://127.0.0.1:11434/v1. It only allows one model to be loaded at a time and does not focus on concurency optimization. It utilizes GGUF models that are saved into `${HOME}/llama.cpp/gguf/`. I recomend [Unsloth AI](https://huggingface.co/unsloth) models for this install. Use a model smaller than your total VRAM size, e.g. 8GB Video Card, use a 6GB Model (8-12B perameter at Q4 or Q5 quantization typically). Mixture of Expert (MoE) models can be any size but make sure the active experts (e.g. A4B) layers can fit in your GPU VRAM. 

``` bash
${HOME]/llama.cpp/build/bin/llama-server -c 0 -np 1 --cache-type-k q8_0 --cache-type-v q8_0 --batch-size 128 --models-dir ${HOME}/llama.cpp/gguf/ --models-max 1 --mmap --mlock --fit on --chat-template-kwargs "{\"thinking\":true, \"preserve_thinking\":true}" --reasoning on --host 127.0.0.1 --port 11434 --ui --cache-prompt --check-tensors
```

> [!NOTE]
> You will see models listed when this executes. This models names are the names you need for an opencode configuration.


## Create a [llama.cpp](https://llama.app/) service

Create a service for the [llama.cpp](https://llama.app/) install. This service is bare minimum like the command above. It is not production ready.

``` ${HOME}/.config/systemd/user/llama-server.service
[Unit]
Description="llama.cpp server (localhost)"
After=network.target

# Try to start for 2 minutes before calling it failed
StartLimitIntervalSec=120

# Try to start at most 5 times them stop the service
StartLimitBurst=5

[Service]
# See all CUDA Tools
Environment=PATH=/opt/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# The applciation
ExecStart=%h/llama.cpp/build/bin/llama-server -c 0 -np 1 --cache-type-k q8_0 --cache-type-v q8_0 --batch-size 128 --models-dir %h/llama.cpp/gguf/ --models-max 1 --mmap --mlock --fit on --chat-template-kwargs "{\"thinking\":true, \"preserve_thinking\":true}" --reasoning on --host 127.0.0.1 --port 11434 --ui --cache-prompt --check-tensors

# Allow models to stay in RAM wihtouy swaping
LimitMEMLOCK=infinity

# Restart if service fails or crashes
Restart=on-failure

# Wait 15 seconds, it may be cleaning up
RestartSec=15

# Give it 5 minutes to load incase models lag on cold GPU
TimeoutStartSec=5min

# Give it time to cleanly unload models and exit.
TimeoutStopSec=1min

# As target user on login (~/.config/systemd/user/llama-server.service)
[Install]
WantedBy=default.target
```

After a system `reboot` you can use this service just like any other `systemctl` service, just include the `--user` argument as it lives in userland.

``` bash
systemctl --user enable llama-server
systemctl --user status llama-server
systemctl --user start llama-server
systemctl --user restart llama-server
systemctl --user stop llama-server
```


## Add llama.cpp UI to the application launcher

[SUPER] + [SPACE] >> Install >> Web App

- Name: `llama.cpp UI`
- URL: `http://127.0.0.1:11434/`
- Icon: `https://raw.githubusercontent.com/ggml-org/llama.cpp/refs/heads/master/media/llama1-icon.png`


## Install [aider](https://aider.chat/) in Omarchy

[SUPER] + [SPACE] >> Install >> AUR (Arch User Repository)

> Search for `aider-install`

> [!NOTE]
> This install should partually fail due to [mise](https://mise.jdx.dev/) so run:
> `uvx aider-install`

Run `aider --version` to ensure the install was successful.


## [opencode](https://opencode.ai/) setup

[SUPER] + [SPACE] >> Setup >> Agent 

> Search for `opencode`
> OR from the terminal run: `omarchy default agent opencode`

Provided is a sample bare minimum default [opencode](https://github.com/anomalyco/opencode).json configuration file. This is by no means production ready. It is just enough to get you started with the [llama.cpp](https://github.com/anomalyco/opencode) install from above.

> [!NOTE]
> Replace `MODEL-NAME-PRESENTED-BY-LLAMA-SERVE` with the proper name llama-server is presenting.
> Replace `HUMAN READABLE NAME AND INFORMATION` with a name or description that has meaning to you.
> e.g. `"Qwen3.6-35B-A3B-UD-Q8_K_XL": { "name": "Qwen 3.6 35B MoE [A 3B] Unslothed - General Reasoning & Tooling"},`

> The `model` line outside of the `provider` block defines the default model for [opencode](https://github.com/anomalyco/opencode) to select every time it opens.
> The `default_agent` line set opencode in plan mode by default instead of build mode.

``` ${HOME}/.config/opencode/opencode.json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "llama.cpp": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "llama.cpp-(local)",
      "options": {
        "baseURL": "http://127.0.0.1:11434/v1"
      },
      "models": {
        "MODEL-NAME-PRESENTED-BY-LLAMA-SERVE": {
          "name": "HUMAN READABLE NAME AND INFORMATION"
        },
        "MODEL-NAME-PRESENTED-BY-LLAMA-SERVE": {
          "name": "HUMAN READABLE NAME AND INFORMATION"
        },
      }
    }
  },
  "model": "llama.cpp-(local)/MODEL-NAME-PRESENTED-BY-LLAMA-SERVE",
  "default_agent": "plan",
  "permission": {
    "bash": "ask",
    "read": "allow",
    "edit": "ask",
    "write": "ask",
    "grep": "allow",
    "glob": "allow",
    "list": "allow",
    "skill": "ask",
    "todowrite": "allow",
    "websearch": "ask",
    "webfetch": "deny",
    "question": "allow",
    "npm": "deny",
    "git": "ask"
  },
}
```

Expose this [opencode](https://github.com/anomalyco/opencode).json configuration to the system so that it can use your local LLMs for built-in features like `crash-watch`.

``` bash
echo -e "export OPENCODE_CONFIG=\"${HOME}/.config/opencode/opencode.json\"\n" > ${HOME}/.config/environment.d/opencode_config.conf
```


## Add the ability for the current logged in user to renice applications

> [!NOTE]
> Only if needed!

``` bash
sudo mkdir -p /etc/security/limits.d/
echo -e "$USER\tsoft\tnice\t-10\n" | sudo tee /etc/security/limits.d/99-renice.conf
```


## Game Developers needing to poke at game memory
Some of us like to work on game engines. You need to poke around memory. The `scanmem` tool is part of Arch Extras Repository (no relation to AUR). You won't see it in the standard Install Packages TUI. Run this command to install it from Extras: `sudo pacman -S gameconqueror scanmem`


## What is `n`

The command `n` is a built in function of the shell. Use `type n` to see the function. Omarchy base includes [neovim](https://neovim.io/) as it's editor and applied the [lazyvim](https://www.lazyvim.org/) customization templates to it. The base [neovim](https://neovim.io/) command is `nvim`.


## Fuzzy Finder for NeoViM

Create the alias `alias ff-neo='n $(ff -i -e)'` to make finding an opening files easier. It opens fuzzy finder in exact words match, case insensitive mode. Type a file (.e.g btop.conf). Select the correct file from the list (Up and Down Arrows and Enter). It will automatically open that file in NeoVIM (nvim). See above ***What is \`n\`***


## List all currently open window identifiers

When using Hyprland there are times where you will need to configure things for specific Window Identifiers. To list the identifiers for all open windows run `hyprctl clients | grep -E "Window |class:|title:|tags:|pid:|hidden:|visible:"`.


## Increase btop TUI window size (uses window identifies above)
It is just too small, especially if you increase the font size or use ghostty instead of foot. Open the user specific hyprland config: `n ${HOME}/.config/hypr/hyprland.lua`. In this file look for the section `-- Add any other personal Hyprland configuration below.` and add a line below that, on that line add the following `o.window("org.omarchy.btop", { name = "btop-size", tag = "-floating-window", float = true, center = true, size = { 1240, 950 } })`. Write the file: [ESC] [:] write [Enter]. QuitL [:] quit [Enter]. Hyprland uses lua scripts for the configuration, it should reload automatically... just to be sure run `hyprctl reload`. Press [SUPER] + [CTRL] + [E], look at that nice big btop. This will fit comfortably on any 1080p sized screen or larger. This works by removing the default `floating-window` tag that is assigned in the anonymous / default space. It then creates a floating centered window at the specified size. I names this setting so that it has override priority versus anonymous tags. If you want to use this for other apps change both the window identity and the rule name fields.


## Send an App to a specific workspace every time it is opened  (uses window identifies above)
> [!NOTE]
> I have not found a way to make this work for terminal applications.

Open the user specific hyprland config: `n ${HOME}/.config/hypr/hyprland.lua`. In this file look for the section `-- Add any other personal Hyprland configuration below.` and add a line below that, on that line add the following `o.window("firefox", { workspace = "2" })`. Firefox now always opens workspace 2.
