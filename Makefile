# Makefile for watch-notes
# Author: Jaeho Shin <netj@sparcs.org>
# Created: 2013-11-03

watch-notes: watch-notes.m
	clang -o $@ $^ -framework foundation

clean:
	rm -f watch-notes
.PHONY: clean
