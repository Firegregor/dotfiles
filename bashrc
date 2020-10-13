
# Git
. ~/git-completion.bash

# vim mode
set -o vi

# EVAA specific
if [[ ":$PATH:" != *":/new-directory:"* ]]; then PATH=${PATH}:/evaa/tools/evaa_cli/src/evaa_cli; fi
alias evaa="sudo python3 /evaa/tools/evaa_cli/src/evaa_cli/evaa.py"
