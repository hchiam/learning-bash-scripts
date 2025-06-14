# Learning Bash Scripts

Just one of the things I'm learning. <https://github.com/hchiam/learning>

[You type commands in a terminal or console, and those commands get translated by the shell for the kernel to perform.](https://www.quora.com/What-is-the-difference-among-shell-console-terminal-and-kernel-Also-what-is-the-difference-between-shell-and-application-programs)

A nice article on key things to know: <https://www.joshwcomeau.com/javascript/terminal-for-js-devs> (my own summary notes are below)

To enable running a script upon click, you need to edit permissions. For example, for `chrome-incognito-shortcut.app`:

```bash
chmod 744 chrome-incognito-shortcut.app
```

## Related Repos

<https://github.com/hchiam/learning-powershell>

<https://github.com/hchiam/learning-dependency-cruiser>

<https://github.com/hchiam/learning-https-server>

## `>` and `<` and `>>` and `<<` in bash

<https://superuser.com/questions/480599/with-regards-to-piping-commands-what-are-the-greater-than-and-less-than>

- `>` = redirect output = "(over)write to", e.g.: `echo 'hello' > file.txt`
- `<` = redirect input = "read", e.g.: `cat < file.txt` (same as just `cat file.txt`)
- `>>` = append to end of file, e.g.: `echo 'new last line of text' >> file.txt`
- `cat << EOF >> file.txt` = "start multiline input session that ends when you type `EOF` and hit Enter" (but personally, `nano` seems to do this simpler)

## Useful `git` commands

- `git commit --amend`

- `git reset HEAD~1` to "un-commit"

- `git pull origin dev` (if you want to merge commits into `dev` branch into your local branch) and then type `:qa` and hit enter. Now you can `git push`.

- `git tag <name-of-tag>; git push --tags` (and then you can draft a new release on the same tag name to add details to it on GitHub)

From <https://stackoverflow.com/questions/4348590/how-can-i-make-git-ignore-future-revisions-to-a-file/39776107#39776107> :

- `git update-index --skip-worktree your-file-to-ignore-future-revisions-for.txt`
- `git update-index --no-skip-worktree your-file-to-start-watching-revisions-for.txt`

From <https://www.smashingmagazine.com/make-life-easier-when-using-git/> :

- `git status -sb`
- git hooks
- Try using git `bisect` with "binary search" automation to find the breaking change

```bash
git bisect start
git bisect good c5ba734 # if c5ba734 is a commit without the bug
git bisect bad 6c093f4 #if 6c093f4 is a commit with the bug
# run test: git bisect run ./test-bug  (or: git bisect run jest)
git bisect bad # if the current commit has the bug
git bisect good # if current commit does not have the bug
# (repeats until find the first commit with the bug)
git bisect reset # or: git bisect reset HEAD (or: git bisect reset <commit-id>)
```

```bash
git rebase -i --exec "yarn test" d294ae9 # test all commits from d294ae9 to HEAD, until hit first failing commit
```

From <https://dev.to/g_abud/advanced-git-reference-1o9j#git-commands> :

- `git rm --cached <file-name>` to stop tracking `<file-name>` in version control
- `git diff --staged`
- `git diff branch1..branch2`
- `git commit --amend` to add more changes to the last commit
- `git cherry-pick <commit-sha>` to bring in a commit from a different branch
- `git checkout <branch-name> <file-name>` to bring in a file from a differnt branch

- `git reset <commit-sha>`
- `git reset --hard HEAD~1` = undo last commit and rewrite history (then `git push -f` to push rewritten history)
- `git reset --hard HEAD~n # where n is the last n commits` = undo last n commit and rewrite history (then `git push -f` to push rewritten history)
- `git reset --hard <commit-sha>` = undo comments and rewrite history (then `git push -f` to push rewritten history)
- `--soft` = uncommit but still staged; `--mixed` = uncommit+unstage, but changes kept locally; `--hard` = uncommit+unstage+delete changes

- `git stash` to save your changes to top of stash stack (add `-u` to stash untracked files as well)
- `git stash list` to see what's in your stash
- `git stash save "message to go along with changes"`
- `git stash pop`

From <https://www.youtube.com/watch?v=ecK3EnyGD8o> :

- `git stash save nameforlater`

  - and then later `git stash list` (note the index)
  - and then `git stash apply <index>` to use `<index>`

- `git branch -M main` to rename branch to main, and then `git push -u origin main` ([more info](https://www.git-tower.com/learn/git/faq/git-rename-master-to-main/))

- `git log --graph --oneline --decorate` for a pared-down git log

- lots more git tips at a [Fireship.io YouTube video](https://www.youtube.com/watch?v=ecK3EnyGD8o)

### How to revert changes of a git push

This shows the commit hash: (looks like `l0ngStr1ng0fL3t7er5AndNum83rz`)

```bash
git log
```

then use the hash of the commit you want to revert: (and when you're in the in-CLI editor, type `:qa` and then hit Enter)

```bash
git revert l0ngStr1ng0fL3t7er5AndNum83rz
```

### How to create a branch with no history

<https://stackoverflow.com/a/34954852>

```bash
git checkout --orphan <name_you_choose_for_orphan_branch>
git commit
git push <remote-name> <branch-name>
```

## if `.gitignore` isn't properly ignoring files

<https://stackoverflow.com/questions/45400361/why-is-gitignore-not-ignoring-my-files>

For example, if I accidentally `git add`ed in `dist/index.html`, then changes on it will be tracked, so I'd need to run one of these:

```sh
git rm --cached dist/index.html
git rm -r --cached dist
# -r is for recursive

# and then add and commit the new change(s) to untrack
```

## Random Notes

Get file info like edit date: `stat filename`

Example of script used by Travis CI `npm run build` to copy files to `/public` folder: [copy-to-public-folder.sh](https://github.com/hchiam/hchiam.github.io/blob/master/copy-to-public-folder.sh)

Example of script used to generate and insert a package SemVer number for a JS file: [package.sh](https://github.com/hchiam/_2DNote/blob/master/package.sh)

Exit/quit:

```bash
exit
```

### Get list of globally installed packages

`yarn global list`

`npm list -g --depth 0` for just top-level

`npm list -g browser-sync` or a specific package (this example checks if `browser-sync` is installed globally)

### npm scripts that accept parameters

Examples I set up in package.json:

```json
{
  "test": "tsc $npm_config_name.ts --lib es6,dom && node $npm_config_name.js",
  "demo": "echo \"HELLO $npm_config_file_name.ts GOODBYE (\\$npm_config_whatever will match --whatever=...)\""
}
```

So you can do this:

```bash
npm run demo --file_name=someFileName
# prints out: HELLO someFileName.ts GOODBYE [...]
```

and:

```bash
npm run test --name=sameFileName
# will run: tsc sameFileName.ts --lib es6,dom && node sameFileName.js
```

### Install package without dynamic version (i.e. without caret ^)

```sh
npm install <package-name> --save-exact
```

so you get `1.2.3` instead of `^1.2.3` in your `package.json`

<https://stackoverflow.com/questions/58638817/what-is-the-purpose-of-using-save-exact#:~:text=--save-exact%20will%20generate%20the%20next%20package.json%20code>

### Actually upgrade node

You can upgrade to the latest `npm` with `npm install -g npm@latest`

But installing node manually doesn't always work, and using `n` or clean cache didn't seem to work for me. <https://stackoverflow.com/questions/23940172/not-seeing-latest-version-when-updating-node-js-via-installer-msi-windows-7/31229369#31229369>

For Mac/OSX, try this first:

```bash
brew install node
```

Otherwise this:

```bash
nvm install node --lts
node -v
```

If you accidentally installed the latest but want to downgrade to the last stable instead:

```bash
nvm install 14.15.0 # whatever the latest unstable versioni on https://nodejs.org/en/
nvm use 14.15.0
```

### switching from `bash` to `zsh`: (and back)

<https://github.com/hchiam/learning-zsh>

### Format whole directory instead of waiting for each file save in VSCode

```bash
prettier --write .
```

or

```bash
npx prettier --write .
```

### how to sync forked repo with the original repo

<https://stackoverflow.com/questions/7244321/how-do-i-update-or-sync-a-forked-repository-on-github>

```bash
git remote add upstream https://github.com/<owner>/<repo>.git
git fetch upstream
```

### `gh` CLI commands

<https://github.com/hchiam/learning-gh>

### setting up GitHub PATs (Personal Access Tokens)

For `gh` CLI: copy your PAT, run `gh auth login`, and paste your PAT when prompted to.

For npm pkg: copy your PAT, open `~/.npmrc`, and paste your PAT to be the "TOKEN" part of a string `//npm.pkg.github.com/:_authToken=TOKEN` in that `~/.npmrc` file.

### quickly set up a basic server to serve index.html (or whatever's in the current folder)

```sh
python3 -m http.server 8000
```

or set up shortcut `srv` in .bash_profile:

```
alias srv='python3 -m http.server 8000'
```

## <https://www.joshwcomeau.com/javascript/terminal-for-js-devs>

- Bash ≈ Zsh
- the terminal is kinda like the console log in browser dev tools, but can switch between shell languages
- `echo` ≈ `console.log`
- `$` notation is just for start of prompt
- `pwd` = print the current working directory folder path
- `ls` = list current folder files/subfolders
  - `ls -la` = `-l`ong data too like updated dates, and `-a`ll files including hidden files/folders
- `cd` = change directory
- `~` = home folder, like `/Users/yourusernamehere`
- `.` = current folder
- `..` = parent folder
- use the tab key to auto-complete!
- `rm` = remove
  - `rm -r foldername` = remove `foldername` and `-r`ecursively inside it too
  - `rm -rf foldername` = do that, but `-f`orce remove regardless of permissions
- `man somecommand` = show a printout of the `man`ual for somecommand
  - hit `q` to `q`uit (arrow keys to scroll)
- `ping 8.8.8.8` = continuously check latency against IP address 8.8.8.8 (Google's DNS server), which can be used to continuously check if the server is online (`Ctrl`+`c` or `Ctrl`+`d` to stop)
- `-` = "previous"
  - `cd -` = toggle to previous folder
  - `git checkout -` = toggle to previously-checked-out branch
- `alias hi='echo "Hello world!"'`
  - now you can just do `hi` to get a printout of `Hello world!`
- `command1 && command2` = do command1 and then to command2
- stuck in Vi/Vim? `Ctrl`+`c` won't work! hit `Escape` -> `:` -> `q!` -> `Enter`
- common web dev tasks: <https://www.joshwcomeau.com/javascript/terminal-for-js-devs/#common-development-tasks>
  - reinstall dependencies: `rm -rf node_modules; npm install;`

## more to learn for unix

- <https://www.tutorialspoint.com/unix/unix-special-variables.htm>
- <https://www.tutorialspoint.com/unix/unix-using-arrays.htm>
- <https://www.tutorialspoint.com/unix/unix-basic-operators.htm>
- <https://www.tutorialspoint.com/unix/unix-decision-making.htm>
- <https://www.tutorialspoint.com/unix/unix-shell-loops.htm>
- <https://www.tutorialspoint.com/unix/unix-quoting-mechanisms.htm> for getting variables and special characters parsed or not parsed in strings
- <https://www.tutorialspoint.com/unix/unix-io-redirections.htm> - there's more to it than just > file
- <https://www.tutorialspoint.com/unix/unix-shell-functions.htm>
- <https://www.tutorialspoint.com/unix/unix-manpage-help.htm>
- <https://www.tutorialspoint.com/unix/unix-useful-commands.htm>

## 5 linux command tricks from fireship.io

<https://www.youtube.com/shorts/fwBIZRq-vzY>

- `mkdir`, but with multiple sibling folders at the same time:
  - `mkdir folder` then:

    ```sh
    mkdir -p folder/{sibling1,sibling2}/{commonA,b,c}
    ```

  - gives you this:

    ```txt
    /folder
      /sibling1
        /commonA
        /b
        /c
      /sibling2
        /commonA
        /b
        /c
    ```

- `cd`, but back to where you last were instead of `cd ..` a bunch of times:
  - `cd ./somewhere/deeply/nested` then to get back to `./`:

    ```sh
    cd -
    ```

- `touch`, but create a bunch of files with names with a pattern:

  - ```sh
    touch file{1..10}.txt
    ```

    =

    ```txt
    file1.txt
    file2.txt
    file3.txt
    file4.txt
    file5.txt
    file6.txt
    file7.txt
    file8.txt
    file9.txt
    file10.txt
    ```

  - (note: the one-liner command doesn't pad with 0s on my machine despite `{01..10}`)
  - two 0-padding alternatives that worked for me: (`%02g` = zero-padding of width 2 of general number format)

    - ```sh
      touch $(seq -f "file%02g.txt" 1 10)
      ```

    - or this: (the space after `txt` matters for this one!)

      ```sh
      touch $(printf "file%02g.txt " {1..10})`
      ```

- `tail err.log` to read a file, but `tail -f err.log` to "follow" changes
  - (note: doesn't seem to print out the right contents if i edit in another tab with `nano`)
- `history`, but to get the last 5 commands:

  - ```sh
    history 5
    ```
