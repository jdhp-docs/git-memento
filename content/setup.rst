Setup Git
=========

Configuration files
-------------------

``.git/config``
    Repository-specific configuration settings (manipulated with the ``--file`` option of ``git config``)

``~/.gitconfig``
    User-specific configuration settings (manipulated with the ``--global`` option of ``git config``)

``/etc/gitconfig``
    System-wide configuration settings (manipulated with the ``--system`` option of ``git config``)

Configuration example
---------------------

User information::

    git config --global user.name "Jeremie DECOCK"
    git config --global user.email "jd.jdhp@gmail.com"

Setup push.default (see http://stackoverflow.com/questions/23918062/simple-vs-current-push-default-in-git-for-decentralized-workflow)::

    git config --global push.default simple

Setup colors::

    git config --global color.branch auto
    git config --global color.diff auto
    git config --global color.grep auto
    git config --global color.interactive auto
    git config --global color.status auto

Some useful aliases::

    git config --global alias.ci commit
    git config --global alias.co checkout
    git config --global alias.st status
    git config --global alias.br branch
    git config --global alias.unstage "reset HEAD --"
    git config --global alias.graph "log --oneline --decorate --graph --all"

Add a GPG key (see https://help.github.com/articles/telling-git-about-your-gpg-key/ and https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work ; for GitHub users see https://github.com/blog/2144-gpg-signature-verification)::

    git config --global user.signingkey PUBLIC_KEY_ID

List current configuration settings
-----------------------------------

::

    git config -l

Some advanced aliases
---------------------

Some advanced aliases are available at https://git.wiki.kernel.org/index.php/Aliases).

Use graphviz for display (https://git.wiki.kernel.org/index.php/Aliases#Use_graphviz_for_display)::

    [alias]
        graphviz = "!f() { \
            echo 'digraph git {' ; \
            git log --pretty='format:  %h -> { %p }' \"$@\" | \
                sed 's/[0-9a-f][0-9a-f]*/\"&\"/g' ; \
            echo '}'; \
            }; f"

Get tab completion of branches, tags, subcommands, ...
------------------------------------------------------

Git contains a set of completion scripts for *bash* (``git-completion.bash``),
*tcsh* (``git-completion.tcsh``) and *zsh* (``git-completion.zsh``).
Usually these files are already installed in the "git-core" directory of your
git installation.
In case, you can find them with the following command::

    find / -type f -name "git-completion.*" 2> /dev/null

or you can download them at https://github.com/git/git/tree/master/contrib/completion


Let's say you use Bash and your completion script is in
``/usr/share/git-core/`` (adapt the following lines to your case), then to
activate git completion, simply add the following lines to your shell
startup file (e.g. ``~/.bashrc``)::

    # Define completion for Git
    git_completion_path=/usr/share/git-core/git-completion.bash
    [ -r ${git_completion_path} ] && source ${git_completion_path}

.. See also https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

Show the current branch in the shell prompt
-------------------------------------------

Git contains a script to show the current branch in the shell prompt
(``git-prompt.sh``).
Usually this file is already installed in the "git-core" directory of your
git installation.
In case, you can find it with the following command::

    find / -type f -name "git-prompt.sh" 2> /dev/null

or you can download it at https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
(note for *Debian8* users: the script is provided by the ``git`` package in
``/usr/lib/git-core/`` and has been renamed ``git-sh-prompt``).

Let's say you use Bash (otherwise adapt the following lines to your case).
To activate git information in prompt, simply add the following lines at the
end of your shell startup file (e.g. ``~/.bashrc``)::

    # Define prompt for Git
    git_prompt_path=/usr/share/git-core/git-prompt.sh
    [ -r ${git_prompt_path} ] && source ${git_prompt_path}
    
    # Define the prompt shell
    PS1='\u@\h:\w`__git_ps1 " (%s)"`\$ '

or if you want a bit of color, replace the last line by::

    PS1='\u@\h:\w\[\033[31;1m\]`__git_ps1 " (%s)"`\[\033[0m\]\$ '

