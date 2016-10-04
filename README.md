# Backpipe

[![License](https://img.shields.io/badge/license-GPL%20=%202-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-2.0.html) 
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/backpipe)](https://cran.r-project.org/package=backpipe)
[![Downloads](https://cranlogs.r-pkg.org/badges/backpipe?color=brightgreen)](http://www.r-pkg.org/pkg/backpipe)


The backpipe package provides a single 'backpipe" operator (`%<%`) that allows
the order of operands in a pipe statuement to be inverted. In some
situations this promotes more legible, interpretable and debuggable code. 

Popular packages *magrittr* and *pipeR* do not provide a backward pipe operator. 
This package files the void by providing a `%<%` for use with *magrittr* and 
`%<<%` for use with *pipeR*. 

The package also provides the `backpipe`function for defining backpipe operators 
for any forward pipe implementation


## Installation

### CRAN 

    install.packages('backpipe')


### Github 

    library(devtools)
    install_github("decisionpatterns/backpipe")


## Usage

    # BASIC USAGE
    mean %<%  1:5   # magrittr
    mean %<<% 1:5   # pipeR
     
    # MULTIPLE STEPS
    mean %<% range %<% 1:5
     
    # WITH FORWARD PIPE
    # Although technically possible, don't do this
    add(1) %<% 1:5 %>% multiply_by(2)


## Common Use Cases

**backpipe** can be used to:

* write clearer, more debuggable shiny UI code such that the order of code 
matches the HTML output.

* write test and assertions where the test condition is listed first. 


## Motivation

`magrittr`, `pipeR` and other pipes allow the developer to create left-to-right
operation flows.  However, some code is better expressed with a right-to-left 
syntax and is more common than one might expect. As an example, consider how 
**shiny** has the developer write HTML-producing code.Let's say you wished to 
produce the following HTML:  

    <div class="outer-outer">
      <div class="outer">
        <div class="inner">
          <h1 role="heading">content</h1>
        </div>
      </div>
    </div> 
    
HTML is ugly, but works.  To generate this code using **shiny**, you'd write: 

    div( class="outer-outer", 
      div( class="outer",
        div( class="inner",
          h1( "content", role="heading" )
        )
      )
    )

Yuck!!! This is almost as ugly as the HTML.  **magrittr** or **pipeR**
allows this can to be cleaner:

    h1( "content", role="heading" )        %>%
      div( class="inner")                  %>%
        div( class="outer")                %>% 
          div( class="outer-outer")      
      
That's a little better; it produces the same HTML and is much cleaner, but still
has a big problems. The code does not match the output.  The ordering of the 
HTML output is outside-in while the code is ordered inside-out. This disconnect
reduces clarity and makes debugging difficult.

With the backpipe operator, the same output can be generated with:
      
    div( class="outer-outer")              %<%
      div( class="outer")                  %<% 
        div( class="inner")                %<% 
          h1( "content", role="heading" ) 

Notice how that a) the order of the code now matches the output HTML and b) the 
indentatoin aligns with the hierachal nature of HTML.

While there is no question about the utility of the forward pipe, it does not 
always promote the most expressive code. The **backpipe** solves this problem.
In fact, writing cleaner **shiny** code was the impetus for this package. Though 
it, can be used to clarify code in other common operations.  I am looking at you,
**testthat** and **assertthat**.    
   

## Technical Implementation

The backpipe operators are implemented as a simple reording of arguments. See the `backpipe` code for more details.


## References

 * [Relevant magrittr issue #26](https://github.com/smbache/magrittr/issues/26)

 * [Stackoverflow: Is Right-to-left Operator Associativity in R Possible ](http://stackoverflow.com/questions/31305342/is-right-to-left-operator-associativity-in-r-possible)



