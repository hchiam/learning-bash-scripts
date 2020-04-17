# Learning Bash Scripts

Just one of the things I'm learning. <https://github.com/hchiam/learning>

To enable running a script upon click, you need to edit permissions. For example, for `chrome-incognito-shortcut.app`:

```bash
chmod 744 chrome-incognito-shortcut.app
```

## Random Note

Example of script used by Travis CI `npm run build` to copy files to `/public` folder: [copy-to-public-folder.sh](https://github.com/hchiam/hchiam.github.io/blob/master/copy-to-public-folder.sh)

## Related Repos

<https://github.com/hchiam/learning-powershell>

<https://github.com/hchiam/learning-dependency-cruiser>

## Useful `git` commands

<https://www.smashingmagazine.com/make-life-easier-when-using-git/>

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
