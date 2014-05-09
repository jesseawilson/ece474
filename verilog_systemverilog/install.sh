#!/bin/sh

if [ ! -d "$HOME/.vim" ]
then
	echo "Creating .vim directory"
	mkdir $HOME/.vim
else
	echo ".vim directory exists"
fi

if [ ! -d "$HOME/.vim/ftdetect" ]
then
	echo "Creating ftdetect directory"
	mkdir $HOME/.vim/ftdetect
else
	echo "Ftdetect directory exists"
fi

if [ ! -d "$HOME/.vim/syntax" ]
then
	echo "Creating syntax directory"
	mkdir $HOME/.vim/syntax
else
	echo "Syntax directory exists"
fi

if [ ! -d "$HOME/.vim/indent" ]
then
	echo "Creating indent directory"
	mkdir $HOME/.vim/indent
else
	echo "Indent directory exists"
fi

echo "cp ftdetect/verilog_systemverilog.vim $HOME/.vim/ftdetect"
cp ftdetect/verilog_systemverilog.vim $HOME/.vim/ftdetect
echo "cp syntax/verilog_systemverilog.vim $HOME/.vim/syntax"
cp syntax/verilog_systemverilog.vim $HOME/.vim/syntax
echo "cp indent/* $HOME/.vim/indent"
cp indent/* $HOME/.vim/indent
