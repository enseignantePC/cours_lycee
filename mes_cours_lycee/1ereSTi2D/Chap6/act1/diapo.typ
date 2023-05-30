#import "slides.typ" : *

#show: slides.with(
    authors: "Mme Cercy",
    short-authors: "Mme Cercy",
    title: [Chapitre 6 -- activité 1: Correction],
    short-title: "correction activité 1",
    date: "Avril 2023"
)

#new-section(" ")

#slide(title: "Question 1 et 2")[

    #one-by-one(
        [Q1: Dans le SI, une distance s'exprime et mètre et un temps en seconde.],
        [Q2: On se place dans le référentiel terrestre.])
]

#slide(title: "Question 3")[
    #set align(center)
    On mesure dans les deux cas\ $G_1G_11 = 10 c m times "echelle"= 1m$\ 
    et le temps écoulé
    \ $Delta t = 10 times 40 m s = 0.4"sec"$\
    Donc \ #v(.5pt)$v_"moy" = (G_1G_11)/(Delta t) = 2.5 m.s^(-1)$\  #h(1pt)

]

#slide(title: "Question 4",align(center)[
    Enregistrement 1 : \ \
    $v_(G 2) &= (G_2G_3)/(Delta t) 
    &= v_(G 6) &= (G_6G_7)/(Delta t)
    &= (0.1m)/(4 times 10^(-2)) &= 2.5 10^(-2) space m slash s $ 
])

#slide(title : "",align(center)[
    Enregistrement 2 : \
    On a $G_2G_3 = 5c m$ et $G_6G_7 = 10c m$ \ \
    $v_(G 2) = (G_2G_3)/(Delta t) = 2.5 10^(-2) space m slash s \
    v_(G 6) = (G_6G_7)/(Delta t) = 5 10^(-2) space m slash s$
    #h(1pt)
])

#slide(title : "Question 5",align(center)[
  Pour calculer $a_(G 3)$ il faut $v_(G 3)$ et $v_(G 4)$ donc $v_("G3") = (G_3G_4)/(Delta t)$\

  *Enregistrement 1*: $v_G_3 = v_G_4 = 2.5 10^(-2) m.s^(-1)$

  $a_G_3 = (v_G_4 - v_G_3)/(Delta t) = 0$
  
  *Enregistrement 2*: 
  - $v_G_3 = (0.4 "cm" )/(40 "ms") = 0.1 m.s^(-1) $ 
  - $v_G_4 = (0.5 "cm" )/(40 "ms") = 0.125 m.s^(-1)$
  donc $a_G_3 = (v_G_4 - v_G_3)/(Delta t) = 0.025/(4 times 10^(-3)) = 0.625 m.s^(-2)$

  ])