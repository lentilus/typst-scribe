#import "@preview/quick-maths:0.2.0": shorthands
#import "mathcal.typ"


#let readable(body) = {
  show: shorthands.with(
    ($*$, $dot.op$),
    ($\\$, $without$),
    ($+-$, $plus.minus$),
    ($<=>$, $arrow.l.r.double.long$),
    ($|$, $mid(|)$), // to use in sets
    ($..$, $quad$),
    ($--$, $quad$),
    // ($...$, $dots$),
    ($....$, $quad quad$),
  )
  body
}

