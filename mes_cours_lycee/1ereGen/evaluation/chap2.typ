#import "eval.typ" : eval, title, question

#set text("Caladea",12pt, fallback: true, slashed-zero: true)


#let headercontent = [
  Classe: ..................... #h(1fr) 
  Nom et Prénom: ...................................................
]

#let blackrect = rect(fill : black, height: 0.9em)

#set page(
  "a4", 
  margin: ( top : 1.5cm,    bottom : 1.35cm,    rest : 1cm),
  header : i => if i == 1 {align(horizon + left, headercontent)}, 
  footer: i => align(horizon + right,
    text(8pt, [#i])
  ))

#title([Évaluation chapitre 2])

#align(center)[
    Rappels \ #v(-5pt) #table(
    columns: (1fr,1fr,1fr),
    align: center + horizon ,
    inset: 10pt,
    [*Loi de Wien*],[*Formule de la vitesse*], [*Formule de la puissance*],
    text(20pt)[$lambda_max = (2.9 times 10^(-3))/T$]
    + [
      
      où $lambda$ est en mètre et $T$ en Kelvin]
    ,
    text(20pt)[$v = d/t$],
    text(20pt)[$P = E/t$]  
    + [
      
      où $P$ est en Watt et $E$ en Joule et $t$ en seconde.]
    
  )]



#eval(
  question[
    *Écrire* les équations de réaction des réactions suivantes:
    ],
  question[A second question], 
  [
    Some fair content
  ],
  question(point : 2)[A last question],
  question[
    *Indiquer* lesquelles sont des réactions de fusions? de fission?
  ],
  question[
     *Expliquer* la différence entre réaction nucléaire de fission et de fusion.
  ],
  question[
     *Exprimer* combien de protons et neutrons composent les atomes suivants : 
  ], 
  question[
     Sachant que le Soleil a une puissance totale de $P = #blackrect "Watt"$ , et que sa puissance par surface est de $P_"surface" = 1368 " " W.m^(-1)$. 
    
     *Déterminer* la surface du soleil (résultat attendu en m²).
  ], 
  question[
     Sachant que la formule pour déterminer la surface d'une sphère est $S = 4 pi R^2$ où R est le rayon de la sphère.
  
    *Déterminer* l'expression littérale du rayon du Soleil.
  ],
  question[
    *Déterminer* la valeur du rayon du soleil en $m^2$ en supposant que sa surface est de #blackrect $m^2$ #h(20pt)
  ], 
  question[  
    *Déterminer* l'énergie que le soleil émet en 1 minute], 
    question[
      En supposant que cette énergie est de $E = #blackrect$,
    *Déterminer* la masse que le soleil perd en une minute.  
      On rappelle la formule d'Einstein : $E = m c^2$. 

  ],
  question[
    Sachant que la masse du soleil est de m = #blackrect, 
    Si le soleil perd toujours sa masse à la même vitesse, *Déterminer*
    combien de temps il faut attendre pour que la masse du soleil s'épuise.
    Il faudra *expliquer* le raisonnement et *exprimer* le résultat en années.
  ]
  
)



