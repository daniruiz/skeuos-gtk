SUBDIRS=$(foreach SUBDIR,gtk2 gtk3 xfwm4,assets-renderer/$(SUBDIR)) sass

.PHONY: build $(SUBDIRS) clean

build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ build

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
