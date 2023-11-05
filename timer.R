library(tictoc)

tic.clearlog()

source("scripts/solution-1.r")
source("scripts/solution-2.r")
source("scripts/solution-3.r")

printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }

printTicTocLog()

## Results

#   `Function type` Seconds
#   <chr>           <chr>  
# 1 Solution 1      36.901 
# 2 Solution 2      26.401 
# 3 Solution 3      16.784 

# --> Solution 3 is the fastest.

# Solution 3 parallizes on a lower level. If the MTweedieTest-function is more
# demanding in terms of computation that could be a reason why it is faster
# to parallize the function itself instead of just parallizing the loop.

