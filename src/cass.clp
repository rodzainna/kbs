(reset)

(defglobal ?*external-class* = 0
    		?*highCredit* = ""
    		?*status* = ""
    		  ?*list* = ""
    )

(deffunction display ()
        (printout t crlf "This Expert System will determine the possible CASS course you may shift:" crlf crlf "Please Provide all necessary information:" crlf crlf))
 (display)

 ;Function that calls the java class
(deffunction calljava ()
      (bind ?*external-class* (new CASS))
	(bind ?*highCredit* (?*external-class* HighCredit ))
        (bind ?*list* (list ""))
    (printout t "No. of units credited and Course with high credit: " ?*highCredit* crlf crlf )
    )
(calljava)


;Function that determines the Highest Course Credited
(deffunction creditSubject ()
   (try
    (if (< 0 (member$ "AB FILIPINO" ?*highCredit*) )then
        (assert (hCredFil))else (assert (notFil))) catch(assert (notFil)))
    (try
    (if (< 0 (member$ "AB ENGLISH" ?*highCredit*) )then
        (assert (hCredEng))else (assert (notEng))) catch(assert (notEng)))
    (try
    (if (< 0 (member$ "AB HISTORY" ?*highCredit*) )then
        (assert (hCredHist)) else (assert (notHist))) catch(assert (notHist)))
    (try
    (if (< 0 (member$ "AB SOCIOLOGY" ?*highCredit*) )then
        (assert (hCredSocio))
            else (assert (notSocio))) catch(assert (notSocio)))
     (try
    (if (< 0 (member$ "AB POLITICAL SCIENCE" ?*highCredit*) )then
        (assert (hCredPolSci))
            else (assert (notPolSci))) catch(assert (notPolSci)))
    (try
    (if (< 0 (member$ "AB PYSCHOLOGY" ?*highCredit*) )then
        (assert (hCredPsych))
            else (assert (notPsych))) catch(assert (notPsych)))
    )
(creditSubject)



;Function that Ask the user his/her Grade
(deffunction ask-grade-eng ()
  (printout t "Are your grade in English subjects greater than 1.75?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (gradeEngHigh))
                (ask-question-eng)
            else (assert (notEng)))    
     catch () )
  )

;Function that Ask the user his/her Grade
(deffunction ask-grade-hist ()
  (printout t "Are your grade in History subjects greater than 1.75?(yes/no): " crlf)
  (try
     (if (eq (read) "yes") then
    (assert (gradeHistHigh))
                (ask-question-hist)
            else (assert (notHist)))             
   catch () ))

;Function that Ask the user his/her Grade
(deffunction ask-grade-fil ()
  (printout t "Are your grade in Filipino subjects greater than 1.75?(yes/no): " crlf)
  (try
     (if (eq (read) "yes") then
    (assert (gradeFilHigh))
            (ask-question-fil)
            else (assert (notFil)  ) )       
    catch () ) )

;Function that Ask the user his/her Grade
(deffunction ask-grade-polsci ()
  (printout t "Are your grade in Political Science subjects greater than 1.75?(yes/no): " crlf)
  (try
     (if (eq (read) "yes") then
    (assert (gradePolSciHigh))
                     (ask-question-polsci)
        else (assert (notPolSci)))
   catch () ))

;Function that Ask the user his/her Grade
(deffunction ask-grade-psych ()
  (printout t "Are your grade in Psychology subjects greater than 1.75?(yes/no): " crlf)
  (try
     (if (eq (read) "yes") then
    (assert (gradePsychHigh))
                     (ask-question-psych) 
        else (assert (notPsych)))       
   catch () ))
;Function that Ask the user his/her Grade

(deffunction ask-grade-socio ()
  (printout t "Are your grade in Sociology subjects greater than 1.75?(yes/no): " crlf)
  (try
     (if (eq (read) "yes") then
    (assert (gradeSocioHigh))
                     (ask-question-socio)  
        else (assert (notSocio)))
   catch () ))


