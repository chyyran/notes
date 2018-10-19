# `inodes` and filesystem directory entries.

* A `dirent` links a filename to an `inode`

## Permissions

User permissions are the first byte of the permissions `-xxx------`. Thence the next three permissions are the **group** permissions `----xxx---`, and the final **other** permissions are `-------xxx`.


- File Permissions
  - Read, write execute.
- Directory permission
  - R: Can run `ls` on the directory/list files on the directory.
  - W: Can write and delete files in the directory
  - X: **Allows access to child dirents**

## chmod

**chmod** `[u/g/o] (+/-) (rwx)`, or using the octal notation

- 4 to read
- 2 to write
- 1 to execute.

rw-rw-r-- => 664

## Glob
`*` matches any number of any character
`?` matches any single one character
`[X]` where `X` is a list of characters.