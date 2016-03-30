
;--------------------------------------------------------------------------------------
;							** PoisonousMushroom Expert System **
;--------------------------------------------------------------------------------------
;edible
;poisonous
;unknown
;not recommended

;--------------------------------------------------------------------------------------
;	TEMPLATE DEFINITION
;--------------------------------------------------------------------------------------

(deftemplate mushroom (slot name) (slot cap-shape) (slot cap-surface) (slot cap-color) (slot bruises) (slot odor)
    	(slot gill-attachment) (slot stalk-surface-above-ring) (slot ring-type) (slot population) (slot habitat))
(deftemplate poisonous (slot name) (slot cap-shape) (slot cap-surface) (slot cap-color) (slot bruises) (slot odor) (slot gill-attachment) (slot stalk-surface-above-ring) (slot ring-type) (slot population) (slot habitat))
(deftemplate edible (slot name) (slot cap-shape) (slot cap-surface) (slot cap-color) (slot bruises) (slot odor) (slot gill-attachment) (slot stalk-surface-above-ring) (slot ring-type) (slot population) (slot habitat))
(deftemplate not-recommended (slot name) (slot cap-shape) (slot cap-surface) (slot cap-color) (slot bruises) (slot odor) (slot gill-attachment) (slot stalk-surface-above-ring) (slot ring-type) (slot population) (slot habitat))
(deftemplate unknown (slot name) (slot cap-shape) (slot cap-surface) (slot cap-color) (slot bruises) (slot odor) (slot gill-attachment) (slot stalk-surface-above-ring) (slot ring-type) (slot population) (slot habitat))

(defglobal ?*a* = nil)
(defglobal ?*b* = nil)
(defglobal ?*c* = nil)
(defglobal ?*d* = nil)
(defglobal ?*e* = nil)
(defglobal ?*f* = nil)
(defglobal ?*g* = nil)
(defglobal ?*h* = nil)
(defglobal ?*i* = nil)
(defglobal ?*j* = nil)


;--------------------------------------------------------------------------------------
;	FACTS DEFINITION
;--------------------------------------------------------------------------------------

(deffacts initial-phase
    (phase edible1)
    (phase edible2)
    (phase edible3)
    (phase edible4)
    (phase edible5)
    (phase edible6)
    (phase poisonous1)
    (phase poisonous2)
    (phase poisonous3)
    (phase poisonous4)
    (phase poisonous5)
    (phase combination1)
    (phase combination2)
    (phase combination3)
    (phase not-recommended1)
    (phase not-recommended2)
    (phase not-recommended3)
    (phase unknown1)
    (phase unknown2)
    
    (mushroom (name augustus) (cap-shape b) (cap-surface g) (bruises f) (odor l))
    (mushroom  (name campestris) (cap-shape x) (cap-color y) (odor a))
    (mushroom (name bernardii) (bruises unk) (odor unk) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p))
    (mushroom (name bisporus)(bruises t) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p))
    (mushroom (name bisirtquis)(cap-color n) (odor l) (ring-type e) (stalk-surface-above-ring p))
    (mushroom (name phalloides) (bruises t)(gill-attachment a) (stalk-surface-above-ring s))
    
    (mushroom (name Boletus) (bruises t) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p))
	(mushroom (name crocodilinus) (cap-color y) (bruises t) (gill-attachment f))
	(mushroom (name fuscofibrillosus) (ring-type p) (population s) (habitat m))
	(mushroom (name appendiculatus) (cap-surface f) (gill-attachment f))
	(mushroom (name brunnescens) (cap-surface c) (bruises t) (gill-attachment a))
	(mushroom (name arvensis) (cap-shape f) (gill-attachment d) (ring-type l))
    
    (mushroom (name haemorrhoidarius)(cap-shape t) (odor f) (gill-attachment s) (stalk-surface-above-ring p))
	(mushroom (name bitorquis)(cap-color n) (odor l) (ring-type e) )
	(mushroom (name Amanita)(bruises t) (gill-attachment a) (stalk-surface-above-ring s))
	(mushroom (name mellea)(odor y) (gill-attachment n))
	(mushroom (name ponderosa)(odor s) (ring-type l) (habitat m))
    
    (mushroom (name Armillaria) (cap-surface f) (odor s) (ring-type l) (habitat m))
	(mushroom (name matsutake) (cap-color n) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p))
	(mushroom (name auricula) (cap-surface f) (gill-attachment a) (stalk-surface-above-ring s))
    
    (mushroom (name polytricha) (cap-shape x) (cap-surface y) (population s) (habitat g))
	(mushroom (name aereus) (cap-surface y) (cap-color w) (gill-attachment s) (habitat g))

)

