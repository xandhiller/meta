#! /bin/bash --

help_str="meta/install_configs.sh:
    * Need to be root to run this script.
    * Need to install a few packages.
    * Written for Ubuntu, could be generalised, I suppose.
    * Need to have ssh keys setup for github repos.\n"

# show help string if requested
if [[ $1 = "--help" ]] 
then
    printf "$help_str"
    exit
fi

# Check if running as root.
if [ "$EUID" -ne 0 ]
then
    printf "ERROR: Please run as root.""\n"
    printf "========================================"
    printf "\n""$help_str"
    exit
fi

meta_dir=$HOME/meta
config_dir=$meta_dir/configuration

cd $HOME
printf "Changing to dir: $HOME\n"
# setup ipython
# ln -s $config_dir/ipython_config.py 

# install necessary packages
printf "========================================\n"
printf "Installing packages...\n"
printf "========================================\n"
apt install ipython git neovim gcc zathura zsh

# clone necessary repositories
# root needs access to the ssh key... this may be a cursed thing to do
printf "========================================\n"
printf "Giving root user access to ssh key...\n"
printf "========================================\n"
eval `ssh-agent`
ssh-add $HOME/.ssh/id_rsa
printf "========================================\n"
printf "Cloning vundle...\n"
printf "========================================\n"
git clone git@github.com:VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
printf "========================================\n"
printf "Cloning textbooks...\n"
printf "========================================\n"
git clone git@github.com:xandhiller/tbooks.git $HOME/textbooks

# make necessary folders
printf "========================================\n"
printf "Making neccessary folders...\n"
printf "========================================\n"
mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/zathura

# link necessary files, will overwrite if it already exists as a symlink
printf "========================================\n"
printf "Creating symlinks with -f...\n"
printf "========================================\n"
ln -sf $config_dir/init.vim   ./.vimrc
ln -sf $config_dir/init.vim   ./.config/nvim/init.vim
ln -sf $config_dir/zathurarc  ./.config/zathura/zathurarc
ln -sf $config_dir/.zshrc     ./.zshrc

## WARNING: This currently erroneously sets root's shell to zsh, which is bad news. 
## WARNING: CBF fixing atm
# printf "========================================\n"
# printf "Changing default shell to zsh...\n"
# printf "========================================\n"
# chsh -s $(which zsh) $USER
# printf "========================================\n"
# printf "Checking if shell change worked...\n"
# printf "========================================\n"
# grep $USER /etc/passwd
# printf "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n"
# printf "@ WARNING: ZSH will (likely) not be default shell until you log out and @\n"
# printf "@          back in again.                                               @\n"
# printf "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n"

################################################################################
# FINISHED. Go back to where we started at the beginning of script
################################################################################
printf "Changing back to: "
cd -
