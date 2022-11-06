and.o: and.s
	as -g and.s -o and.o
or.o: or.s
	as -g or.s -o or.o
sum.o: sum.s
	as -g sum.s -o sum.o
upper.o: upper.s
	as -g upper.s -o upper.o
calc.o: calc.s
	as -g calc.s -o calc.o
basic_cmds.o: data/basic_cmds.s
	as -g data/basic_cmds.s -o basic_cmds.o
calc_basic: calc.o and.o or.o sum.o upper.o data/basic_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/basic_cmds.o -o calc_basic
easy_cmds.o: data/easy_cmds.s
	as -g data/easy_cmds.s -o easy_cmds.o
calc_easy: calc.o and.o or.o sum.o upper.o data/easy_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/easy_cmds.o -o calc_easy
simpleone_cmds.o: data/simpleone_cmds.s
	as -g data/simpleone_cmds.s -o simpleone_cmds.o
calc_simpleone: calc.o and.o or.o sum.o upper.o data/simpleone_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/simpleone_cmds.o -o calc_simpleone
upperonly_cmds.o: data/upperonly_cmds.s
	as -g data/upperonly_cmds.s -o upperonly_cmds.o
calc_upperonly: calc.o and.o or.o sum.o upper.o data/upperonly_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/upperonly_cmds.o -o calc_upperonly
basicwithupper_cmds.o: data/basicwithupper_cmds.s
	as -g data/basicwithupper_cmds.s -o basicwithupper_cmds.o
calc_basicwithupper: calc.o and.o or.o sum.o upper.o data/basicwithupper_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/basicwithupper_cmds.o -o calc_basicwithupper
simplerandom_cmds.o: data/simplerandom_cmds.s
	as -g data/simplerandom_cmds.s -o simplerandom_cmds.o
calc_simplerandom: calc.o and.o or.o sum.o upper.o data/simplerandom_cmds.o
	ld -g calc.o and.o or.o sum.o upper.o data/simplerandom_cmds.o -o calc_simplerandom