;--------------------------------------------------------------------------------------
;	FUNCTION DEFINITION
;--------------------------------------------------------------------------------------

(deffunction select-cap-shape()
    (printout t "Please enter cap-shape" crlf)
  	(printout t "bell=b,conical=c,convex=x,flat=f,knobbed=k,sunken=s" crlf)
    (bind ?*a* (read t))
    (if (or (eq ?*a* b) (eq ?*a* c) (eq ?*a* x) (eq ?*a* f) (eq ?*a* k) (eq ?*a* s) )
        then 
        else  (select-cap-shape))
    )

(deffunction select-cap-surface()
    (printout t "Please enter cap-surface" crlf)
  	(printout t "fibrous=f,grooves=g,scaly=y,smooth=s" crlf)
    (bind ?*b* (read t))
    (if (or (eq ?*b* f) (eq ?*b* g) (eq ?*b* y) (eq ?*b* s) )
        then 
        else  (select-cap-surface))
    )

(deffunction select-cap-color()
    (printout t "Please enter cap-color" crlf)
  	(printout t "brown=n,buff=b,cinnamon=c,gray=g,green=r,pink=p,purple=u,red=e,white=w,yellow=y" crlf)
    (bind ?*c* (read t))
    (if (or (eq ?*c* n) (eq ?*c* b) (eq ?*c* c) (eq ?*c* g) 
            (eq ?*c* r) (eq ?*c* p) (eq ?*c* u) (eq ?*c* e) (eq ?*c* w) (eq ?*c* y) )
        then 
        else  (select-cap-color))
    )

(deffunction select-bruises()
    (printout t "Please enter bruises" crlf)
  	(printout t "bruises=t,nobruises=f" crlf)
    (bind ?*d* (read t))
    (if (or (eq ?*d* t) (eq ?*d* f) )
        then 
        else  (select-bruises))
    )

(deffunction select-odor()
    (printout t "Please enter odor" crlf)
  	(printout t "almond=a,anise=l,creosote=c,fishy=y,foul=f,musty=m,none=n,pungent=p,spicy=s" crlf)
    (bind ?*e* (read t))
    (if (or (eq ?*e* a) (eq ?*e* l) (eq ?*e* c) (eq ?*e* y)
             (eq ?*e* f) (eq ?*e* m) (eq ?*e* n) (eq ?*e* p) (eq ?*e* s) )
        then 
        else  (select-odor))
    )

(deffunction select-gill-attachment()
    (printout t "Please enter gill-attachment" crlf)
  	(printout t "attached=a,descending=d,free=f,notched=n" crlf)
    (bind ?*f* (read t))
    (if (or (eq ?*f* a) (eq ?*f* d) (eq ?*f* f) (eq ?*f* n) )
        then 
        else  (select-gill-attachment))
    )

(deffunction select-stalk-surface-above-ring()
    (printout t "Please enter stalk-surface-above-ring" crlf)
  	(printout t "fibrous=f,scaly=y,silky=k,smooth=s" crlf)
    (bind ?*g* (read t))
    (if (or (eq ?*g* f) (eq ?*g* y) (eq ?*g* k) (eq ?*g* s) )
        then 
        else  (select-stalk-surface-above-ring))
    )

(deffunction select-ring-type()
    (printout t "Please enter ring-type" crlf)
  	(printout t "cobwebby=c,evanescent=e,flaring=f,large=l,none=n,pendant=p,sheathing=s,zone=z" crlf)
    (bind ?*h* (read t))
    (if (or (eq ?*h* c) (eq ?*h* e) (eq ?*h* f) (eq ?*h* l) 
            (eq ?*h* n) (eq ?*h* p) (eq ?*h* s) (eq ?*h* z) )
        then 
        else  (select-ring-type))
    )

(deffunction select-population()
    (printout t "Please enter population" crlf)
  	(printout t "abundant=a,clustered=c,numerous=n,scattered=s,several=v,solitary=y" crlf)
    (bind ?*i* (read t))
    (if (or (eq ?*i* a) (eq ?*i* c) (eq ?*i* n) (eq ?*i* s) 
            (eq ?*i* v) (eq ?*i* y) )
        then 
        else  (select-population))
    )

