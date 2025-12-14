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

## Shift Operators

- Logical Shift
  - <<, >>
  - the same as multiplication and division by powers of 2

- Arithmetic Shift
  - <<<, >>>
  - preserves the sign bit (MSB) when right shifts are performed (2's complement numbers)
  - Left shift is identical to logical left shift
  
## Relational Operators

- Greater Than >
- Greater Than or Equal >=
- Less Than <
- Less Than or Equal <=
- Ex: C = A < B
  - The result of C is 1 bit
  - C = 0 if false
  - C = 1 if true
  - C = 1'bX if A or B have Z or X bits

## Equality Operators

- Logical Equality
  - == and !=
  - used for design
  - If logical equality operators get variables with Z (high-impedance) or X (unknown) values, then the result can be unknown.
- Case Equality
  - === and !==
  - used for testbench
  - case equality operators always return 0 or 1 (definite boolean result)
  
## Conditional Operator

- AKA as a **ternary operator**
- **Ternary Operator:** takes in 3 operands and retuns a result
  - synthesizes to a mux
- **Result = (Operand_Expression) ? Operand_True : Operand_False**
  - Like an *if* statement
  - C = condition ? B : A
    - "C equals B otherwise equals A"

## Concatenation Operator

- Concatenation {} = JOIN bits from different vectors to form a new vector
- Used to manipulate bit fields to create new values
- Can be used in LHS / RHS
- a[5:0] = {b[3:0], c[1:0]}

## Replication Operator

- Replication {{}} = concatenation performed a fixed number of times
- Syntax: {number_times{some_binary_value}}
- **number_times** must be a constant
- {num_times{**value**}} replicates **value** for num_times
- a[5:0] = {3{b[1:0]}} means a[5:0] = {b[1:0], b[1:0], b[1:0]}

## Operators Precedence

- Just look up the table
