STOW := stow
TARGET := ~

ALL_PACKAGES := alacritty bash bin git kube music prettier talos tmux vim
WORK_PACKAGES := alacritty bash bin git kube prettier tmux vim

.PHONY: stow-all stow-work unstow-all unstow-work

stow-all:
	$(STOW) -t $(TARGET) $(ALL_PACKAGES)

stow-work:
	$(STOW) -t $(TARGET) $(WORK_PACKAGES)

unstow-all:
	$(STOW) -D -t $(TARGET) $(ALL_PACKAGES)

unstow-work:
	$(STOW) -D -t $(TARGET) $(WORK_PACKAGES)
