# Learning Bash Scripts

Just one of the things I'm learning. <https://github.com/hchiam/learning>

To enable running a script upon click, you need to edit permissions. For example, for `chrome-incognito-shortcut.app`:

```bash
chmod 744 chrome-incognito-shortcut.app
```

## Related Repos

<https://github.com/hchiam/learning-powershell>

<https://github.com/hchiam/learning-dependency-cruiser>

<https://github.com/hchiam/learning-https-server>

## Useful `git` commands

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

### How to revert changes of a git push:

This shows the commit hash: (looks like `l0ngStr1ng0fL3t7er5AndNum83rz`)

```bash
git log
```

then use the hash of the commit you want to revert: (and when you're in the in-CLI editor, type `:qa` and then hit Enter)

```bash
git revert l0ngStr1ng0fL3t7er5AndNum83rz
```

## Random Notes

Get file info like edit date: `stat filename`

Example of script used by Travis CI `npm run build` to copy files to `/public` folder: [copy-to-public-folder.sh](https://github.com/hchiam/hchiam.github.io/blob/master/copy-to-public-folder.sh)

Example of script used to generate and insert a package SemVer number for a JS file: [package.sh](https://github.com/hchiam/_2DNote/blob/master/package.sh)

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
