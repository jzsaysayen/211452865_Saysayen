@echo off
rem Open five websites
start "" "https://www.google.com"
start "" "https://www.facebook.com"
start "" "https://www.youtube.com"
start "" "https://www.reddit.com"
start "" "https://www.linkedin.com"

rem Launch calculator
start calc

rem Launch notepad
start notepad

rem Wait for 15 seconds before initiating shutdown
timeout /t 15

rem Initiate system shutdown after 30 seconds
shutdown /s /t 30