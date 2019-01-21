TAGS = 0.5 master

.PHONY: TAGS $(TAGS)

TAGS: $(TAGS)

$(TAGS):
	docker build -t pymor/demo:$@ $@

all: TAGS
