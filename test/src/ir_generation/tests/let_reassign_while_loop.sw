script;

fn main() -> bool {
    let mut a = true;
    while a {
        a = a && false;
    }
    a
}

// regex: VAL=v\d+
// regex: ID=[_a-zA-Z][_0-9a-zA-Z]*

// check: br $(while=$ID)

// check: $while:
// check: cbr $VAL, $(while_body=$ID), $(end_while=$ID)

// check: $while_body:
// check: cbr $VAL, $(block0=$ID), $(block1=$ID)

// check: $end_while:

// check: $block0:
// check: br $(block1=$ID)

// check: $block1:
// check: br $while