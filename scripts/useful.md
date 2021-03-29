`nmcli c show --active`

`sed -i 's/old-text/new-text/g' input.txt`

`sed -i '1iI am a new line at the top of the file' file.txt`

Rebooting the wifi: 
`nmcli networking off`
`nmcli networking on`

Search through pdfs in a directory.
```
for f in pdf_directory; do echo $f; pdftotext $f - | grep -i "search_term"; done
```

Zipping file(s): `zip -r filename.zip folder1 folder2`

Grep recursively for a term in a directory: `grep -r "search term" .`

Unzipping tar file: `tar xvzf file.tar.gz -C /path/to/somedirectory`

A note on the argument `xvzf`:
    * `x`: This option tells tar to extract the files.
    * `v`: The “v” stands for “verbose.” This option will list all of the files one by one in the archive.
    * `z`: The z option is very important and tells the tar command to uncompress the file (gzip).
    * `f`: This options tells tar that you are going to give it a file name to work with.

----

## On vim-markdown

Folding is enabled for headers by default.

The following commands are useful to open and close folds:

`zr`: reduces fold level throughout the buffer
`zR`: opens all folds
`zm`: increases fold level throughout the buffer
`zM`: folds everything all the way
`za`: open a fold your cursor is on
`zA`: open a fold your cursor is on recursively
`zc`: close a fold your cursor is on
`zC`: close a fold your cursor is on recursively
Options are available to disable folding or change folding style.

Try `:help fold-expr` and `:help fold-commands` for details.

----

## Regarding `ssh` on the command-line:

If you want to pull via `ssh`, the format for any `github` repos is:

```sh
git@github.com:user/repo.git
```
 
as opposed to some HTTPS link: `https://github.com/user/repo.git`.
