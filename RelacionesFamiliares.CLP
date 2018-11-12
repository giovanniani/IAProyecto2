(deffacts estado-inicial
	(padre "Luis" "Maria")
	(madre "Clara" "Maria")
	(padre "Jose" "Luis")
	(madre "Ana" "Luis")
)

(defrule es-padre
	(padre ?padre ?hijo)
=>
	(printout t ?padre " es padre de " ?hijo)
	(assert (hijo ?hijo ?padre))
)

(defrule es-madre
	(madre ?madre ?hijo)
=>
	(printout t ?madre " es madre de " ?hijo)
	(assert (hijo ?hijo ?madre))
)

(defrule read-input 
	(initial-fact)
=>
	(printout t "Name a primary color" crlf)
	(assert (color (read)))
)

(defrule check-input
	?color <- (color ?color-read&red|yellow|blue)
=>
	(retract ?color)
	(printout t "Correct" crlf)
)