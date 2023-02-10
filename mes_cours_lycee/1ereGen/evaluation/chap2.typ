#import "eval.typ" : eval, title, question
#import "science.typ" : sfmt

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
  show_correction : true,
  question[
    *Écrire* les équations de réaction des réactions suivantes:
     #set align(center)
    #image("reac1.svg",height: 150pt) 
    #h(60pt)
    #image("reac2.svg",height: 150pt)
    ],
  question[
    *Indiquer* lesquelles sont des réactions de fusions? de fission? 
   
  ],
  question[
     *Expliquer* la différence entre réaction nucléaire de fission et de fusion.
  ],
  question[
     *Exprimer* combien de protons et neutrons composent les atomes suivants : 
  ], 
  question([
     Sachant que le Soleil a une puissance totale de $P = 3.845 times 10^(26) "Watt"$ , et que sa puissance par surface est de $P_"surface" = 1368 " " W.m^(-2)$. 
    
     *Déterminer* la surface du soleil (résultat attendu en m²).
     ],
     answer : [
       On a $P_"surface" = P/S$ donc $S = P/P_"surface" = 2.8 times 10^(23) " " m^2$
       //$#{3.845 / 1368 *1000}$
     ]), 
  question([
     Sachant que la formule pour déterminer la surface d'une sphère est $S = 4 pi R^2$ où R est le rayon de la sphère.
  
    *Déterminer* l'expression littérale du rayon du Soleil.
    ],
    answer : [On a $S = 4 pi R^2$ donc $R=sqrt(S/(4 pi)) = 4.7 times 10^12 " " m^2$
    //#{calc.sqrt(2.8/(4*calc.pi))}  
]
    ),
  question([
    *Déterminer* la valeur du rayon du soleil en $m^2$ en supposant que sa surface est de 
    $3 times 10^23 " " m^2$ #h(20pt)
    ],
     answer : [On a $S = 4 pi R^2$ donc $R=sqrt(S/(4 pi)) = 4.89 times 10^12 " " m^2$]), 
  question([  
    *Déterminer* l'énergie que le soleil émet en 1 minute],
    answer : [
      On a $P = E/t$ donc $E = P times t = 3.845 times 10^28 W times 60 s = 2.307 times 10^30 J$
      //#{sfmt(3.845 * 60)}$
    ]), 
  question([
    En supposant que cette énergie est de $E = 2.5 times 10^30 J$,
    *Déterminer* la masse que le soleil perd en une minute.  
    On rappelle $E = m c^2$. et $c = 3.00 times 10^8 " " m.s^(-1)$
  ],
  answer : [
    On a $m = E/c^2 = $
    $#sfmt(2.5/(3*3),number_of_digit : 2) times 10^30 / 10^16 = 2.77 times 10^#{30-17} " kg"$
    ]),
  question([
    Sachant que la masse du soleil est de m = $1.98 times 10^30 " kg"$, 
    Si le soleil perd toujours sa masse à la même vitesse et en supposant qu'il perd $ 3 times 10^13 " kg"$ en 1 minute, *Déterminer*
    combien de temps il faut attendre pour que la masse du soleil s'épuise.
    Il faudra *expliquer* le raisonnement et *exprimer* le résultat en années.
  ],
  answer : [
    On a  $t * "masse perdue" = "masse du soleil"$ donc $t = M_"S"/M_"perdue" = (1.98 times 10^30)/(3 times 10^13) = #sfmt(1.98/3, number_of_digit : 1) times 10^#{30-13} =6.6 times 10^16 "min"$ 
    
    On va diviser par 60 pour avoir des heures, par 24 pour avoir des jours et par 365 pour avoir des années :
    $t/(60 times 24 times 365 ) =1.26 times 10^11 "ans" $ //#sfmt(6.6/(60*24*365))
]
)
  
)




