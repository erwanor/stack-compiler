Inductive natlist : Type :=
	| nil : natlist
	| cons : nat -> natlist -> natlist.

Inductive source_expr : Type :=
	| n : source_expr
	| expr : source_expr -> source_expr -> source_expr.

Inductive instr : Type :=
	| pop : instr
	| push : nat -> instr.

Inductive instrlist : Type :=
	| empty : instrlist
	| build : instr -> instrlist -> instrlist.

Definition pop_stack (s : natlist) : natlist :=
	match s with
		| nil => nil
		| cons h (cons h' t) => cons (h + h') t
		| _ => s
end.

