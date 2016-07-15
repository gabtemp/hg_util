[![Build Status][travis-badge]][travis-link]

# hg_util

Mercurial (hg) utility functions for [fish]. Based on [git_util]

## Install

With [fisherman]

```
fisher gabtemp/hg_util
```

## Functions - Work in progress
| Plugin              | Build Status                                                               |
|---------------------|----------------------------------------------------------------------------|
| hg_branch_name      | Get the name of the current branch                                         |
| hg_is_empty         | Test if a repository is empty                                              |
| hg_is_repo          | Test if the current directory is a mercurial repository                    |
| hg_untracked_files  | Get the number of untracked files in a repository                          |
| hg_ahead            | Get a character that indicates if the current repo is in sync, ahead, behind or has diverged from its upstream. Default: '', '+', '-', '±'                           |
| hg_repository_root  | Get the root directory of the current repository                           |

[travis-link]: https://travis-ci.org/gabtemp/hg_util
[travis-badge]: https://img.shields.io/travis/gabtemp/hg_util.svg

[fisherman]: https://github.com/fisherman/fisherman
[git_util]: https://github.com/fisherman/git_util
[fish]: https://fishshell.com
