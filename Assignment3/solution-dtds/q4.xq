<bestskills>
{
let $idoc := fn:doc("interview.xml")
let $rdoc := fn:doc("resume.xml")

for $i in $idoc//interview
let $assessment := $i/assessment
let $techProficiency := $assessment/techProficiency
let $communication := $assessment/communication
let $enthusiasm := $assessment/enthusiasm
let $collegiality := $assessment/collegiality
let $allassessment := ($techProficiency | $enthusiasm | $communication | $collegiality)
let $m := max($allassessment)

let $maxassessment := 
for $a in $allassessment
where $a = $m
return $a

let $forename := 
for $r in $rdoc//resume
where $r/@rID = $i/@rID
return  $r//forename

return 
	<best resume = "{data($forename)}" position = "{data($i/@pID)}">
		{$maxassessment}
	</best>
}
</bestskills>