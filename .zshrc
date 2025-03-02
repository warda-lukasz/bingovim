##### OPTIONS

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
plugins=(git zsh-autosuggestions web-search chucknorris)
source $ZSH/oh-my-zsh.sh

##### ALIASES

alias fv="cd ~/Projekty/fv-lua-maker && ./makeFv.lua"
alias ldap="/home/bingo/Dokumenty/useful/./resetPassword.sh"
alias lg='lazygit'
alias nvim='neovide --no-tabs --size=3400x2000 --fork'
alias v='nvim'
alias vim='v'
alias dbconfig='nvim ~/.local/state/nvim/dbee/persistence.json'

##### VARIABLES

export INTELEPHENSE_LIC_KEY="00CVTZU4O8XHB45"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##### FUNCTIONS

dev() {
    echo "Wybierz aplikację do uruchomienia:"

    echo "--------------------------------"
    printf "\n"
    echo "1) ACCS API"
    echo "2) ACCS Front"
    echo "3) ACCS Scripter"
    echo "4) INS"
    echo "5) SLCP"
    echo "6) RMPanel"

    printf "\n"
    echo "--------------------------------"
    printf "\n"

    echo -n "Twój wybór (1-6): "

    read -r choice

    case $choice in
        1)
            cd /home/bingo/Projekty/INS2-api
            nvim
            cd -
            ;;
        2)
            cd /home/bingo/Projekty/INS2-front
            nvim
            cd -
            ;;
        3)
            cd /home/bingo/Projekty/accs-scripter
            nvim
            cd -
            ;;
        4)

            cd /home/bingo/Projekty/INS
            nvim
            cd -
            ;;
        5)

            cd /home/bingo/Projekty/SLCP
            nvim
            cd -
            ;;
        6)

            cd /home/bingo/Projekty/RMPanel
            nvim
            cd -
            ;;
        *)
            echo -e "\n❌ Nieprawidłowy wybór."
            exit 1
            ;;
    esac
}

ghcs() {
        FUNCNAME="$funcstack[1]"
        TARGET="shell"
	local GH_DEBUG="$GH_DEBUG"
	local GH_HOST="$GH_HOST"

	read -r -d '' __USAGE <<-EOF
	Wrapper around \`gh copilot suggest\` to suggest a command based on a natural language description of the desired output effort.
	Supports executing suggested commands if applicable.

	USAGE
	  $FUNCNAME [flags] <prompt>

	FLAGS
	  -d, --debug           Enable debugging
	  -h, --help            Display help usage
	      --hostname        The GitHub host to use for authentication
	  -t, --target target   Target for suggestion; must be shell, gh, git
	                        default: "$TARGET"

	EXAMPLES

	- Guided experience
	  $ $FUNCNAME

	- Git use cases
	  $ $FUNCNAME -t git "Undo the most recent local commits"
	  $ $FUNCNAME -t git "Clean up local branches"
	  $ $FUNCNAME -t git "Setup LFS for images"

	- Working with the GitHub CLI in the terminal
	  $ $FUNCNAME -t gh "Create pull request"
	  $ $FUNCNAME -t gh "List pull requests waiting for my review"
	  $ $FUNCNAME -t gh "Summarize work I have done in issues and pull requests for promotion"

	- General use cases
	  $ $FUNCNAME "Kill processes holding onto deleted files"
	  $ $FUNCNAME "Test whether there are SSL/TLS issues with github.com"
	  $ $FUNCNAME "Convert SVG to PNG and resize"
	  $ $FUNCNAME "Convert MOV to animated PNG"
	EOF

	local OPT OPTARG OPTIND
	while getopts "dht:-:" OPT; do
		if [ "$OPT" = "-" ]; then     # long option: reformulate OPT and OPTARG
			OPT="${OPTARG%%=*}"       # extract long option name
			OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
			OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
		fi

		case "$OPT" in
			debug | d)
				GH_DEBUG=api
				;;

			help | h)
				echo "$__USAGE"
				return 0
				;;

			hostname)
				GH_HOST="$OPTARG"
				;;

			target | t)
				TARGET="$OPTARG"
				;;
		esac
	done

	# shift so that $@, $1, etc. refer to the non-option arguments
	shift "$((OPTIND-1))"

	TMPFILE="$(mktemp -t gh-copilotXXXXXX)"
	trap 'rm -f "$TMPFILE"' EXIT
	if GH_DEBUG="$GH_DEBUG" GH_HOST="$GH_HOST" gh copilot suggest -t "$TARGET" "$@" --shell-out "$TMPFILE"; then
		if [ -s "$TMPFILE" ]; then
			FIXED_CMD="$(cat $TMPFILE)"
			print -s -- "$FIXED_CMD"
			echo
			eval -- "$FIXED_CMD"
		fi
	else
		return 1
	fi
}

ghce() {
	FUNCNAME="$funcstack[1]"
	local GH_DEBUG="$GH_DEBUG"
	local GH_HOST="$GH_HOST"

	read -r -d '' __USAGE <<-EOF
	Wrapper around \`gh copilot explain\` to explain a given input command in natural language.

	USAGE
	  $FUNCNAME [flags] <command>

	FLAGS
	  -d, --debug      Enable debugging
	  -h, --help       Display help usage
	      --hostname   The GitHub host to use for authentication

	EXAMPLES

	# View disk usage, sorted by size
	$ $FUNCNAME 'du -sh | sort -h'

	# View git repository history as text graphical representation
	$ $FUNCNAME 'git log --oneline --graph --decorate --all'

	# Remove binary objects larger than 50 megabytes from git history
	$ $FUNCNAME 'bfg --strip-blobs-bigger-than 50M'
	EOF

	local OPT OPTARG OPTIND
	while getopts "dh-:" OPT; do
		if [ "$OPT" = "-" ]; then     # long option: reformulate OPT and OPTARG
			OPT="${OPTARG%%=*}"       # extract long option name
			OPTARG="${OPTARG#"$OPT"}" # extract long option argument (may be empty)
			OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
		fi

		case "$OPT" in
			debug | d)
				GH_DEBUG=api
				;;

			help | h)
				echo "$__USAGE"
				return 0
				;;

			hostname)
				GH_HOST="$OPTARG"
				;;
		esac
	done

	# shift so that $@, $1, etc. refer to the non-option arguments
	shift "$((OPTIND-1))"

	GH_DEBUG="$GH_DEBUG" GH_HOST="$GH_HOST" gh copilot explain "$@"
}
