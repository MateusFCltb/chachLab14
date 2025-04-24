## plotting funcs for time series

xy_line <- function(dataset, X_ax, Y_ax, title, labels, color, trendline){
  ggplot(dataset, aes(x = X_ax, y = Y_ax,))+
    geom_line(color= color)+
    ggtitle(title)+
    labs(y = labels[1], x = labels[2])+ #labels should use a vector where x lab is 1 and ylab is 2
    if(trendline == TRUE){
      geom_smooth(method = lm, color = "green")
    }
}

xy_point <- function(dataset, X_ax, Y_ax, title, labels, color, trendline){
  ggplot(dataset, aes(x = X_ax, y = Y_ax,))+
    geom_point(color= color)+
    ggtitle(title)+
    labs(y = labels[1], x = labels[2])+ #labels should use a vector where x lab is 1 and ylab is 2
    if(trendline == TRUE){
      geom_smooth(method = lm, color = "green")
    }
}

