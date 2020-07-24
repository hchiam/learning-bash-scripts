# Learning Bash Scripts

Just one of the things I'm learning. <https://github.com/hchiam/learning>

To enable running a script upon click, you need to edit permissions. For example, for `chrome-incognito-shortcut.app`:

```bash
chmod 744 chrome-incognito-shortcut.app
```

## Related Repos

<https://github.com/hchiam/learning-powershell>

<https://github.com/hchiam/learning-dependency-cruiser>

## Useful `git` commands

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

Example of script used by Travis CI `npm run build` to copy files to `/public` folder: [copy-to-public-folder.sh](https://github.com/hchiam/hchiam.github.io/blob/master/copy-to-public-folder.sh)

### Get list of globally installed packages

`npm list -g --depth 0`

`yarn global list`
