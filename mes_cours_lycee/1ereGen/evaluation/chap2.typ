#set text("Colibri")
#set text(12pt)

#let pointarr = ()
#let textarr = ()

#let q(point,pa, ta,body) = {
  pa.push(point)
  ta.push([Question ] + [#pa.len()) ] + body)
  return (ta,pa)
}


On rapelle la loi de Wien, la formule de la vitesse et la formule de la puissance

#let x = q(1,pointarr,textarr)[Écrire les équations de réaction des réactions suivantes:]
#let pointarr = x.at(1);#let textarr = x.at(0);#let x = none

#let x = q(1,pointarr,textarr)[Lesquelles sont des réactions de fusions? de fission?]
#let pointarr = x.at(1);#let textarr = x.at(0);#let x = none

#let x = q(1,pointarr,textarr)[Expliquer la différence entre:]
#let pointarr = x.at(1);#let textarr = x.at(0);#let x = none


#let x = q(1,pointarr,textarr)[some question]
#let pointarr = x.at(1);#let textarr = x.at(0);#let x = none


#let x = q(2,pointarr,textarr)[some question]
#let pointarr = x.at(1)
#let textarr = x.at(0)
#let x = none


#let x = q(2,pointarr,textarr)[some question]
#let pointarr = x.at(1)
#let textarr = x.at(0)
#let x = none

#textarr.join([\ ])

#set align(center)
#table(
  [Questions ], ..range(pointarr.len()).map(i => [#{i+1}]),[Total], //numéro de la question
  [Points], ..pointarr.map(x => [#x]), [#pointarr.fold(0, (i,j)=> i + j )],
  [Score], ..pointarr.map(i => []), [], // score à avoir

 columns: range(pointarr.len() + 2).map(i => auto),
  inset : 10pt,
  align : center  + horizon
)
  

