#import "deps.typ": shorthands
#import "utils.typ": *

#let operations = (
  ($***$, $star.op$),
  ($**$, $ast.basic$),
  ($*$, $dot.op$),
  ($\\$, $without$),
  ($-:$, $div$),
  ($|><|$, $join$),
  ($|><$, $times.l$),
  ($><|$, $times.r$),
  ($@$, $compose$),
  ($o+$, $plus.circle$),
  ($o.$, $dot.circle$),
)

#let miscellaneous = (
  ($+-$, $plus.minus$),
  ($:.$, $therefore$),
  ($:'$, $because$),
  ($|~$, $ceil.l$),
  ($~|$, $ceil.r$),
  ($..$, $quad$),
)

#let relations = (
  ($-<=$, $prec.eq$),
  ($-<$, $prec$),
  ($>-=$, $succ.eq$),
  ($>-$, $succ$),
  ($-=$, $equiv$),
  ($~=$, $tilde.equiv$),
  ($~~$, $approx$),
)

#let logicals = (
  ($|--$, $tack.r$),
  ($|==$, $tack.r.double$),
)

#let grouping-brackets = (
  ($(:$, $angle.l$),
  ($:)$, $angle.r$),
  ($<<$, $angle.l$),
  ($>>$, $angle.r$),
)

#let scribe-operations(content) = {
  show: shorthands.with(..operations)
  did-load-operations.update(true)
  content
}

#let scribe-miscellaneous(content) = {
  show: shorthands.with(..miscellaneous)
  did-load-miscellaneous.update(true)
  content
}

#let scribe-relations(content) = {
  show: shorthands.with(..relations)
  did-load-relations.update(true)
  content
}

#let scribe-logicals(content) = {
  show: shorthands.with(..logicals)
  did-load-logicals.update(true)
  content
}

#let scribe-grouping-brackets(content) = {
  show: shorthands.with(..grouping-brackets)
  did-load-grouping-brackets.update(true)
  content
}
#let scribe-caligraphics(content) = {
  did-load-caligraphics.update(true)
  content
}

#let scribe(content) = {
  did-load-operations.update(true)
  did-load-miscellaneous.update(true)
  did-load-relations.update(true)
  did-load-logicals.update(true)
  did-load-grouping-brackets.update(true)
  did-load-caligraphics.update(true)
  show: shorthands.with(..operations)
  show: shorthands.with(..miscellaneous)
  show: shorthands.with(..relations)
  show: shorthands.with(..logicals)
  show: shorthands.with(..grouping-brackets)
  content
}
