# Switch layout
export XKB_DEFAULT_LAYOUT=us,ru
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle

# Qt themes without Qt
export QT_QPA_PLATFORMTHEME=qt5ct

# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/bin:/usr/sbin

# Path to your oh-my-zsh installation.
export ZSH=/home/prunkles/.oh-my-zsh

# .NET tools
export PATH=$PATH:$HOME/.dotnet/tools
# .NET prefered language
export DOTNET_NEW_PREFERRED_LANG=F#


# Develop bin scripts
export PATH=$PATH:$HOME/Develop/bin

# Android
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_SDK_PATH=$HOME/Android/Sdk
export ANDROID_NDK_PATH=$HOME/Android/Sdk/ndk-bundle
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

export ZSH=/usr/share/oh-my-zsh

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    git
    dotnet
    npm
)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

export EDITOR=nvim

alias cat="bat -p"

# FSI alias
alias fsi="dotnet fsi --nologo --consolecolors+"

# starship
eval "$(starship init zsh)"