;Function that Ask the user his/her Interest
(deffunction ask-question-eng ()
  (printout t "Do you posses the skills of a good writer, poet, public speaker?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (interestEng))
         else (assert (notEng)))
     catch () )
  )

;Function that Ask the user his/her Interest
(deffunction ask-question-hist ()
  (printout t "Do you have good memory of past events and how this event impact the society?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (interestHist))
         else (assert (notHist)))
     catch () )
  )

;Function that Ask the user his/her Interest
(deffunction ask-question-fil ()
  (printout t "Magaling ka ba mag sulat nga tula at makipagbalagtasan?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (interestFil))
         else (assert (notFil)))
     catch () )
  )

;Function that Ask the user his/her Interest
(deffunction ask-question-polsci ()
  (printout t "Is your interest deals with systems of government and the analysis of political activity and political behavior?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (interestPolSci))
         else (assert (notPolSci)))
     catch () )
  )

;Function that Ask the user his/her Interest
(deffunction ask-question-psych ()
  (printout t "Are you incline to understand individuals and groups and their general principles?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (interestPsych))
         else (assert (notPsych)))
     catch () )
  )

;Function that Ask the user his/her Interest
(deffunction ask-question-socio ()
  (printout t "Are you good a critical analysis on social order, social disorder and social change?(yes/no): " crlf)
    (try
        (if (eq (read) "yes") then
    		(assert (interestSocio))
         else (assert (notSocio)))
     catch () )
  )



;Rule 1:Highest Probabiltity is English
(defrule Rule1-ProbEng
    (hCredEng)
    =>
    (assert (hProbEng))
    (ask-grade-eng)
    )

;Rule 2:Highest Probabiltity is Filipino
(defrule Rule2-ProbFil
    (hCredFil)
    =>
    (assert (hProbFil))
    (ask-grade-fil))

;Rule 3:Highest Probabiltity is History
(defrule Rule3-ProbHist
    (hCredHist)
    =>
    (assert (hProbHist))
    (ask-grade-hist))

;Rule 4:Highest Probabiltity is Political Science
(defrule Rule4-ProbPolSci
    (hCredPolSci)
    =>
    (assert (hProbPolSci))
        (ask-grade-polsci)
    )

;Rule 5:Highest Probabiltity is Psychology
(defrule Rule5-ProbPsych
    (hCredPsych)
    =>
    (assert (hProbPsych))
        (ask-grade-psych)
    )

;Rule 6:Highest Probabiltity is Sociology
(defrule Rule6-ProbSocio
    (hCredSocio)
    =>
    (assert (hProbSocio))
        (ask-grade-socio)
    )

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


;Rule 13: Student is incline AB English
(defrule Rule13-InclineEnglish
        (and (gradeAcceptableEng)(interestEng))
    =>
    (assert (InclineEng)))

;Rule 14: Student is incline AB Filipino
(defrule Rule14-InclineFilipino
        (and (gradeAcceptableFil)(interestFil))
    =>
    (assert (InclineFil))
)

;Rule 15: Student is incline AB History
(defrule Rule15-InclineHistory
        (and (gradeAcceptableHist)(interestHist))
    =>
    (assert (InclineHist))
)

;Rule 16: Student is incline AB Political Science
(defrule Rule16-InclinePolSci
        (and (gradeAcceptablePolSci)(interestPolSci))
    =>
    (assert (InclinePolSci))
)

;Rule 17: Student is incline AB Pychology
(defrule Rule17-InclinePsych
        (and (gradeAcceptablePsych)(interestPsych))
    =>
    (assert (InclinePsych))
)

;Rule 18: Student is incline AB Sociology
(defrule Rule18-InclineSocio
        (and (gradeAcceptableSocio)(interestSocio))
    =>
    (assert (InclineSocio))
)

;Rule 19: Advice Course is AB English
(defrule Rule19-ABEnglish
    (and
        (InclineEng)
    (hProbEng))
    =>
    (assert (EnrollEng))
(bind ?*list* (insert$ ?*list* 2 (list "AB ENGLISH"))))

