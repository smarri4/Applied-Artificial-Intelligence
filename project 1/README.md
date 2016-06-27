#Expert System for Detecting Poisonous Mushrooms

### 1. Domain			
	
The domain selected for this project is the inference of mushrooms whether they are poisonous, edible, not recommended or unknown category based on certain physical and demographic properties of the mushrooms. We use these properties as facts and based on these facts and the rules we defined based on study, we infer the edibility of the mushroom family and add them to our knowledgebase as facts, so that the next time we encounter any mushroom of the same family, we can directly infer its edibility. The data for facts and assumptions made to form the rules are based on the dataset obtained from the UCI repository [1]. Mushroom records have been drawn from The Audubon Society Field Guide to North American Mushrooms (1981). G.H.Press, New York: Alfred A. Knopf

### 2. Dataset Information:	
This data set includes descriptions of hypothetical samples corresponding to 23 species of gilled mushrooms in the Agaricus and Lepiota Family (pp. 500-525). Each species is identified as definitely edible, definitely poisonous, or of unknown edibility and not recommended. The Guide clearly states that there is no simple rule for determining the edibility of a mushroom; no rule like ``leaflets three, let it be'' for Poisonous Oak and Ivy. But for the sake of forming rules, certain traits of mushrooms are assumed to be poisonous, edible or unknown edibility.
	
### 3. Encoding the Knowledge Using Jess

##### Outcomes
edible
poisonous
unknown
not recommended

###TEMPLATE DEFINITION

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



###	FACTS DEFINITION

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

