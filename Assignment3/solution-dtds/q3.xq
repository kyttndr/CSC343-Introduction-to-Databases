<qualified>
{
for $r in doc("resume.xml")//resume
where count($r//skills/skill) > 3
return  <candidate rid = "{data($r/@rID)}" numskills = "{count($r//skills/skill)}" citizenship = "{data($r//citizenship)}">
			<name>{data($r//forename)}</name>
		</candidate>
}
</qualified>