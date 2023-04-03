#show heading.where(level: 1) : set align(center)
#show heading.where(level: 2): it => {align(center,it)
v(5pt)}

#set page(
    "a4",
    margin: 1.2cm
    )
#set text(
    font : "Caladea",
    fallback: false,
    size : 0.83em,
    hyphenate: true, 
    ligatures: true, 
    lang : "fr"
    )
#set par(justify: true)

= #text(size: 2em)[Exercice]
#h(1cm)

#let kmh = $"km"."h"^"-1"$
#let ms = $"m.s"^"-1"$
#let aide(x)=[_#{x}_]


#columns(2)[
== Simple conversions d'unités

#columns(2)[
1. Convertir les valeurs suivantes en #ms:
    - 50 #kmh = 
    - 90 #kmh = 
    - 130 #kmh = 
#colbreak()
2. Convertir les valeurs suivantes en #kmh:
    - 10 #ms =     
    - 5 #ms = 
    - 30 #ms = 
]



== Record de vitesse
Le nouveau record (2017) pour une voiture électrique est
d'accélérer de O à 100 #kmh! en 1,90 s.

Si on considère que l'accélération est constante, on peut modéliser l'équation horaire de la trajectoire de la voiture par l'équation 

$x(t) = 7,31 times t^2$.

+ Calculer l'accélération a de la voiture à partir des données du record.
+  Calculer la vitesse de la voiture au bout de 1 seconde.
+ Calculer l'accélération de la voiture à partir de l'équation horaire.
+ Au bout de combien de temps atteint-elle sa vitesse maximale de 402 #kmh?

#aide[
- Accélération moyenne: 
]

== Mouvements et référentiels

Un passager est assis dans un train À se déplaçant à 150 #kmh
+ Quelle serait la vitesse du passager
    + pour un observateur immobile sur le quai ?
    + pour un observateur assis dans le même wagon ?
    + pour un voyageur se déplaçant dans un train B circulant à 50 #kmh dans le même sens que le train A ?
    + pour un voyageur se déplaçant dans un train C circulant à 70 #kmh dans le sens opposé au train À ?
+ Le mouvement du passager dépend-il du choix du référentiel ?

== Caractérisation des mouvements.
+  Définir un mouvement de translation.
+ Parmi les exemples suivants, préciser si le mouvement de translation du solide est rectiligne, circulaire ou curviligne.
#align(center)[
#image(height: 90pt,"ex4-1.png")
#image(height: 90pt,"ex4-2.png")
//#image(height: 90pt,"ex4-3.png")
]
#colbreak()
== Vitesse en #ms et en #kmh.

+ Calculer la vitesse moyenne en #ms et en #kmh dans les cas suivants :
    + Une voiture parcourt 250 km en 3 h et 20 min.
    + Une fusée atteint 37 km d'altitude en 2,5 min.
    + Le TGV partant de Paris à 8 h 54 arrive à Lyon à 10 h 51 après avoir parcouru 450 km.

+ Déterminer la distance parcourue dans les cas suivants.
    + Une voiture lancée à 130 #kmh pendant une seconde, c'est-à-dire le temps de réaction d’un conducteur attentif.
    + Une télécabine qui met 13 min à 6 ms" pour effectuer son ascension.

== Chute d'une bille

#image("chute_libre.png")

== Chute d'une bille (Partie 2)


On lâche une bille, que l'on assimile à un point matériel, sans vitesse initiale, d'une hauteur $h =25,0 m$ parrapport au sol. L'équation de la position de la bille est donnée par la relation :

#align(center)[$x(t) = - 4,9 times t^2 + 25,0$]

dans le repère Ox dirigé vers le haut, où O est à la surface du sol.
+ Déterminer l'équation de la vitesse v(t).
+ Déterminer l'équation de l'accélération a(t).
+ Quelle est la position de la bille à t = 1,0 s ? Quelle sa vitesse à cet instant ?
+ À quel instant la bille touche-t-elle le sol ?
+ En déduire la vitesse de la bille à cet instant.



== Temps de freinage

Une voiture roulant à une vitesse constante de 108 #kmh freine brusquement. 
L'équation de sa trajectoire devient :
$x(t) = -2,5 times t^2 + 30 times t$. 
Son origine est le moment où le conducteur commence à freiner.

+ Quelle est la valeur de la décélération de la voiture ?
+ Combien de temps la voiture met-elle pour s'arrêter ?
+ Quelle distance la voiture parcourt-elle avant de s'arrêter ?

