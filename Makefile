STOW := stow
TARGET := ~

ALL_PACKAGES := alacritty bash bin git music prettier tmux vim
WORK_PACKAGES := alacritty bash bin git prettier tmux vim

.PHONY: stow-all stow-work unstow-all unstow-work gnome-backup gnome-restore

stow-all:
	$(STOW) -t $(TARGET) $(ALL_PACKAGES)

stow-work:
	$(STOW) -t $(TARGET) $(WORK_PACKAGES)

unstow-all:
	$(STOW) -D -t $(TARGET) $(ALL_PACKAGES)

unstow-work:
	$(STOW) -D -t $(TARGET) $(WORK_PACKAGES)

gnome-backup:
	./scripts/backup-gnome.sh

gnome-restore:
	./scripts/restore-gnome.sh
