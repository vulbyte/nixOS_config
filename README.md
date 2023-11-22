# nixOS_config
this is my default configuration for me to quickly copy paste, and doup around my config stuff. 

## note for any readers
- my goal with this is to at one point have my system be able to launch with only 1 .sh script.
- this *will* be a very slow moving project. 
- my intent is to have it be stable over updated, rapidly.
- there are propriotary softwares installed aswell (by extent, allowUnfree = true). foss will be prefered if the option is ~90% as good as the paid thing, if not then i won't be including it. this is ENTIRELY down to my personal opinion, if you don't like my preferences feel free to for this or just add your own packages later

### non-code packages installed (alphabetically) 
much more to come later

-1
-2
-3
-4
-5
-6
-7
-8
-9
-a
-b
-c
-d
    dolphin (file explorer)
-e
    elisa
    emoji selector
-f
    firefox
-g
    git
    gwenview
-h
-i
-j
-k
    kate    
    kwrite
-l
    
-m
-n
    neovim
-o
    okular
-p
    pciutils
-q
-r
-s
    steam
    specticle
    system monitor
-t
    thunderbird
-u
    usbutils
-v
    vim
-w
    wget
-x
-y
    yakuake
-z

### how to use
1. you WILL need to ```download and install (nixos)[https://nixos.org/]```
(if you are unaware of how to do this:
    1. how are you here?
    2. ventoy is a good start
    3. if you want to install this along windows, don't just make this your main things
2. ```cd /etc/config/```
3. after, delete all files in /etc/nixos/ (this is the danger zone, if you mess up then you can mess up your install and maybe even your system).
    to delete the files run: ```sudo rm -rf ./```
4. clone the new files into /etc/nixos/ with: ```git clone https://github.com/vulbyte/nixOS_config/```

### objectives
- [ ] one script run to setup (minus logins)
- [ ] 

reminders for me later cause i'm a dork: 
when asked for username, you'll need to enter your username.
for password, enter your gsh token
