// science formats a result as _ times 10^_
#let sfmt(x, number_of_digit : none) = {
  assert(type(x) in ("integer","float") )
  let number_is_unit(x) = {
    x < 10 and x >= 1 
  }
  let pow = ""
  let operation = if x >= 10 {
    i => i/10
  }
  else if x < 1 {
    i => i * 10
    pow = "-"
  }
  else {
    [$#x times 10^(0)$ ]
  }
  let i=0
  while not number_is_unit(x) {
    i += 1
    x = operation(x)
  }
  if number_of_digit != none {
    assert(type(number_of_digit) == "integer")
    x = float(x)
    x = str(x).split(".")
    let x1 = x.at(0)
    let x2 = x.at(1)
    x = x1 + "."
    for k in range(number_of_digit) {
      x += x2.at(k)
    }
  }
  [$#x times 10^(#pow #i)$ ]
}


// #sfmt(1,number_of_digit : 0) // error for now
