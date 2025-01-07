#import "@preview/quick-maths:0.2.0": shorthands
#import "mathcal.typ"


#let readable(body) = {
  show: shorthands.with(
    ($*$, $dot.op$),
    ($\\$, $without$),
    ($+-$, $plus.minus$),
    ($<=>$, $arrow.l.r.double.long$),
    ($..$, $quad$),
    ($--$, $quad$),
    // ($...$, $dots$),
    ($.....$, $quad$),
  )
  body
}

