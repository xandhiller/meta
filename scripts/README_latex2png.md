# Steps:
1. Write LaTeX in scratchpad. 
2. Generate pdf with LaTeX image.
3. Run convert to take: PDF -> PNG.
4. Copy PNG to clipboard. -- requires `pbcopy`

# Solution
1. Make script that when passed a `*.tex` file it will run the above.
2. Change `$VIMRC` so that this is run whenever you finish writing a certain file.
3. Make a nice alias 

