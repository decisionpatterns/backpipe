
## TODO

 * [ ] Issue 1: Implement `%:%`or `:` or `::`-- 
   for declarative type programing, for example: 

     log_warn :: 'hello world'    # instead of 
     log_warn %<% 'hello world'

   This is especially useful for side-effect functions that take a single argument. It might also be able to tee this
    
     print :: log_warn :: 'hello world' 

   In which both print and log_warn provide the argument.

   print :: log_warn :: .('hello world')
   

 * [ ] Make composing operator `%,%` for building arguments lists.

    list(a,b)       # Equivalent to:
    list(a) %,% b 
    list(a) %,% list(b)

   a="living life" %,% b="like a" %,% "renegade" %>% fn()
   fn( a="living life", b="like a", "renedage" )

   It is not clear how this interoperates with the %<% operator.  
