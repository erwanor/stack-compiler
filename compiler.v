Inductive instr : Type :=
	| pop : instr
	| push : nat -> instr.
