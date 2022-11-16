saa716x_core-objs	:= saa716x_pci.o	\
			   saa716x_i2c.o	\
			   saa716x_cgu.o	\
			   saa716x_dma.o	\
			   saa716x_vip.o	\
			   saa716x_boot.o	\
			   saa716x_fgpi.o	\
			   saa716x_adap.o	\
			   saa716x_gpio.o

saa716x_ff-objs		:= saa716x_ff_main.o	\
			   saa716x_ff_cmd.o	\
			   saa716x_ff_ir.o	\
			   saa716x_ff_phi.o

obj-m	  += saa716x_core.o
obj-m  += saa716x_budget.o
obj-m  += saa716x_hybrid.o
obj-m	  += saa716x_ff.o

ccflags-y += -Idrivers/media/dvb-frontends/
ccflags-y += -Idrivers/media/tuners

KVERSION := $(shell uname -r)

modules:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

clean:
	$(MAKE) -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
