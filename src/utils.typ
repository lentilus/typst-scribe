#let did-load-operations = state("scribe-operations", false)
#let did-load-caligraphics = state("scribe-caligraphics", false)
#let did-load-logicals = state("scribe-logicals", false)
#let did-load-grouping-brackets = state("scribe-grouping-brackets", false)
#let did-load-miscellaneous = state("scribe-miscellaneous", false)
#let did-load-relations = state("scribe-relations", false)

#let safe-wrap(module, is-legal, funcion-name, content) = {
  // TODO: do type assertion here
  context if is-legal.get() != true {
    panic("SCRIBE: Illegal use of '"
     + funcion-name
     + "' from '"
     + module
     + "'. Please use the appropriate show rule, or remove '"
     + module
     + "' from your scribe imports.")
  } 
  content
}
