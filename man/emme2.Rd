\name{emme2}
\alias{read.file0}
\alias{read.file1}
\alias{read.matdir}
\alias{read.ms}	
\alias{read.mo}	
\alias{read.md}	
\alias{read.mf}	
\alias{write.mf}
\alias{read.link.data}
\alias{read.nodes}
\alias{plotLinks}
\alias{ftnode}

\title{Read and Write to an EMME/2 databank}
\description{This package includes functions to read and write to an EMME/2 databank.}

\usage{
read.file0(bank)
read.file1(bank, file0)
read.matdir(bank, file0, mmat)
read.ms(bank, file0) 
read.mo(numname, bank, file0, mcent, mat.dir)
read.md(numname, bank, file0, mcent, mat.dir) 
read.mf(numname, bank, file0, mcent, mat.dir) 
write.mf(data, numname, bank, file0, mcent, mmat, mat.dir, newname=NULL, newdesc=NULL)
read.link.data(bank, scen.num, file0, mscen, mlink, mnode)
read.nodes(bank, scen.num, file0, mscen, mlink, mnode) 
plotLinks(link.data, nodes, centroids=F, ...)
ftnode(node.data, outgoing.links, jnode, mlink)
}
\arguments{
	\item{bank}{String of the EMME/2 databank file name}
	\item{file0}{Databank metadata data frame}
	\item{mmat}{Maximum number of matrices}

	\item{numname}{mf number or name as a string to read in or write to}
	\item{newname}{new name of the matrix to write out}
	\item{newdesc}{new description of the matrix to write out}
	\item{mcent}{Maximum number of centroids}
	\item{mat.dir}{matrix directory object}
	\item{data}{either a vector or matrix of data to write to bank}
	
	\item{scen.num}{scenario number to read from (in EMME/2 order - not named number)}
	\item{mscen}{Maximum number of scenarios}
	\item{mlink}{Maximum number of links}
	\item{mnode}{maximum number of nodes}
	
	\item{link.data}{EMME/2 link data.frame}
	\item{nodes}{EMME/2 nodes data.frame}
	\item{centroids}{T/F, Should the centroids be plotted?}
	
	\item{node.data}{EMME/2 nodes data.frame}
	\item{outgoing.links}{EMME/2 internal file 9 vector from read.link.data}
	\item{jnode}{EMME/2 internal file 11 vector from read.link.data}
	\item{\dots}{graphical parameters can be given as arguments to plot}
}

\details{For details about the EMME/2 internal file structure refer to Appendix C of the EMME/2 User's Manual}
\value{
 	\tabular{lll}{
	read.file0 \tab	data.frame \tab EMME/2 internal file offsets \cr
	read.file1 \tab	list \tab EMME/2 global and scenario parameters \cr
	read.matdir \tab data.frame \tab EMME/2 matrix directory \cr
	read.ms \tab vector \tab EMME/2 all ms values \cr
	read.mo \tab vector \tab EMME/2 mo values \cr
	read.md	\tab vector \tab EMME/2 md values \cr
	read.mf	\tab matrix \tab EMME/2 mf values \cr
	write.mf \tab NA \tab Nothing returned \cr
	read.link.data \tab list \tab EMME/2 link data \cr
	read.nodes \tab data.frame \tab EMME/2 node data \cr
	plotLinks \tab NA \tab Plots EMME/2 network \cr
	ftnode \tab named numeric \tab EMME/2 link data in from to node format
 	} 
}

\examples{
\dontrun{
# Function call to create databank offset file0
file0 <- read.file0("emme2\\\\emme2ban")

#Function call to create file1 info (global parameters)
file1 <- read.file1("emme2\\\\emme2ban", file0)

#Function call to read matrix directory
mat.dir <- read.matdir("emme2\\\\emme2ban", file0, file1$global["mmat"])

#Function call to read all ms from databank
ms <- read.ms("emme2\\\\emme2ban", file0)

#Function call to read mo2
mo2 <- read.mo(2, "emme2\\\\emme2ban", file0, file1$global["mcent"], mat.dir)

#Function call to read md2
md2 <- read.md(2, "emme2\\\\emme2ban", file0, file1$global["mcent"], mat.dir)

#Function call to read mf2
mf2 <- read.mf(2, "emme2\\\\emme2ban", file0, file1$global["mcent"], mat.dir)

#Function call to read mf "opskim"
mf2 <- read.mf("opskim", "emme2\\\\emme2ban", file0, file1$global["mcent"], mat.dir)

#Function call to write mf2
x <- rnorm(mf2) #Random generate length(mf) numbers to write dummy data to bank
write.mf(x, 2, "emme2\\\\emme2ban", file0, file1$global["mcent"], file1$global["mmat"], mat.dir, newname="test", newdesc="test matrix")

#Function call to read link data
link.data <- read.link.data("emme2\\\\emme2ban", 1, file0, file1$global["mscen"], file1$global["mlink"], file1$global["mnode"])

#Function call to create from to node link table
tofrom <- ftnode(link.data[[1]], link.data[[2]], link.data[[3]], file1$global["mlink"])

#Function call to create node table
nodes <- read.nodes("emme2\\\\emme2ban", 1, file0, file1$global["mscen"], file1$global["mlink"], file1$global["mnode"])

#Function call to plot network
plotLinks(link.data, nodes, centroids=F, col="black")
}
}

\author{Ben Stabler <\email{benjamin.stabler@odot.state.or.us}> \cr
	\url{http://www.odot.state.or.us/tddtpau/R.html}
}
\keyword{programming}
