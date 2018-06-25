
## TODO

 * Implement `%:%`or `:` or `::`-- 
   for declarative type programing, for example: 

     log_warn :: 'hello world'    # instead of 
     log_warn %<% 'hello world'

   This is especially useful for side-effect functions that take a single argument. It might also be able to tee this
    
     print :: log_warn :: 'hello world' 

   In which both print and log_warn are  provide the argument.


 * Make composing operator `%,%`

    list(a,b)       # Equivalent to:
    list(a) %,% b 
    list(a) %,% list(b)

   It is not clear how this interoperates with the %<% operator.


