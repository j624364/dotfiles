PACMANCMD=sudo pacman --needed -Sy
YAYCMD=yay --needed -Sy

YAYPACKAGES=$(tr '\n' ' ' < yay-packages)
PACMANPACKAGES=$(tr '\n' ' ' < pacman-packages)

.PHONY: all install-pacman install-yay

all: install-pacman install-yay
	stow .

install-pacman:
	@echo "pacman packages: " $(PACMANPACKAGES)

install-yay:
	@echo "yay packages: " $(YAYPACKAGES)

