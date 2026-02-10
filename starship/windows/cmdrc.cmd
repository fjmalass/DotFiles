@echo off
:: This initializes starship in CMD
FOR /F "tokens=*" %%i IN ('starship init cmd') DO %%i

:: Add your aliases here to match your Zsh setup
doskey v=nvim $*
doskey m=makers $*
doskey ls=lsd $*
