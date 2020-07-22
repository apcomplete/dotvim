# apcomplete's Vim Config

You should give it a try.

## Attention Windows Users!

If you are installing this config on Microsoft Windows, you must download and install the latest [RailsInstaller](http://www.railsinstaller.org/) package.  Go ahead and do it now.  I'll wait.

Install the latest version of [Vim](http://www.vim.org/download.php#pc) and install with default options + checking the "Create .bat files for command line use".

The Windows version of the Vim configuration uses rake (for installation) git (for Vim plugin installations), and requires several other packages to emulate Ack (for file searching) and Curl (for gists) under Windows.  RailsInstaller is a single package that installs everything we will need to get things working.

## Install

Windows users: be sure to use **RailsInstaller** > **Command Prompt with Ruby and Rails** to perform these installation steps instead of the normal command prompt.

1. `git clone git://github.com/apcomplete/dotvim.git`
2. `cd dotvim`
3. `rake` (This will symlink the necessary files to your home directory, asking for permission before clobbering anything.)
4. `vim` (or in Windows: `gvim`)
5. `:PlugClean`
6. `:PlugInstall`
