% File src/library/tools/man/package_dependencies.Rd
% Part of the R package, https://www.R-project.org
% Copyright 2012-2015 R Core Team
% Distributed under GPL 2 or later

\name{package_dependencies}
\alias{package_dependencies}
\title{Computations on the Dependency Hierarchy of Packages}
\description{
   Find (recursively) dependencies or reverse dependencies of packages.
}
\usage{
package_dependencies(packages = NULL, db = NULL,
        which = c("Depends", "Imports", "LinkingTo"),
	recursive = FALSE, reverse = FALSE, verbose = getOption("verbose"))
}
\arguments{
  \item{packages}{a character vector of package names.}
  \item{db}{character matrix as from \code{\link{available.packages}()}
    (with the default \code{NULL} the results of this call)
    or data frame variants thereof.  Alternatively, a package database
    like the one available from
    \url{https://cran.r-project.org/web/packages/packages.rds}.
  }
  \item{which}{a character vector listing the types of
    dependencies, a subset of
    \code{c("Depends", "Imports", "LinkingTo", "Suggests", "Enhances")}.
    Character string \code{"all"} is shorthand for that vector,
    character string \code{"most"} for the same vector without
    \code{"Enhances"}.
  }
  \item{recursive}{logical: should (reverse) dependencies of (reverse)
    dependencies (and so on) be included?}
  \item{reverse}{logical: if \code{FALSE} (default), regular
    dependencies are calculated, otherwise reverse dependencies.}
  \item{verbose}{logical indicating if output should monitor the package
    search cycles.}
}
\value{
  Named list with one element for each package in argument \code{packages},
  each consists of a character vector naming the (recursive) (reverse) dependencies
  of that package.

  For given packages which are not found in the db, \code{NULL} entries are returned,
  as opposed to \code{character(0)} entries which indicate no dependencies.
}
\seealso{
  \code{\link{dependsOnPkgs}}, and \code{\link{package.dependencies}} for checking
  dependencies.
}
\examples{
\dontrun{
pdb <- available.packages()
deps <- package_dependencies(packages = "MASS", pdb,
                    which = c("Depends", "Imports", "LinkingTo", "Suggests"),
                    recursive = TRUE, reverse = TRUE)
length(deps$MASS)
}
}
\keyword{utilities}
