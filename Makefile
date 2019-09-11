ifndef SNAP_ROOT
$(info You have specified a wrong $$SNAP_ROOT.)
$(error Please make sure that $$SNAP_ROOT is set up correctly.)
endif

ifndef METAL_ROOT
$(info You have specified a wrong $$METAL_ROOT.)
$(error Please make sure that $$METAL_ROOT is set up correctly.)
endif

export IMAGE_JSON        = $(PWD)/image.json
export IMAGE_TARGET      = $(PWD)/image_compiled.json
export METAL_TARGET     ?= SNAP_WEBPACK_SIM

snap_targets = snap_config clean clean_config hw_project model image help

all: help

clean: clean_operator

clean_operator:
	@make -C ./colorfilter -s clean

$(IMAGE_JSON):
	@echo '{ "target": "$(METAL_TARGET)", "stream_bytes": 8, "operators": { "colorfilter": { "source": "./colorfilter" } } }' > $@

$(snap_targets): $(IMAGE_JSON)
	@make -C $(SNAP_ROOT) -s $@

sim:
	@$(METAL_ROOT)/targets/$(METAL_TARGET)/sim
