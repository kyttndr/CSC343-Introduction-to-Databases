<histogram>
{
let $pdoc := fn:doc("posting.xml")
let $rdoc := fn:doc("resume.xml")

let $pskills := distinct-values($pdoc//posting//reqSkill/@what)
let $rskills := $rdoc//skill

let $skillLevelN :=
for $s in $pskills
return 
	<skill name = "{data($s)}">
	{
		for $level in 1 to 5
		let $c := count($rskills[@what=$s and @level=$level])
		return <count level = "{data($level)}" n = "{data($c)}"/>
	}
	</skill>

return $skillLevelN
}
</histogram>