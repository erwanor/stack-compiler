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

Fixpoint execute (lst : instrlist) (stack : natlist) : natlist :=
	match lst with
		| empty => stack 
		| build h t => match h with
			| (push n') => execute t (cons n' stack)
			| pop => execute t (pop_stack stack)
		end
end.

Example test_execute1 : execute (build (push 5) empty) nil = cons 5 nil.
Proof. reflexivity. Qed.

Example test_execute2 : execute (build (push 5) (build (push 3) (build pop empty))) nil = cons 8 nil.
Proof. reflexivity. Qed.

Example test_execute3 : execute (build pop empty) (cons 1 (cons 2 nil)) = cons 3 nil.
Proof. reflexivity. Qed.
