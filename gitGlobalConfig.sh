#!/bin/bash

git config --global alias.st status
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.who "shortlog -s --"
git config --global alias.lg 'log --oneline --format="%h  %Cblue%an%Creset  %Cgreen%ad%Creset  %s"'

git config --global color.ui auto

git config --global user.name "Wojciech Sznapka"
git config --global user.email wojciech@sznapka.pl
