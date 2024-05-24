<img src="https://raw.githubusercontent.com/flyck/mac-dev-playbook/main/.assets/Mac-Dev-Playbook-Logo.png" width="250" height="156" alt="Mac Dev Playbook Logo" />

# Mac Dev Playbook

## Installation

  1. Go to this repo with Safari on the new laptop
  1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
  2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):
     1. Go to python.org/download and download the python installer. Install manually
     2. Install the SSL certificates for python.
     ```sh
     /Application/Python... /Install\ Certificates.command
     ```
     3. Install Ansible: `pip3 install ansible`
  3. Clone or download this repository to your local drive:
     `mkdir git; cd git; git clone https://github.com/flyck/mac-dev-playbook.git`
  3. Remove all existing dock icons
     ```sh
     defaults write com.apple.dock persistent-apps -array
     killall Dock
     ```
  4. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required
     Ansible roles. They allow automatic installation of homebrew packages and more.
  5. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your macOS
     account password when prompted for the 'BECOME' password.
     - Casks might need to be commented out temporarily because of:
       https://github.com/geerlingguy/mac-dev-playbook/issues/196
     - Then, add brew to your path: `export PATH="/opt/homebrew/bin:$PATH"`and run `brew update`.
     - Finally comment then back in, and the ansible playbook should succeed

## Goals

- [x] Have central homebrew apps automatically installed
  - zsh
  - vscode
  - git
- [ ] Setup iterm2
  - zsh config
  - iterm profile with important settings
  - iterm color schemes
- [ ] Git setup
  - git global config
  - setup git/ folder
  - download 6 most recently contributed github projects
- [ ] Javascript Dev
  - Node
    - bun install
    - fnm install
    - set an fnm default version (download it)
- [ ] Emacs config setup
  - [ ] brew install emacs
  - download config
  - [x] ispell
  - [x] ag search
- [x] Dock setup
  - defaults write com.apple.dock persistent-apps -array
  - killall Dock
  - brew install dockutil
  - dockutil add emacs ...
- [ ] wallpaper

## Special Thanks

Thanks to the inspiration and underlying ansible roles from geerlingguy's
[mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook).
