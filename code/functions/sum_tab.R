sum_tab <- function(data, var_name) {
  var_name <- enquo(var_name)
  freq_table <- table(data |> pull(!!var_name))
  return(freq_table)
}
