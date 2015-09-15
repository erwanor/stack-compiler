Inductive natlist : Type :=
	| nil : natlist
	| cons : nat -> natlist -> natlist.

Inductive source_expr : Type :=
	| n : source_expr
	| expr : source_expr -> source_expr -> source_expr.

Inductive instr : Type :=
	| pop : instr
	| push : nat -> instr.
