#
#Copyright (C) 2024  tete
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.
#


BUILD_DIR := build
# Directories containing source files
SRC_DIR = src
SRC_DIRS += $(SRC_DIR) $(wildcard $(SRC_DIR)/**)

SRC_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.*))

AS = pasmo

NAME = zsys_ctl
ROM = ${NAME}.bin
PRE_ROM = ${NAME}.pram.bin
FIXED_RAM_IMG = ${NAME}.fixed.bin

all: rom

default: rom
rom: ${ROM}

clean:
	rm -r ${ROM} ${FIXED_RAM_IMG} ${PRE_ROM} ${PRE_ROM}.sym  out.asm 

out.asm:
	bash ./makebigasm ${SRC_FILES}

$(PRE_ROM): out.asm
	${AS} -I ./src --bin out.asm ${PRE_ROM} ${PRE_ROM}.sym

$(FIXED_RAM_IMG): $(PRE_ROM)
	dd skip=512B if=${PRE_ROM} of=${FIXED_RAM_IMG} &> /dev/null

$(ROM): ${FIXED_RAM_IMG}
	${AS} -I . --bin z80_bootloader.asm ${ROM} zbootloader.sym
