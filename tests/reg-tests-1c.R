## Regression tests for R >= 3.0.0

pdf("reg-tests-1c.pdf", encoding = "ISOLatin1.enc")

## mapply with classed objects with length method
## was not documented to work in 2.x.y
setClass("A", representation(aa = "integer"))
a <- new("A", aa = 101:106)
setMethod("length", "A", function(x) length(x@aa))
setMethod("[[", "A", function(x, i, j, ...) x@aa[[i]])
(z <- mapply(function(x, y) {x * y}, a, rep(1:3, 2)))
stopifnot(z == c(101, 204, 309, 104, 210, 318))
## reported as a bug (which it was not) by H. Pages in
## https://stat.ethz.ch/pipermail/r-devel/2012-November/065229.html