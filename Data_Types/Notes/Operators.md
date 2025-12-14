# Operators

## Operator Types

- Bit-wise: ~ & | ^ ~^
- Reduction: & ~& | ~| ^ ~^ ^~
- Logical: ! && ||
- Arithmetic: ** * / % + -
- Shift: << >> <<< >>>
- Relational: < > <= >=
- Equality: == != === !==
- Conditional: ?:
- Concatenation: {}
- Replication: {{}}

## Bit-wise Operators

- Perform bit-by-bit logic operations between two inputs
- Can operator on either scalar (single bit) or vector (multi-bit)

## Reduction Operators

- Bitwise oepration between the operatond from the RHS (vector)
- The destination is a 1bit value from the LHS

## Logical Operators

- The operands are interpreted as TRUE(1'b1), FALSE (1'b0), or UNKNOWN (1'bx)
  - any nonzero value is interpreted as TRUE = 1'b1 on RHS
- The destination is a 1bit value (1/0/X) from the LHS
- They behave differently for vectors and 1bit operations
- Imporant Notes
  - Use inside if() and while() statements as a logical condition
  - DO NOT USE inside **procedures** because it could lead to undesired behavior (industry practice)

## Arithmetic Operators

- In Order of Precedence
  - ** (exponentiation)
  - \* (product)
  - / (division)
  - % (modulo)
  - \+ (sum)
  - \- (difference)
