@echo off
:Start
"C:\Users\jubs1\Desktop\Wings Server\wings\topaz_game_64_d.exe" --ip 68.72.135.111 --port 54247
:: Wait 30 seconds before restarting.
TIMEOUT /T 30
GOTO:Start