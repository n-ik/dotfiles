#  Dotfiles
My macOS /  Bash on WIndows / Linux dotfiles. 
(at the moment ,only macOS was tested)

## Installation
**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script
Clone the repository in your home directory

```bash
git clone git@github.com:n-ik/dotfiles.git ~/.dotfiles
```

The following script will create the symlink to your home dofiles and move the old files in ~/.old_dotfiles

```bash
bash ~/dotfiles/bootstrap.sh
```