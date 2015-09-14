# Backpipe

[![License](http://img.shields.io/badge/license-GPL%20=%202-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) [![CRAN](http://www.r-pkg.org/badges/version/backpipe)](http://cran.rstudio.com/package=backpipe) [![Downloads](http://cranlogs.r-pkg.org/badges/backpipe?color=brightgreen)](http://www.r-pkg.org/pkg/backpipe)

Popular packages *magrittr* and *pipeR* packages do not provide a backward 
piping operator. This package provides operators `%<%` 
for use with *magrittr* and `%<<%` for use with *pipeR*. The package also 
provides the `backpipe`function for defining backpipe operators 

## Motivation

Some structure are simply better expressed with right-to-left operations. This 
more common than one might expect.  For example, right-to-left structures are 
better at representing trees, directories and nested structures.  

As an example, consider how **shiny** has the developer write code that 
produces HTML.  Let's say you wished to produce the HTML:  

    <div class="outer-outer">
      <div class="outer">
        <div class="inner">
          <h1 role="heading">content</h1>
        </div>
      </div>
    </div> 
    
HTML is ugly, but works.  With **shiny**, you'd write: 

    div( class="outer-outer", 
      div( class="outer",
        div( class="inner",
          h1( "content", role="heading" )
        )
      )
    )

Yuck!!! This is almost as ugly as the HTML.  Using **magrittr** or **pipeR**
this can be a little neater:

    h1( "content", role="heading" )        %>%
      div( class="inner")                  %>%
        div( class="outer")                %>% 
          div( class="outer-outer")      
      
That's a little better and it produces the same HTML. It can still be better.  The above example illustrates two incongruities between code and output. The first is a reversal of order between code and HTML output. HTML is ordered from outside-in. **shiny** has the developer write code inside-out. This makes debugging difficult expecially with complex code. If you haven't done anything complex with **shiny** yet, you will. Don't worry. The second problem is that code indentation no longer illustrate the nested 
structure of the HTML.  

The **backpipe** package and backpipe operators solve both of these dilemmas. In fact, writing cleaner **shiny** code was the impetus for this package, though its utility can be found when working with other things too.  Using the backpipe operator the same code can be written as:
      
    div( class="outer-outer")              %<%
      div( class="outer")                  %<% 
        div( class="inner")                %<% 
          h1( "content", role="heading" ) 

Now, both the order of the tags and the nesting matches the outputed HTML. Your code is cleaner, more legible and debugging is easy. Your overall coding time is lessened.  With the time you save, you can join me at the pub and buy me a beer.  I'm already there. I used **backpipe**. My **shiny** code was done hours ago. 


## Usage

The back-piping operators

    mean %<%  1:3   # magrittr
    mean %<<% 1:3   # pipeR
     
    mean %<% range %<% 1:5
   

## Technical Implementation

The backpipe operators are implemented as a simple reording of arguments. See
the `backpipe` code for more details.

## References

* [Relevant magrittr issue](https://github.com/smbache/magrittr/issues/26)

* [Stackoverflow question](http://stackoverflow.com/questions/31305342/is-right-to-left-operator-associativity-in-r-possible)