(deffunction select-habitat()
    (printout t "Please enter habitat" crlf)
  	(printout t "grasses=g,leaves=l,meadows=m,paths=p,urban=u,waste=w,woods=d" crlf)
    (bind ?*j* (read t))
    (if (or (eq ?*j* g) (eq ?*j* l) (eq ?*j* m) (eq ?*j* p) 
            (eq ?*j* u) (eq ?*j* w) (eq ?*j* d) )
        then 
        else  (select-habitat))
    )

;--------------------------------------------------------------------------------------
;	RULES DEFINITION
;--------------------------------------------------------------------------------------

;?,?,?,?,t,?,f,s,p,?,?
(defrule edible1
  	(phase edible1)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises t) (odor ?e) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p) (population ?i) (habitat ?j))
  =>
    (printout t ?n " is Edible!" crlf)
	(assert (edible (bruises t) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p)))
) 

;?,?,?,?,t,?,f,s,p,?,?
(defrule edible2
  	(phase edible2)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color y) (bruises t) (odor ?e) (gill-attachment f) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j))
  =>
    (printout t ?n " is Edible!" crlf)
	(assert (edible (cap-color y) (bruises t) (gill-attachment f)))
) 

;?,?,?,?,?,?,?,?,p,s,m
(defrule edible3
  	(phase edible3)
    (printout t ?n " is Edible!" crlf)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type p) (population s) (habitat m))
  =>
	(assert (edible (ring-type p) (population s) (habitat m)))
) 

;?,?,f,?,?,?,f,?,?,?,?
(defrule edible4
  	(phase edible4)
    (printout t ?n " is Edible!" crlf)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface f) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment f) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j))
  =>
	(assert (edible (cap-surface f) (gill-attachment f)))
) 

;?,?,c,?,t,?,a,?,?,?,?
(defrule edible5
  	(phase edible5)
    (printout t ?n " is Edible!" crlf)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface c) (cap-color ?c) (bruises t) (odor ?e) (gill-attachment a) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j))
  =>
	(assert (edible (cap-surface c) (bruises t) (gill-attachment a)))
) 

;?,f,?,?,?,?,d,?,l,?,?
(defrule edible6
  	(phase edible6)
    (printout t ?n " is Edible!" crlf)
  	(mushroom (name ?n) (cap-shape f) (cap-surface ?b) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment d) (stalk-surface-above-ring ?g) (ring-type l) (population ?i) (habitat ?j))
  =>
	(assert (edible (cap-shape f) (gill-attachment d) (ring-type l)))
) 

;?,t,?,?,?,?,f,s,p,?,?
(defrule poisonous1
  	(phase poisonous1)
  	(mushroom (name ?n) (cap-shape t) (cap-surface ?b) (cap-color ?c) (bruises ?d) (odor f) (gill-attachment s) (stalk-surface-above-ring p) (ring-type ?h) (population ?i) (habitat ?j))
  =>
    (printout t ?n " is Poisonous!" crlf)
	(assert (poisonous (cap-shape t) (odor f) (gill-attachment s) (stalk-surface-above-ring p)))
) 

;?,?,?,n,?,l,?,?,e,?,?
(defrule poisonous2
  	(phase poisonous2)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color n) (bruises ?d) (odor l) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type e) (population ?i) (habitat ?j))
  =>
    (printout t ?n " is Poisonous!" crlf)
	(assert (poisonous (cap-color n) (odor l) (ring-type e)))
) 

;?,?,?,?,t,?,a,s,?,?,?
(defrule poisonous3
  	(phase poisonous3)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises t) (odor ?e) (gill-attachment a) (stalk-surface-above-ring s) (ring-type ?h) (population ?i) (habitat ?j))
  =>
    (printout t ?n " is Poisonous!" crlf)
	(assert (poisonous (bruises t) (gill-attachment a) (stalk-surface-above-ring s)))
) 

;?,?,?,?,?,y,n,?,?,?,?
(defrule poisonous4
  	(phase poisonous4)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises ?d) (odor y) (gill-attachment n) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j))
  =>
    (printout t ?n " is Poisonous!" crlf)
	(assert (poisonous (odor y) (gill-attachment n)))
) 

