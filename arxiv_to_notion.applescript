set clipboardText to (the clipboard as text)
set myCommand to "cd ~/projects/notion-scholar; conda activate ns; python get_arxiv.py " & quoted form of clipboardText & "; ns run"
set shellCommand to "export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Users/ivanlee/miniconda3/envs/ns/bin:/Users/ivanlee/miniconda3/condabin:/opt/homebrew/bin:/opt/homebrew/sbin; " & myCommand
do shell script shellCommand
