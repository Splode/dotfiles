# Initialize starship shell
Invoke-Expression (&starship init powershell)

# Use fd in conjunction with fzf
$Env:FZF_DEFAULT_COMMAND="fd --type f"

# Set bat syntax theme
$Env:BAT_THEME="Dracula"

# Enable color output for Mage
$Env:MAGEFILE_ENABLE_COLOR=1

# Default editor
$Env:EDITOR="$Env:USERPROFILE\scoop\shims\vim.EXE"

# Register aliases
New-Alias -Name myip -Value getIP
New-Alias -Name gfe -Value gitFetch
New-Alias -Name glog -Value gitLog
New-Alias -Name gpl -Value gitPull
New-Alias -Name gpu -Value gitPush
New-Alias -Name gss -Value gitStatus
New-Alias -Name gaa -Value gitAddAll
New-Alias -Name gls -Value gitBranchList
New-Alias -Name touch -Value createFile
New-Alias -Name sup -Value scoopUpdate -Description "Update scoop repositories"
New-Alias -Name supg -Value scoopUpgrade
New-Alias -Name cal -Value Get-Calendar # requires https://github.com/jdhitsolutions/PSCalendar

# lsd
Set-Alias -Name ls -Value list
New-Alias -Name l -Value listLong
New-Alias -Name ll -Value listAll
New-Alias -Name la -Value listHidden
New-Alias -Name lt -Value listTree

# Create a new, empty file
function createFile {
  New-Item -Path $args -ItemType File
}

# Get current IP address
function getIP {
  curl icanhazip.com
}

function gitFetch {
  git fetch origin
}

function gitLog {
  git log --oneline --all --graph --decorate
}

function gitPull {
  git pull
}

function gitPush {
  git push
}

function gitStatus {
  git status
}

function gitAddAll {
  git add .
}

function gitBranchList {
  git branch --list
}

# Update scoop repos and display status
function scoopUpdate {
  scoop update
  scoop status
}

# Update all scoop packages
function scoopUpgrade {
  scoop update *
}

function list {
  lsd $args
}

function listLong {
  lsd -l $args
}

function listAll {
  lsd -la $args
}

function listHidden {
  lsd -a $args
}

function listTree {
  lsd --tree $args
}