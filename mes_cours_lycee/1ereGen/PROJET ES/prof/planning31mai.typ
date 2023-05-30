#set page(margin: 1.5cm)

#let add_times(x,y) = {
  let res = (h : x.h + y.h, min : x.min + y.min)
  while res.min >= 60 {
    res.min -= 60
    res.h += 1
  }
  res
}


#let display(x) = {
  [#x.h;h #x.min;min]
}

// give a list
#let plan(..x) = {
  // x is a list of list of students
  let x = x.pos().map( x => (
                              x.join([ , ], last : [ et ]),
                              x.len() * 5,
                           )
                         )
  let x = {
    let intermed = ()
    let previous = (h : 13, min : 25)
    for (content,duration) in x {
      let time_break = (h:0, min: 5)
      let convocation = previous
      let time = (h : 0, min : duration)
      let passage = add_times(convocation, time_break)
      let next = add_times(passage,time)
      
      intermed.push(
        (content,[203],[#display(convocation)],[#display(passage)],[#duration min])
      )
      previous = next
    }
    intermed
  }
  
  table(align: center + horizon, inset: 12pt, columns: (2fr, 1fr, 1fr, 1fr, 1fr),
  [Groupe],  [Salle], [Convocation],  [Passage] ,[Durée],
  ..x.flatten()

)}



#show heading: it => [#align(center,it) #v(10pt)]
= Oraux des projets en enseignement scientifique \ Classe de première G2\ Mercredi 31 Mai

#plan(
  ("Théo", "Jérémy", "Ludovic"),
  ("Kelyan", "Lilian"),
  ("Mai", "Sara", "Rahma", "Minelle"),
  ("Iness", "Anaïs"),
  ("Jakub", "Félix", "Killian"),
  ("Astan", "Lisa", "Exocee", "Zainaba"),
  ("Paul", "Lucas", "Gaétan", "Corentin"),
  ("Lina", "Salamata"),
  ("Farès", "Lalie", "Jasmine", "Sameed"),
  ("Konate",),
  ("Inès", "Solenn", "Alessio",),
  ("Delgado",),
  ("Kylian", "Kélyan", "Felix"),
  ("Adiaratou",),
)
