# Git stuff

### Cleanup all ignored files in repo
```git
git clean -f -d -X --dry-run >>cleanup.txt
```

### Submodule cleanup
```git
git submodule foreach git clean -xdf
```

### Rename local branch
```git
git branch -m <oldname> <newname>
```
for the active branch
```git
git branch -m <newname>
```