== Navire à quai
//
Du fait de sa taille, il est très difficile d'arrêter un navire.
Souvent ils doivent couper les moteurs plusieurs kilomètres avant le port.
Un navire de 260 000 t, avec une vitesse de 14,0 nœuds,
coupe les moteurs. Son accélération sera alors de
$a = - 0,0023 m.s^(-2)$?
La trajectoire du navire est modélisée par l'équation :

$x(t)= -0,00115 times t^2 + 720 times t$

À t=0s, le navire coupe les moteurs.
+ Pourquoi la valeur de l'accélération est négative ? Quelle en est l'origine ?
+ Quelle est la vitesse du navire en m-s"1?
+ Déterminer l'équation de la vitesse $v(t)$.
+ Combien de temps le navire met-il à s'arrêter ?
+ En déduire la distance du port à laquelle on doit couper les moteurs.

#aide[1 noeuds = 1.852#kmh]



== Parachutiste
Deux parachutistes tombent verticalement à partir du
point de largage de l'avion. 
Après une chute de 20s , ils
atteignent leur vitesse limite de 220 #kmh et sont situés sur la même verticale, à 50 m l’un de l’autre. Ils n'ont pas sauté en même temps.

+ Quelles sont les caractéristiques des mouvements de chacun des parachutistes dans le référentiel terrestre, dans les 20 premières secondes de chute ? lorsqu'ils ont atteint leur vitesse limite ?

+ Quel est le mouvement du parachutiste qui a sauté en second par rapport au premier, dans les 20 premières secondes ? après avoir atteint leur vitesse limite ? 

+ Le parachutiste qui a sauté en 1° ouvre son parachute. Sa vitesse se réduit à 40 #kmh. Quel est le mouvement du second parachutiste par rapport à lui ?

+ Quelle est la vitesse du second parachutiste par rapport au premier?

== Tapis roulant

#align(center,image("tapisroulant.png", fit: "contain",width: 90%))

Un colis descend un plan incliné AB de longueur 3 m.
Sa vitesse au point A est $v_A = 1,2 #ms.$

Le mouvement de descente s'effectue à accélération
constante.

L'expression du mouvement du centre de masse est :

- $x(t) = 1,47 times t^2 + 1,2 times t$ entre les points A et B.
- $x(t)= -1,26 times t^2 + 4,37 times t$ entre les points B et C.

+ Que vaut l'accélération du colis sur le parcours AB ?
+ À quel instant t, le colis arrive-t-il en B ?
+ Quel est sa vitesse v, au point B ?
+ Quelle est la valeur de l'accélération sur le parcours BC ?
    Commenter cette valeur.
+ Au bout de quelle durée le colis sera à l'arrêt ?
+ Quelle sera la distance parcourue BC parcourue par le colis ?
== Chute depuis l'espace

Le 14 octobre 2012, Felix Baumgartner est devenu le
premier homme à monter à près de 40 000 mètres
d'altitude et à sauter pour revenir sur Terre après
une chute suivie par une descente en parachute. Il
bat plusieurs records dont celui du saut le plus haut
de monde et celui de chute libre (phase du saut qui
précède l'ouverture du parachute)

#aide[
    Le mur du son est un phénomène physique qui survient quand un objet atteint la vitesse du son. Cette vitesse dépend uniquement de la température pour des pressions proches de la pression atmosphérique normale. Elle est donnée par la relation

    $c = 20,05.sqrt(T)$ 
    
    où T est la température exprimée en kelvin et c s'exprime en #ms.
]


+ Quelle est la vitesse moyenne de la chute libre de Felix Baumgartner ?
+ Quelle est la plus grande vitesse atteinte par Felix Baumgartner ? L'exprimer en #kmh
+ Justifier la valeur de l'accélération au départ de la chute.
+ Pourquoi la valeur de l'accélération devient-elle négative ? Que constate-t-on pour la vitesse ?
+ Que vaut l'accélération de Félix Baumgartner au bout de 250 s de chute ? Justifier cette valeur. Quelle est la conséquence pour sa vitesse ?
+ À partir des documents montrer que Felix Baumgartner a dépassé la valeur de la vitesse du son au niveau de la mer à une température de 15 °C.

#align(center,image("felix1.png",width: 80%))
#align(center,image("felix2.png",width: 80%))
#align(center,image("felix3.png",width: 80%))


]