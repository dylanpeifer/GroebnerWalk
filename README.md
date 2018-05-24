# The GroebnerWalk Package

The GroebnerWalk Package is a Macaulay2 package implementing the Groebner walk
algorithm for computing Groebner bases. The Groebner walk is a Groebner basis
conversion algorithm, which means it takes a Groebner basis of an ideal with
respect to one monomial order and changes it into a Groebner basis of the same
ideal over a different monomial order. Conversion algorithms can be useful
since sometimes when a Groebner basis over a difficult monomial order (such as
lexicographic or an elimination order) is desired, it can be faster to compute
a Groebner basis directly over an easier order (such as graded reverse
lexicographic) and then convert rather than computing directly in the original
order.

## Requirements

The package requires at least version 1.10 of [Macaulay2][1].

## Installation

The GroebnerWalk package has been distributed with Macaulay2 since version
1.11. To load it, type

    i1 : needsPackage "GroebnerWalk"

at the Macaulay2 prompt. If you are using an older version of Macaulay2 or wish
to reinstall or update the GroebnerWalk package, first download the
[archive][2] and unpack it. Then place the file `GroebnerWalk.m2` in the
`packages` directory of your Macaulay2 install. Finally, type

    i1 : installPackage "GroebnerWalk"

at the Macaulay2 prompt to finish installation. This command may need to be
repeated if you previously had a version of GroebnerWalk installed.

## Tests

After installation, basic tests of the package can be run by typing

    i2 : check GroebnerWalk

at the Macaulay2 prompt. Several examples for testing and benchmarking are also
available in the file `examples.m2` in this directory.

## Documentation

After the package has been installed, package documentation can be accessed by
typing

    i3 : viewHelp GroebnerWalk

at the Macaulay2 prompt. Documentation for all exported functions can also be
accessed through the standard Macaulay2 help system.

## License

Copyright (C) 2017 Dylan Peifer

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Contact

For questions, comments, problems, and bugs, please contact the package author,
Dylan Peifer, at djp282@cornell.edu.

[1]: https://faculty.math.illinois.edu/Macaulay2/
[2]: https://github.com/dylanpeifer/GroebnerWalk/archive/v1.0.0.tar.gz
