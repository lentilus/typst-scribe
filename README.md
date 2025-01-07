# Readable typst

> a collection of functions and show rules to make typst source code more readable. Ideally I would like to be able to write maths in plain text all together, without ever having to look at a generated pdf. I think typst's syntax is a really good starting point for that.

I would like the plain text representation of content to be close to notation common for written math.

To install: clone the repo and run
```bash
mkdir -p .local/share/typst/packages/local/readable-code
ln -s /path/to/repo "x.y.z"
```

Then in your typst file import it with
```typst
#import "@local/readable-code:x.y.z" : *
#show: readable

Now you can use
+ $RR\\{0}$         for $RR without {0}$
+ $n .. "is even" $ for $n quad "is even"$
+ $a * b$           for $a dot.op b$
+ $Aa$              for $cal(A)$
+ and $aA$          for $cal(a)$
... and more
```
