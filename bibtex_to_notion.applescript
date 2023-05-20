-- Step 1: Change directory to projects/notion-scholar
tell application "Terminal"
	activate
	do script "cd ~/projects/notion-scholar" in front window
	delay 0.5 -- Delay to allow the directory change to take effect
end tell


-- Step 2: Activate conda environment
tell application "Terminal"
	activate
	do script "conda activate ns" in front window
	delay 0.5 -- Delay to allow the environment activation to take effect
end tell


-- Step 3: Get the currently copied text from the clipboard
set clipboardText to (the clipboard as text)
-- set clipboardText to (do shell script "pbpaste")
log clipboardText
-- log "hello"


-- Step 4: Append the text to a file called "notion.bib"
set filePath to POSIX path of (path to home folder) & "projects/notion-scholar/notion.bib"
-- set filePath to "notion.bib"
-- do shell script "chmod u+w " & quoted form of filePath
log filePath
-- do shell script "echo '' >> " & quoted form of filePath -- Append an empty line
do shell script "echo " & quoted form of clipboardText & " >> " & quoted form of filePath


-- Step 5: Run `ns run`
tell application "Terminal"
	activate
	do script "ns run" in front window
end tell