;Rule 20: Advice Course is AB Filipino
(defrule Rule20-ABFilipino
    (and
        (InclineFil)
    (hProbFil))
    =>
    (assert (EnrollFil))
(bind ?*list* (insert$ ?*list* 2 (list "AB FILIPINO"))))

;Rule 21: Advice Course is AB History
(defrule Rule21-ABHistory
    (and
        (InclineHist)
    (hProbHist))
    =>
    (assert (EnrollHist))
(bind ?*list* (insert$ ?*list* 2 (list "AB HISTORY"))))

;Rule 22: Advice Course is AB Political Science
(defrule Rule22-ABPolSci
    (and
        (InclinePolSci)
    (hProbPolSci))
    =>
    (assert (EnrollPolSci))
(bind ?*list* (insert$ ?*list* 2 (list "AB POLITICAL SCIENCE"))))

;Rule 23: Advice Course is AB Pychology
(defrule Rule23-ABPsych
    (and
        (InclinePsych)
    (hProbPsych))
    =>
    (assert (EnrollPsych))
(bind ?*list* (insert$ ?*list* 2 (list "AB PSYCHOLOGY"))))

;Rule 24: Advice Course is AB Sociology
(defrule Rule24-ABSocio
    (and
        (InclineSocio)
    (hProbSocio))
    =>
    (assert (EnrollSocio))
        (bind ?*list* (insert$ ?*list* 2 (list "AB SOCIOLOGY"))))

;Rule 25: No Advice Course for CASS
(defrule Rule25-NoCourse
    (and
        (notEng)
    	(notSocio)
        (notFil)
        (notHist)
        (notPolSci)
        (notPsych))
    =>
    (assert (NoAdviceCourse))
        (bind ?*list* (insert$ ?*list* 2 (list "Given the facts, the system was not able derive to any CASS course we advice that you try other Colleges."))))

;(watch rules)
(run)

;(facts)

(deffunction concatinate ()
    (bind ?counter (length$ ?*list*))
	(bind ?temp ?*list*)
	(bind ?temp (rest$ ?temp))
	(while (< 0 ?counter) do
    	(printout t (implode$(first$ ?temp)) crlf)
    	(bind ?temp (rest$ ?temp))
    	(bind ?counter (- ?counter 1)))
    )
(deffunction calculateStatus ()
    (bind ?units (integer (nth$ 1 ?*highCredit*)))
    
    (if (eq (nth$ 2 ?*list*) "Given the facts, the system was not able derive to any CASS course we advice that you try other Colleges.") then
        
    else
    (if (and (< 0 ?units) (> 23 ?units)) then
        (bind ?*status* "Status: 1st year (Irregular)"))
    (if (and (< 22 ?units) (> 46 ?units)) then
        (bind ?*status* "Status: 1st year (Regular)"))
    (if (and (< 45 ?units) (> 69 ?units)) then
        (bind ?*status* "Status: 2nd year (Irregular)"))
    (if (and (< 68 ?units) (> 92 ?units)) then
        (bind ?*status* "Status: 2nd year (Regular)"))
    (if (and (< 91 ?units) (> 110 ?units)) then
        (bind ?*status* "Status: 3rd year (Irregular)"))
    (if (and (< 109 ?units) (> 122 ?units)) then
        (bind ?*status* "Status: 3rd year (Regular)"))
    (if (and (< 121 ?units) (> 140 ?units)) then
        (bind ?*status* "Status: 4th year (Irregular)"))
    (if (and (< 139 ?units) (> 152 ?units)) then
        (bind ?*status* "Status: 4th year (Regular)"))
    (printout t  ?*status*)
        )
    
    )

(deffunction printResult ()
    
    (printout t crlf  "RESULT: Suited Coure/s "crlf)
	(concatinate)
    (calculateStatus)
    
    )

(printResult)