;?,?,?,w,?,s,?,?,l,?,m
(defrule poisonous5
  	(phase poisonous5)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color w) (bruises ?d) (odor s) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type l) (population ?i) (habitat m))
  =>
    (printout t ?n " is Poisonous!" crlf)
	(assert (poisonous (odor s) (ring-type l) (habitat m)))
) 

(defrule combination1
  	(phase combination1)
  	(mushroom (name ?n) (cap-shape b) (cap-surface g) (cap-color ?c) (bruises ?d) (odor ?e))
  =>
    (printout t "evaluating " ?n "..." crlf)
    (if (eq ?c nil) then
        (select-cap-color)
        (if (eq ?*c* u) then
            (printout t ?n " is a Poisonous mushroom!" crlf)
            (assert (poisonous(name ?n)))
            else 
            (printout t ?n "is an Edible mushroom!" crlf))
        	(assert (poisonous(name ?n)))
        else
        (printout t "unknown!" crlf)
  )
    )

(defrule combination2
    (phase combination2)
  (mushroom (name ?n) (cap-color n) (odor ?e) (ring-type e) (stalk-surface-above-ring p))
  =>
    (printout t "evaluating " ?n "..." crlf)
    (if (eq ?e nil) then
        (select-cap-color)
        (if (eq ?*e* l) then
            (printout t ?n " is a Poisonous mushroom!" crlf)
            (assert (poisonous(name ?n)))
            else 
            (printout t ?n "is an Edible mushroom!" crlf))
        	(assert (poisonous(name ?n)))
        else
        (printout t "unknown!" crlf)
  )
    )

(defrule combination3
  	(phase combination3)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises t) (odor ?e) (gill-attachment a) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j))
  =>
    (printout t "evaluating " ?n "..." crlf)
    (if (eq ?g nil) then
        (select-cap-color)
        (if (eq ?*g* s) then
            (printout t ?n " is a Poisonous mushroom!" crlf)
            (assert (poisonous(name ?n)))
            else 
            (printout t ?n "is an Edible mushroom!" crlf))
        	(assert (poisonous(name ?n)))
        else
        (printout t "Unknown!" crlf)
  )
    )


;?,?,f,?,?,s,?,?,l,?,m
(defrule not-recommended1
  	(phase not-recommended1)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface f) (cap-color ?c) (bruises ?d) (odor s) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type l) (population ?i) (habitat m))
  =>
        (printout t ?n " is not recommended!" crlf)
	(assert (not-recommended (cap-surface f) (odor s) (ring-type l) (habitat m)))
) 

;?,?,?,n,?,?,f,s,p,?,?
(defrule not-recommended2
  	(phase not-recommended2)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color n) (bruises ?d) (odor ?e) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p) (population ?i) (habitat ?j))
  =>
        (printout t ?n " is not recommended!" crlf)
	(assert (not-recommended (cap-color n) (gill-attachment f) (stalk-surface-above-ring s) (ring-type p)))
) 

;?,?,f,?,?,?,a,s,?,?,?
(defrule not-recommended3
  	(phase not-recommended3)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface f) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment a) (stalk-surface-above-ring s) (ring-type ?h) (population ?i) (habitat ?j))
  =>
        (printout t ?n " is not recommended!" crlf)
	(assert (not-recommended (cap-surface f) (gill-attachment a) (stalk-surface-above-ring s)))
) 

(defrule unknown1
  	(phase unknown1)
  	(mushroom (name ?n) (cap-shape x) (cap-surface y) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type ?h) (population s) (habitat g))
  =>
        (printout t "Poisonous nature of "?n " is unknown!" crlf)
	(assert (unknown (cap-shape x) (cap-surface y) (population s) (habitat g)))
) 

(defrule unknown2
  	(phase unknown2)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface y) (cap-color w) (bruises ?d) (odor ?e) (gill-attachment s) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat g))
  =>
        (printout t "Poisonous nature of "?n " is unknown!" crlf)
	(assert (unknown (cap-surface y) (cap-color w) (gill-attachment s) (habitat g)))
) 

(defrule generic
  	(phase generic)
  	(mushroom (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j))
  =>
        (printout t ?n " is generic unknown!" crlf)
	(assert (unknown (name ?n) (cap-shape ?a) (cap-surface ?b) (cap-color ?c) (bruises ?d) (odor ?e) (gill-attachment ?f) (stalk-surface-above-ring ?g) (ring-type ?h) (population ?i) (habitat ?j)))
) 

(reset)
(facts)
(run)
(facts)