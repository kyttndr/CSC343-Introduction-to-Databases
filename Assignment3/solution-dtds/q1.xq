<dbjobs>
{
let $d :=  fn:doc("posting.xml")
for $p in $d//posting
let $s := $p/reqSkill
where some $skill in $s
satisfies $skill/@what = "SQL" and $skill/@level = "5"
return $p
}
</dbjobs>