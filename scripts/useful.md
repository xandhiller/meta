`nmcli c show --active`

`sed -i 's/old-text/new-text/g' input.txt`

`sed -i '1iI am a new line at the top of the file' file.txt`

Rebooting the wifi: 
`nmcli networking off`
`nmcli networking on`

Search through pdfs in a directory.
```for f in pdf_directory; do echo $f; pdftotext $f - | grep -i "search_term"; done```

Zipping file(s): `zip -r filename.zip folder1 folder2`

Grep recursively for a term in a directory: `grep -r "search term" .`

Unzipping tar file: `tar xvzf file.tar.gz -C /path/to/somedirectory`

    A note on the argument `xvzf`:
        * `x`: This option tells tar to extract the files.
        * `v`: The “v” stands for “verbose.” This option will list all of the files one by one in the archive.
        * `z`: The z option is very important and tells the tar command to uncompress the file (gzip).
        * `f`: This options tells tar that you are going to give it a file name to work with.
