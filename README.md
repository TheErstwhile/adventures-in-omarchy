# 🏔️ Adventures in Omarchy

My journey of transforming a vanilla [Omarchy](<https://omarchy.org/>) installation into a high-performance development powerhouse.

Or, at the very least, a survival guide for the setup process.

Everything in this document has been **installed, configured, and tested on my system for multiple weeks**. These are not theoretical configurations or instructions assembled from random corners of the internet. This is what I actually use.

This guide is intentionally **opinionated and hardware-specific**. My primary system uses an **Intel CPU and NVIDIA GPU**. I don't have AMD hardware available for testing, so I'm not going to pretend I do.

If something here works for you: fantastic.

If something doesn't: congratulations, you've discovered Linux.

---

# 🧭 First Things First

## `omarchy` Is Your Friend

The `omarchy` command provides a multitude of [Omarchy](<https://omarchy.org/>) specific functions.

Before wandering off into configuration files, it's worth seeing what it can already do:

```
omarchy --help
omarchy update --help
omarchy wifi --help
omarchy capture --help
```

And remember:

> `--help` is also your friend.

It generally knows more about the command than I do.

---

## 🔋 Battery Settings

I prefer the following power profile configuration:

- Battery → `power-saver`
- AC power → `performance`

```
omarchy powerprofiles set battery power-saver
omarchy powerprofiles set ac performance
```

The goal is simple: save power when running on battery and stop pretending the CPU isn't plugged into a wall when it is.

---

# 🏹 Arch and the Dreaded AUR

Ah yes, the **Arch User Repository**.

> \[!WARNING\]\
>  Omarchy makes it very easy to access the AUR.
>
>  That does **not** mean you should install everything from it.
>
>  The AUR assumes you know what you're doing. If you're running Omarchy, you presumably have at least some idea what you're doing. Please don't ruin that reputation.

Whenever possible, use Omarchy's package installer:

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Package
```

Use the AUR as a **last resort**, not as your default package manager.

The AUR is a collection of user-contributed packages. It is useful for software that isn't available through the official repositories, but packages should still be treated with appropriate caution.

To see packages installed from outside the official repositories:

```
pacman -Qm
```

Before installing an AUR package, inspect:

- The build URL
- The build script / PKGBUILD
- Dependencies
- Installation scripts
- Where downloaded software originates

For basic package information:

```
yay -Qi [PACKAGE_NAME]
```

The AUR is the Wild West.

Sometimes you need to go there.

You don't need to build a vacation home there.

---

# ✍️ No Won Can Speel All of Times

Apparently, I cannot spell all of the times.

Fortunately, the computer can help.

Add the missing spelling dictionaries through Omarchy:

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Package
```

Search for and install:

### Tools

- `hunspell`
- `hyphen-en`

### Dictionaries

- Australia → `hunspell-en_au`
- Canada → `hunspell-en_ca`
- United States → `hunspell-en_us`
- Great Britain → `hunspell-en_gb`

Because apparently knowing how to spell _colour_ and _color_ isn't enough. We must support both civilizations.

---

# 🔤 Fonts - VictorMono Nerd Font

Install [VictorMono](<https://rubjo.github.io/victor-mono/>) Nerd Font:

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Style
    ↓
Font
```

Search for:

```
VictorMono Nerd Font
```

Because developers apparently spend an unreasonable amount of time deciding what their terminal should look like.

I am no exception.

---

# 🔎 Tiny Bar - I mean top bar

I am all for getting things out of the way, [David Heinemeier Hansson (DHH)](https://www.google.com/goto?url=CAESRwHrOzAVD7BZgeEsF9u0ImGYSza2zmb5cQmiletyPLC9diG9cpXda24DFTAuiuc2tGWdixk5mnhdYBEtyoKlMPHZ-ks1Tt76) must have 20/10 x-ray vision. 

I don't, I need to see the clock from time to time. 😄

Edit the following template file:

```
sudo nvim /usr/share/omarchy/default/themed/shell.toml.tpl
```

Change these specific values (do not copy and paste this text):

```
...
[bar]
...
...
scale-with-font  = true    <- Make sure it is true
# size-horizontal  = 26    <- Comment out
# size-vertical    = 28    <- Comment out
...
...
...
[font]
...
base-size = 18             <- Make sure this is a font size comfortable for you
```

Save the file:

```
[ESC]
[:]
write
[ENTER]
```

Then quit:

```
[:]
quit
[ENTER]
```

Editing this file will make this apply globally to all themes... 

Unless the theme artist had a different opinion and set it manually.

---

# 🚀 Shell - Brought to You by Starship

[Starship](<https://starship.rs/>) controls the shell prompt.

The configuration file lives here:

```
${HOME}/.config/starship.toml
```

This is the sample configuration I generally start with:

> [${HOME}/.config/starship.toml](https://github.com/TheErstwhile/adventures-in-omarchy/blob/main/.config/starship.toml)

A good shell prompt won't make you a better developer.

It will, however, make you _feel_ like one.

---

# 👻 Terminal - Lose Foot. Gain Ghostty.

[Foot](<https://codeberg.org/dnkl/foot/>) is perfectly respectable.

I just don't want it.

We're replacing it with [Ghostty](<https://ghostty.org/>).

### Install Ghostty

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Terminal
```

Search for:

```
ghostty
```

### Make Ghostty the Default Terminal

```
[SUPER] + [SPACE]
    ↓
Setup
    ↓
Defaults
    ↓
Terminal
```

 Search for:

```
ghostty
```

### Remove Foot

```
[SUPER] + [SPACE]
    ↓
Remove
    ↓
Terminal
```

Search for:

```
foot
```

 ### Configure Ghostty

 Create:

```
${HOME}/.config/ghostty/config
```

My configuration is available here:

> [${HOME}/.config/ghostty/config](https://github.com/TheErstwhile/adventures-in-omarchy/blob/main/.config/ghostty/config)

Don't like VictorMono?

See what Ghostty has available:

```
ghostty +list-fonts
```

Pick something else.

This is Linux.

We have choices.

---

# 🧰 Desktop Applications

## Flatpak

Install [Flatpak](<https://flathub.org/>):

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Package
```

Search for:

```
flatpak
```

### Make Flatpak Applications Show Up in the Launcher

Add the appropriate `XDG_DATA_DIRS` paths so Flatpak applications automatically populate the application launcher:

```
echo 'export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:${HOME}/.local/share/flatpak/exports/share:${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}' > ${HOME}/.config/environment.d/flatpak.conf
```

### Install `.flatpakref` Files

Download a `.flatpakref` file from [Flathub](<https://flathub.org/>) and install it with:

```
flatpak install ~/Downloads/com.provider.www.flatpakref
```

---

## KDE Connect

There is nothing wrong the buit in [LocalSend](https://localsend.org/), just many of us are already using KDE Connect and this makes the migration to a new tool easier.

Install [KDE Connect](<https://kdeconnect.kde.org/>):

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Package
```

Search for:

```
kdeconnect
```

### Firewall Rules

[KDE Connect](<https://kdeconnect.kde.org/>) needs firewall access to its communication ports.

As an example setup, you can allow TCP traffic on ports `1714:1764`.

Example:

```
sudo ufw allow from 192.168.2.12 to 192.168.1.20 port 1714:1764 proto tcp comment "kdeconnect-tcp on LAN (dev enp3s0)"
sudo ufw allow from 192.168.2.12 to 192.168.1.21 port 1714:1764 proto tcp comment "kdeconnect-tcp on WIFI (dev wlo1)"
```

In this example:

- `192.168.2.12` is the other device running KDE Connect.
- `192.168.1.20` is this machine over Ethernet.
- `192.168.1.21` is this machine over Wi-Fi.
- `enp3s0` is the Ethernet interface.
- `wlo1` is the Wi-Fi interface.

Your IP addresses and interface names will almost certainly be different.

Linux enjoys naming network interfaces as if they're serial numbers for experimental aircraft.

To find the network interfaces and IP addresses assigned to your own machine, run:

```
ip address
```

Use the addresses and interface names reported by your own system when adapting the firewall rules.

---

## Remove Web Apps You Don't Need

You know those web apps you installed because you thought:

> "Maybe I'll use this."

You won't.

Omarchy includes them by deafult!

You still won't use them.

Remove them:

```
[SUPER] + [SPACE]
    ↓
Remove
    ↓
Web App
```

Delete the ones you don't need.

Your application launcher will be cleaner.

Your conscience will be lighter.

---

# 🤖 Local AI

## llama.cpp

This section documents my [llama.cpp](<https://llama.app/>) setup.

GitHub:

[ggml-org/llama.cpp](<https://github.com/ggml-org/llama.cpp>)

### Hardware

This configuration assumes:

- Intel CPU
- NVIDIA GPU
- CUDA
- OpenBLAS

AMD CPU and Radeon GPU configurations will require different build options, such as ROCm.

I don't have AMD hardware to test those configurations, so they're outside the scope of this document.

This is the configuration I know works.

### Install Dependencies

Using Omarchy:

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Package
```

Search for and install:

- `cmake`
- `base-devel`
- `openblas`
- `cuda`

### Add CUDA Tools to the Environment

```
echo -e 'export CUDA_HOME="/opt/cuda"\nexport PATH="$PATH:$CUDA_HOME/bin"\nexport LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CUDA_HOME/lib64"\n' > ${HOME}/.config/environment.d/cuda.conf
```

### Clone and Build llama.cpp

```
cd ${HOME}

git clone https://github.com/ggml-org/llama.cpp

mkdir -p llama.cpp/build
cd llama.cpp/build

cmake -B "$(pwd)" \
    -DGGML_BLAS=ON \
    -DGGML_BLAS_VENDOR=OpenBLAS \
    -DGGML_CUDA=ON \
    -DGGML_CUDA_F8=ON \
    -DGGML_CUDA_F16=ON \
    -DCMAKE_BUILD_TYPE=Release \
    ..

cmake --build "$(pwd)"
```

### Update llama.cpp

When you need to update the repository:

```
cd ${HOME}/llama.cpp

git pull

cd build
rm -rf tools/ui

cmake -B "$(pwd)" \
    -DGGML_BLAS=ON \
    -DGGML_BLAS_VENDOR=OpenBLAS \
    -DGGML_CUDA=ON \
    -DGGML_CUDA_F8=ON \
    -DGGML_CUDA_F16=ON \
    -DCMAKE_BUILD_TYPE=Release \
    ..

cmake --build "$(pwd)"
```

> [!NOTE]
>
> If you receive:
> `Please commit your changes or stash them before you merge.`
>
> Run:
>
> ```
> git checkout -- [FILE NAME OF CONFLICTING FILE]
> ```
>
> and try Git again.
>😄
> Obviously, this discards changes to the specified file. Don't do it to something you actually wanted.

> [!NOTE]
>
> If you receive a `CMake Error at tools/...`, try rebuilding the directory from scratch:
>
>
> ```
> cd ..
> rm -rf build
> mkdir build
> cd build
> ```
>
> Then run CMake again.

---

## llama.cpp Server

The following is a bare-minimum configuration for running `llama-server` with NVIDIA CUDA and Intel CPU offloading.

It provides:

- A web UI at `http://127.0.0.1:11434/`
- An OpenAI-compatible API at `http://127.0.0.1:11434/v1`
- One model loaded at a time
- GGUF models from `${HOME}/llama.cpp/gguf/`

This configuration is **not designed for production or concurrency optimization**.

It is designed to get a local model running and talking to the rest of the tools in this setup.

### Models

I recommend [Unsloth](<https://huggingface.co/unsloth>) models for this setup.

As a general rule, don't use your entire VRAM budget for the model. Leave yourself some breathing room.

For example:

> 8 GB GPU → approximately 6 GB model

For typical Q4/Q5 quantizations, that can put you somewhere in the neighborhood of an 8–12B model, depending on the model architecture and context requirements.

Mixture-of-Experts (MoE) models can have a much larger total parameter count. Pay attention to the **active expert count** and whether the required layers fit in available VRAM.

> [!NOTE]
>
> [unsloth/Qwen3.6-35B-A3B-GGUF - Unsloth Dynamic Q8_K_XL](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF/blob/main/Qwen3.6-35B-A3B-UD-Q8_K_XL.gguf) is 39GB model, but it runs extremly well on 8GB VRAM video cards leveraging this configuration. It places the active layers on the GPU and the remainaing layers on the System RAM. Beautifully offloading less demanding tasks to the CPU.

### Start the Server

```
${HOME}/llama.cpp/build/bin/llama-server \
    -c 0 \
    -np 1 \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --batch-size 128 \
    --models-dir ${HOME}/llama.cpp/gguf/ \
    --models-max 1 \
    --mmap \
    --mlock \
    --fit on \
    --chat-template-kwargs "{\"thinking\":true, \"preserve_thinking\":true}" \
    --reasoning on \
    --host 127.0.0.1 \
    --port 11434 \
    --ui \
    --cache-prompt \
    --check-tensors
```

When this starts, you'll see the available models listed.

Those model names are what you'll need when configuring `opencode`.

---

## llama.cpp Service

Running the server manually works.

Running it automatically is better.

Create:

```
${HOME}/.config/systemd/user/llama-server.service
```

with:

```
[Unit]
Description=llama.cpp server (localhost)
After=network.target

# Try to start for 2 minutes before considering the service failed.
StartLimitIntervalSec=120

# Try to start at most 5 times before giving up.
StartLimitBurst=5

[Service]
# CUDA tools
Environment=PATH=/opt/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# llama.cpp server
ExecStart=%h/llama.cpp/build/bin/llama-server -c 0 -np 1 --cache-type-k q8_0 --cache-type-v q8_0 --batch-size 128 --models-dir %h/llama.cpp/gguf/ --models-max 1 --mmap --mlock --fit on --chat-template-kwargs "{\"thinking\":true, \"preserve_thinking\":true}" --reasoning on --host 127.0.0.1 --port 11434 --ui --cache-prompt --check-tensors

# Allow models to stay locked in RAM without swapping.
LimitMEMLOCK=infinity

# Restart if the service fails or crashes.
Restart=on-failure

# Give cleanup some time.
RestartSec=15

# Give models up to 5 minutes to load.
TimeoutStartSec=5min

# Give the server time to cleanly unload models and exit.
TimeoutStopSec=1min

[Install]
WantedBy=default.target
```

After a system reboot, manage the service like any other `systemctl` service.

The important part is `--user`, because this is a user-level service:

```
systemctl --user enable llama-server
systemctl --user status llama-server
systemctl --user start llama-server
systemctl --user restart llama-server
systemctl --user stop llama-server
```

No `sudo`.

The service belongs to you.

It is your llama.

---

## Add the llama.cpp UI to the Application Launcher

Create a web app:

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Web App
```

Use:

| Setting | Value |
| --- | --- |
| **Name** | `llama.cpp UI` |
| **URL** | `http://127.0.0.1:11434/` |
| **Icon** | `https://raw.githubusercontent.com/ggml-org/llama.cpp/refs/heads/master/media/llama1-icon.png` |

Now your local LLM has a proper application icon.

It still won't pay rent.

---

## Aider

Install [Aider](<https://aider.chat/>) through the Omarchy Package installer:

```
[SUPER] + [SPACE]
    ↓
Install
    ↓
Package
```

Search for:

```
aider-install
```

> [!NOTE]
>
> This installation should partially fail due to [mise](<https://mise.jdx.dev/>).
>
> When it does, run:
>
> ```
> uvx aider-install
> ```

Verify the installation:

```
aider --version
```

If you get a version number, congratulations.

Aider exists.

---

# 🧠 opencode Setup

Configure [opencode](<https://opencode.ai/>) as the default Omarchy agent:

```
[SUPER] + [SPACE]
    ↓
Setup
    ↓
Agent
```

Search for:

```
opencode
```

Or run:

```
omarchy default agent opencode
```

---

## Connect opencode to llama.cpp

The following is a minimal `opencode.json` configuration for using the local llama.cpp server.

> [!NOTE]
>
> OpenCode does not automatically detect the avaialble models in llama.cpp so you need to specify the models you plan on using with OpenCode. This will assume you have the [unsloth/Qwen3.6-35B-A3B-GGUF 8Q](https://huggingface.co/unsloth/Qwen3.6-35B-A3B-GGUF/blob/main/Qwen3.6-35B-A3B-UD-Q8_K_XL.gguf) model mentioned earlier.

Create:

```
${HOME}/.config/opencode/opencode.json
```

```
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
        }
      }
    }
  },
  "model": "llama.cpp-(local)/Qwen3.6-35B-A3B-UD-Q8_K_XL",
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
  }
}
```

Replace:

```
MODEL-NAME-PRESENTED-BY-LLAMA-SERVE
```

with the model name presented by `llama-server`.

Replace:

```
HUMAN READABLE NAME AND INFORMATION
```

with something meaningful.

For example:

```
"Qwen3.6-35B-A3B-UD-Q8_K_XL": {
  "name": "Qwen 3.6 35B MoE [A3B] - General Reasoning & Tooling"
}
```

The `model` setting outside the `provider` block determines the default model selected whenever `opencode` starts.

The `default_agent` setting starts `opencode` in `plan` mode instead of `build` mode.

---

## Expose the opencode Configuration

Expose the configuration file through the environment so `opencode` can use the local LLM configuration for built-in features such as `crash-watch`:

```
echo -e "export OPENCODE_CONFIG=\"${HOME}/.config/opencode/opencode.json\"\n" > ${HOME}/.config/environment.d/opencode_config.conf
```

---

# ⚙️ Developer Tweaks

## Give the Current User the Ability to Renice Applications

 > \[!NOTE\]\
>  **Only do this if you actually need it.**

Allow the current logged-in user to assign a nice value of `-10`:

```
sudo mkdir -p /etc/security/limits.d/

echo -e "$USER\tsoft\tnice\t-10\n" | \
    sudo tee /etc/security/limits.d/99-renice.conf
```

This is a system-level configuration change.

Use responsibly.

Your CPU has feelings too.

---

## Game Developers: Poke at Game Memory

Some of us like working on game engines.

Sometimes that means poking around in memory.

The `scanmem` tool is available from the Arch package repositories. Do not install from **the AUR**.

Install it with:

```
sudo pacman -S gameconqueror scanmem
```

Because sometimes debugging means asking a running process:

> "What exactly are you doing with that number?"

---

# 📝 Neovim

Omarchy uses [Neovim](<https://neovim.io/>) as its editor and applies [LazyVim](<https://www.lazyvim.org/>) customization templates.

The actual Neovim executable is:

```
nvim
```

But there's another command worth knowing.

## What Is `n`?

The command `n` is a built-in shell function.

To see what it actually is:

```
type n
```

Omarchy uses `nvim` as the underlying editor, while `n` provides a convenient function around it.

Several examples in this README use `n` for opening configuration files.

---

## Fuzzy Finder for Neovim

Create this alias:

```
alias ff-neo='n $(ff -i -e)'
```

This makes finding and opening files much easier.

The fuzzy finder runs in:

- Exact-match mode
- Case-insensitive mode

For example, type:

```
ff-neo btop.conf
```

Select the correct file using:

```
↑ ↓
ENTER
```

The selected file will automatically open in Neovim.

One less path to type.

One less opportunity to mistype a directory name.

---

# 🪟 Hyprland

## List All Currently Open Window Identifiers

When working with Hyprland, there are times when you need to configure something for a specific window.

Get the relevant identifiers for all currently open windows with:

```
hyprctl clients | grep -E "Window |class:|title:|tags:|pid:|hidden:|visible:"
```

This is particularly useful when creating window rules.

---

## Give the window manager some life and space
Simple animations to give window interactions a more natural feel.

I also can't stand the workspace padding on windows in `scrolling` mode versus `dwindle` mode. Not sure what I mean, open a bunch of windows and press [SUPER] + [L] a couple times. 

See the comments in the file:

---

## Increase the `btop` TUI Window Size

The default `btop` window is just too small.

Especially if you've increased the font size.

Especially if you're using Ghostty.

Open the user-specific Hyprland configuration:

```
n ${HOME}/.config/hypr/hyprland.lua
```

Find:

```
-- Add any other personal Hyprland configuration below.
```

Add the following underneath it:

```
-- Make the btop windows larger. Make this a named rule as they override default anonymous rules.
o.window("org.omarchy.btop", {
    name = "btop-size",
    tag = "-floating-window",
    float = true,
    center = true,
    size = { 1240, 950 }
})
```

Save the file:

```
[ESC]
[:]
write
[ENTER]
```

Then quit:

```
[:]
quit
[ENTER]
```

Hyprland should reload automatically.

To make absolutely sure Hyprland reloads:

```
hyprctl reload
```

Launch `btop`:

```
[SUPER] + [CTRL] + [E]
```

Look at that.

Much better.

### What's Happening Here?

The rule removes the default `floating-window` tag assigned in the anonymous/default space.

 It then creates a floating, centered window at:

```
1240 × 950
```

The rule is named `btop-size` so it has override priority over anonymous tags.

This size works comfortably on a 1080p display or larger.

Want to use the same technique for another application?

Change:

```
org.omarchy.btop
```

to the appropriate window identity and change:

```
btop-size
```

to an appropriate rule name.

---

## Center Float all Steam Games at 1080

Here is a handy one to demonstrate. Float + Center all Steam Games / Apps at 1920x1080

```
-- Float Center all Steam Games / Apps at 1920x1080
o.window("steam_app_.*", {
    name = "steam-size",
    tag = "-floating-window",
    float = true,
    center = true,
    size = { 1920, 1080 }
})
```

---

## Send an App to a Specific Workspace Every Time

> [!NOTE]
> I have not found a way to make this work reliably for terminal applications.

Open:

```
n ${HOME}/.config/hypr/hyprland.lua
```

Find:

```
-- Add any other personal Hyprland configuration below.
```

Add:

```
o.window("firefox", {
    workspace = "2"
})
```

Firefox will now always open on workspace 2.

Because apparently telling applications where to live is easier than remembering where you put them.
---

# Convert MP4 to WEBM

For all the built in trans-coding wonders that Omarchy has, it misses the mark on this one. 

ffmpeg is installed by default, use this to convert screen captures.

```
ffmpeg -i ${HOME}/Videos/INPUT.mp4 -c:v libvpx-vp9 -crf 26 -b:v 0 -row-mt 1 -c:a libopus ${HOME}/Videos/OUTPUT.webm
```

Changing crf to `-crf 32` will force a stronger quantization compression and the file will be smaller. This is OK for desktop recordings, but video game or flashy effects recording will blur and pixelate if there are too many pixel colors at once. 

```
ffmpeg -i ${HOME}/Videos/INPUT.mp4 -c:v libvpx-vp9 -crf 32 -b:v 0 -row-mt 1 -c:a libopus ${HOME}/Videos/OUTPUT.webm
```

Adding `-vf scale=-2:720` will scale the video down to 720p, droping file size but retain the lower compression at `-crf 26`

```
ffmpeg -i ${HOME}/Videos/INPUT.mp4 -c:v libvpx-vp9 -crf 26 -b:v 0 -vf scale=-2:720 -row-mt 1 -c:a libopus ${HOME}/Videos/OUTPUT.webm
```


---

# 🏁 Final Thoughts

This repository is intentionally a collection of **tested notes, configurations, and personal preferences** rather than a universal Omarchy configuration.

 The hardware profile is intentional.

 The opinions are intentional.

 The weird little tweaks are intentional.

 If you find something useful here, steal it shamelessly.

 If something doesn't work on your machine, figure out why and fix it.

 And if you discover something better:

 **I'd love to hear about it.**

 The entire point of documenting this stuff is so that Future Me doesn't have to rediscover it at 2 AM after an innocent:

```
sudo pacman -S something
```
