#import "caligraphy.typ" : caligraphy
#import "operations.typ" : operations

#let scribe(body) = [
  #show: caligraphy
  #show: operations
  #body
]
