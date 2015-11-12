(defglobal ?*external-class* = 0
    		?*highestCredit* = ""
    		;?*coursepref* = ""
    		;?*filgrade* = "no"
    )

(deffacts facts
    (courseEng FALSE)
    (courseFil TRUE) )

;Function that Ask the user his/her Preffered Course
(deffunction ask-preffered-course ()
  (printout t "What CASS course do you Preffer? ")
    (bind ?x (read))  
    ;(bind ?*coursepref* ?x)
  (if (eq (str-compare ?x "AB ENGLISH") 0) then
    (assert (prefEng)))
   (if (eq (str-compare ?x "AB HISTORY") 0) then
    (assert (prefHist)))
 (if (eq (str-compare ?x "AB POLITICAL SCIENCE") 0) then
    (assert (prefPolSci)))
   (if (eq (str-compare ?x "AB PYSCHOLOGY") 0) then
    (assert (prefPsych)))
   (if (eq (str-compare ?x "AB SOCIOLOGY") 0) then
    (assert (prefSocio)))
   (if (eq (str-compare ?x "AB FILIPINO") 0) then
    (assert (prefFil))))
(ask-preffered-course)

;Function that Ask the user his/her Grade
(deffunction ask-grade-eng ()
  (printout t "What is your grade in English? ")
  (if (<= (read) 1.5) then
    (assert (gradeEngHigh))))
(ask-grade-eng)

;Function that Ask the user his/her Grade
(deffunction ask-grade-hist ()
  (printout t "What is your grade in History? ")
  (if (<= (read) 1.75) then
    (assert (gradeHistHigh))))
(ask-grade-hist)

;Function that Ask the user his/her Grade
(deffunction ask-grade-fil ()
  (printout t "What is your grade in Filipino? ")
  (if (<= (read) 2) then
    (assert (gradeFilHigh))
        ;(bind ?*filgrad* "yes")
        ))
(ask-grade-fil)

;Function that Ask the user his/her Grade
(deffunction ask-grade-polsci ()
  (printout t "What is your grade in Political Science? ")
  (if (<= (read) 1.5) then
    (assert (gradePolSciHigh))))
(ask-grade-polsci)

;Function that Ask the user his/her Grade
(deffunction ask-grade-psych ()
  (printout t "What is your grade in Psychology? ")
  (if (<= (read) 1.75) then
    (assert (gradePsychHigh))))
(ask-grade-psych)

;Function that Ask the user his/her Grade
(deffunction ask-grade-socio ()
  (printout t "What is your grade in Sociology? ")
  (if (<= (read) 2) then
    (assert (gradeSocioHigh))))
(ask-grade-socio)

 ;Function that calls the java class
(deffunction calljava ()
      (bind ?*external-class* (new CASS))
    (bind ?*highestCredit* (?*external-class* HighestCredit )))
(calljava)
 
;Function that determines the Highest Course Credited
(deffunction creditSubject ()
    (if (eq ?*highestCredit* "AB FILIPINO")then
        (assert (hCredFil)))
    (if (eq ?*highestCredit* "AB SOCIOLOGY")then
        (assert (hCredSocio)))
    (if (eq ?*highestCredit* "AB ENGLISH")then
        (assert (hCredEng)))
    (if (eq ?*highestCredit* "AB HISTORY")then
        (assert (hCredHist)))
    (if (eq ?*highestCredit* "AB PYSCHOLOGY")then
        (assert (hCredPsych)))
    (if (eq ?*highestCredit* "AB POLITICAL SCIENCE")then
        (assert (hCredPolSci))))
(creditSubject)




;Rule 1:Highest Probabiltity is English
(defrule Rule1-ProbEng
    (hCredEng)
    =>
    (assert (hProbEng)))

;Rule 2:Highest Probabiltity is Filipino
(defrule Rule2-ProbFil
    (hCredFil)
    =>
    (assert (hProbFil)))

;Rule 3:Highest Probabiltity is History
(defrule Rule3-ProbHist
    (hCredHist)
    =>
    (assert (hProbHist)))

;Rule 4:Highest Probabiltity is Political Science
(defrule Rule4-ProbPolSci
    (hCredPolSci)
    =>
    (assert (hProbPoSci)))

;Rule 5:Highest Probabiltity is Psychology
(defrule Rule5-ProbPsych
    (hCredPsych)
    =>
    (assert (hProbPsych)))

;Rule 6:Highest Probabiltity is Sociology
(defrule Rule6-ProbSocio
    (hCredSocio)
    =>
    (assert (hProbSocio)))

;Rule 7: Grade Requirment for English
(defrule Rule7-gradeReqEng 
    (gradeEngHigh)
    =>
    (assert (gradeAcceptableEng)))

;Rule 8: Grade Requirment for Filipino
(defrule Rule8-gradeReqFil 
    (gradeFilHigh)
    =>
    (assert (gradeAcceptableFil)))

;Rule 9: Grade Requirment for History
(defrule Rule9-gradeReqHist
    (gradeHistHigh)
    =>
    (assert (gradeAcceptableHist)))

;Rule 10: Grade Requirment for Political Science
(defrule Rule10-gradeReqPolSci 
    (gradePolSciHigh)
    =>
    (assert (gradeAcceptablePolSci)))

;Rule 11: Grade Requirment for Psychology
(defrule Rule11-gradeReqPsych
    (gradePsychHigh)
    =>
    (assert (gradeAcceptablePsych)))

;Rule 12: Grade Requirment for Sociology
(defrule Rule12-gradeReqSocio
    (gradeSocioHigh)
    =>
    (assert (gradeAcceptableSocio)))

;Rule 13: Advice Course is AB English
(defrule Rule13-ABEnglish
    (and
        (or (gradeAcceptableEng)(prefEng))
    (hProbEng))
    =>
    (assert (EnrollEng))
    (printout t crlf crlf" RESULT: Suited Course is AB ENGLISH" crlf))

;Rule 14: Advice Course is AB Filipino
(defrule Rule14-ABFilipino
    (and
        (or (gradeAcceptableFil)(prefFil))
    (hProbFil))
    =>
    (assert (EnrollFil))
    (printout t crlf crlf" RESULT: Suited Course is AB FILIPINO" crlf))

;Rule 15: Advice Course is AB History
(defrule Rule15-ABHistory
    (and
        (or (gradeAcceptableHist)(prefHist))
    (hProbHist))
    =>
    (assert (EnrollHist))
    (printout t crlf crlf" RESULT: Suited Course is AB HISTORY" crlf))

;Rule 16: Advice Course is AB Political Science
(defrule Rule16-ABPolSci
    (and
        (or (gradeAcceptablePolSci)(prefPolSci))
    (hProbPolSci))
    =>
    (assert (EnrollFil))
    (printout t crlf crlf" RESULT: Suited Course is AB POLITICAL SCIENCE" crlf))

;Rule 17: Advice Course is AB Pychology
(defrule Rule17-ABPsych
    (and
        (or (gradeAcceptablePsych)(prefPsych))
    (hProbPsych))
    =>
    (assert (EnrollPsych))
    (printout t crlf crlf" RESULT: Suited Course is AB PSYCHOLOGY" crlf))

;Rule 18: Advice Course is AB Sociology
(defrule Rule18-ABSocio
    (and
        (or (gradeAcceptableSocio)(prefSocio))
    (hProbSocio))
    =>
    (assert (EnrollSocio))
    (printout t crlf crlf" RESULT: Suited Course is AB SOCIOLOGY" crlf)
    (exit))


(facts)
(watch rules)
(run)
