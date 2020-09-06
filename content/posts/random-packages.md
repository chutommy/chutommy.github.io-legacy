+++ 
draft = true
date = 2020-08-30T09:30:29+02:00
title = "Generating random numbers in Go"
description = "Explain math/rand and crypto/rand packages and combine them into the powerful and cryptographically secure random number generator"
slug = "" 
tags = ["golang", "package", "random"]
categories = ["Go"]
externalLink = ""
series = []
+++

There are a lot of cases when you need to
generate random numbers, for example for the testing purpose,
in computer simulations, cryptography or any other areas
where producing an unexpectable results is desirable.
Generating random numbers in Go is suprisingle
really hard and it is not that straight-forward
like it is in the other programming languages.

In the Go's standart library there are two
different `rand` packages (`math/rand` and `crypto/rand`).
Both provides some kind of a RNG, but while the math's package
`rand` generate only pseudo-random numbers, the `rand` in crypto
delivers true random generator. The reason why the crypto's `rand`,
which provides cryptographically secure random number generator,
is not used as often as math's rand is due to the time efficiency
and fortunately\* very limited number of functions.
The reason why I marked issue as "fortunately" is
the fact that it makes the package really flexible,
simple and with a single purpose.

The math's `rand` package provides very rich method set
and functions for generating random integers, floating numbers
or for shuffling the order of an array. On the other hand,
the generated numbers are pseudo-random only, which can
be convenient for the testing purpose, but not really
in the production. For instance, imagine the gambling game or
lottery service app which would generate the same results every
single time...

The crypto's `rand` package exposes one important
variable `rand.Reader`, which has io.Reader type and reads
from the system's default random generator to achieve
the cryptographically secured RNG. The systems' random
generator services vary depending on the OS,
on Linux and any other Unix-like systems *getrandom(2)* or */dev/urandom/*
are used, whereas on Windows machines, default random-number
service provider is CryptGenRandom API.

To sum it up, the main differences are the services'
performances and the options that user can use.
The `math/rand` exposes nice, well supported and friendly
functions, yet it delivers pseudo-randomness only.
The `crypto/rand` package serves the true randomly generated numbers,
however it has really limited functionalities.

So how can we get an easy and full-featured Go package for generating
true random numbers? The easiest way is to combine these two rand packages
to achieve the secured RNG and the features that are provided in math package.
The question is, how can be actually join these two packages that has
nothing in common? First of all we must find out, how these packages
are working under the hood.


