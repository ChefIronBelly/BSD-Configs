#!/bin/sh

if [ -d "$HOME/Source/OOTB-defaults" ]; then
cd $HOME/Source/OOTB-defaults && echo "[Updating] Out of the Box ..." && git pull
fi
if [ -d "$HOME/Source/BSD-Configs" ]; then
cd $HOME/Source/BSD-Configs && echo "[Updating] BSD-Configs ..." && git pull
fi
if [ -d "$HOME/Source/core" ]; then
cd $HOME/Source/core && echo "[Updating] wmutils core ..." && git pull 
fi
if [ -d "$HOME/Source/opt" ]; then
cd $HOME/Source/opt && echo "[Updating] wmutils opt ..." && git pull
fi
if [ -d "$HOME/Source/libwm" ]; then
cd $HOME/Source/libwm && echo "[Updating] wmutils lib ..." && git pull
fi
if [ -d "/Source/x11fs " ]; then
cd $HOME/Source/x11fs && echo "[Updating] x11fs ..." && git pull 
fi
if [ -d "$HOME/Source/bar" ]; then
cd $HOME/Source/bar && echo "[Updating] lemonbar ..." && git pull 
fi
if [ -d "$HOME/Source/sxhkd" ]; then
cd $HOME/Source/sxhkd && echo "[Updating] shxkd ..." && git pull
fi 
if [ -d "$HOME/Source/Base" ]; then
cd $HOME/Source/Base && echo "[Updating] Pur Linux base ..." && git pull
fi
echo "[All] githubs updated ..."
