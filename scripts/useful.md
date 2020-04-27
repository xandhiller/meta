nmcli c show --active

sed -i 's/old-text/new-text/g' input.txt

sed -i '1iI am a new line at the top of the file' file.txt

Rebooting the wifi:
`nmcli networking off`
`nmcli networking on`

Search through pdfs in a directory.
`for f in pdf_directory; do echo $f; pdftotext $f - | grep -i "search_term"; done`

Zipping file(s):
`zip -r filename.zip folder1 folder2`
