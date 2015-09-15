# stack-compiler
A basic "stack" compiler in Coq.

### Semantics of the source language:

```
expr := expr + expr | n
```

where n is a natural number.

### Semantics of the target language:

```
S is a stack of natural numbers
```

There is two operations:
- `push n` which push a natural number `n` on the stack.
- `pop` which takes two natural numbers from the stack, sum then and then push the result to the stack.
