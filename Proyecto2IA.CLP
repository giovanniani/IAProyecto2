(deffacts inicio
	(sostenidos 0)
	(bemoles 0)
	(noteC "C")
	(noteD "D")
	(noteE "E")
	(noteF "F")
	(noteG "G")
	(noteA "A")
	(noteB "B")
	(haySostenidos False)
	(hayBemoles False)
	(End False)
	(debePreguntar False)
)


(defrule read-input 
	(initial-fact)
=>
	(printout t "Escoja un numero del 1 al 24" crlf)
	(assert (tonalidad (read)))
)

(defrule validNumber
	(tonalidad ?x)
	(test ( >= ?x 25))
=>
	(printout t "No es un rango valido" crlf)
)

(defrule validNumber2
	(tonalidad ?x)
	(test ( <= ?x 0))
=>
	(printout t "No es un rango valido" crlf)
)
	

(defrule firstCheck
	?tonalidad <- (tonalidad ?tonalidad-read&12)
=>
	(assert (sostenidos 0))
	(printout t "Todo bien = " sostenidos crlf)
)

(defrule first
	(tonalidad ?x)
	(test ( <= ?x 4))
	(test ( > ?x 0))
=>
	(printout t "esta entre 1 y 4" crlf)
	(assert (haySostenidos True))
	(assert (sostenidos ?x))
	(assert (End True))
)

(defrule check-C
	(haySostenidos True)
	(sostenidos ?x)
	(test ( >= ?x 1))
=>
	(printout t "Convirtiendo C en C#" crlf)
	(assert(noteC "C#"))
)

(defrule check-D
	(haySostenidos True)
	(sostenidos ?x)
	(test ( >= ?x 2))
=>
	(printout t "Convirtiendo D en D#" crlf)
	(assert(noteD "D#"))
	(assert(End True))
)

(defrule printAll
	(noteC ?C)
	(noteD ?D)
	(noteE ?E)
	(noteF ?F)
	(noteG ?G)
	(noteA ?A)
	(noteB ?B)
=>
	(printout t "doing magic = " ?C crlf ?D crlf ?E crlf ?F crlf ?G crlf A crlf ?B crlf)
)