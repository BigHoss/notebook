---
id: FwhvRnRpOGNMqgcyMOXkq
title: Git
desc: ''
updated: 1640939005743
created: 1640939002383
---
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

### Prune
```git
git gc --prune=now
```


## Git Behind a Proxy and self-signed certificate

[Article by Mike Kaufmann](https://writeabout.net/2017/02/03/git-for-windows-with-tfs-and-ssl-behind-a-proxy/)


## Restore deletes stash
run in pwsh
```pwsh
gitk --all $(git fsck --no-reflog | Select-String "(dangling commit )(.*)" | %{ $_.Line.Split(' ')[2] })
```

