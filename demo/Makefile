TAGS = 0.5 master 2019.2rc0

.PHONY: TAGS $(TAGS)

TAGS: $(TAGS)

$(TAGS):
	docker build -t pymor/demo:$@ $@

all: TAGS
