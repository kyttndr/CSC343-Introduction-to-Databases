<important>
{
let $value :=
for $p in fn:doc("posting.xml")//posting
for $rs in $p/reqSkill
let $c := $rs/@importance * $rs/@level
return $c

let $mv := max($value)

for $p in fn:doc("posting.xml")//posting
where some $skill in $p/reqSkill
satisfies $skill/@importance * $skill/@level = $mv
return $p
}
</important>