[![Create](https://github.com/rubyonracetracks/repo-manager/actions/workflows/create.yml/badge.svg)](https://github.com/rubyonracetracks/repo-manager/actions/workflows/create.yml)
[![Create Empty GitHub Repo](https://github.com/rubyonracetracks/repo-manager/actions/workflows/create-empty-repo.yml/badge.svg)](https://github.com/rubyonracetracks/repo-manager/actions/workflows/create-empty-repo.yml)
[![DeleteTest](https://github.com/rubyonracetracks/repo-manager/actions/workflows/delete-test.yml/badge.svg)](https://github.com/rubyonracetracks/repo-manager/actions/workflows/delete-test.yml)

# Repository Manager

This repository is used for managing the repositories automatically created by Rails Neutrino.  It's also a reference on how to execute tasks with GitHub CLI.

## Setup Procedure
* Use the "git clone" command to download this repository's source code to your local machine.
* Use the "cd" command to enter this repository's root directory.
* Run the setup script by entering the command "bash setup.sh".  Follow the instructions provided for setting the repository secrets.



## Parameters To Set
The following repository secrets need to be set:
*  SPECIAL_TOKEN
*  SSH_KNOWN_HOSTS
*  SSH_PRIVATE_KEY
*  SSH_PUBLIC_KEY
