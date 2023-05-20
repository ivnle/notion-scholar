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


-- Step 3: run python script to call arxiv api
set clipboardText to (the clipboard as text)
tell application "Terminal"
	activate
	do script "python get_arxiv.py " & quoted form of clipboardText in front window
	delay 0.5 -- Delay to allow the environment activation to take effect
end tell


-- Step 5: Run `ns run`
tell application "Terminal"
	activate
	do script "ns run" in front window
end tell