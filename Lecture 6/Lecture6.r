
# Survey result with all personal information deleted
d <- read.csv("https://raw.githubusercontent.com/ly129/EPIB613/master/survey")
head(d)

plot(x = d$screentime, y = d$coffee,
     main = "Coffee vs. Screen Time",    # Title
     sub = "EPIB 613 Fall 2018", # Sub title
     xlim =,                     # limits of x-axis
     ylim =,                     # Limits of y-axis
     xlab = "Screen Time",       # Label of x-axis
     ylab = "Coffee",            # Label of y-axis
     log = ""                    # Axis to be set on log scale
)            
# x and y are arguments - these two are sufficient for a plot
# In this plot, I specified some most basic graphical parameters.

# Some parameters related to text and plot size.
plot(d$screentime,
     type = "o",    # Type of plot, default is points.
     pch = "*",     # plotting symbols, 1~25 plus anything you want.
     cex = 3,       # Plotting text and symbol size
     cex.axis = 3,  # Axis annotation size
     main = "Screentime", 
     cex.main = 3,  # Title text size
     cex.lab = 1.5, # Axis label size
     lwd = 5,       # Line width
     lty = 3
)

table(d$agree_exams)

# My first pie chart......
pie(x = table(d$agree_exams),
    col =,
    clockwise = TRUE,
    main = "Examinations are the best way to assess learning?",
)

par(bg = "lightyellow") # par() sets graphical parameters before plots.
hist(d$mathcomf,
     breaks = seq(0.75, 5.25, 0.5),   # Without this, the histogram is ugly.
     xlim = c(0, 6),
     main = "Histogram of Level of Comfort with Math",
     sub = "Fall 2018",
     xlab = "Comfort Level",
     col.main = "blue",
     col.axis = 2,
     col.lab = "#009933",
     col.sub = 4,
     col = "darkgreen",
     border = "blue",       # Color of border of the bars
     density = 8,           #  density of shading lines
     angle = 75             # angle of shading lines, in degrees.
)
# border, density and angle are parameters specific to hist().
# Mostly showed parameters related to colors.
# Sorry I am really really really bad with colors.

barplot(table(d$agree_comp))

par(mar = c(8, 4, 4, 2) + 0.1) 
# Set the margins around the plotting area
plot(table(d$agree_comp), type = "h", las = 2)
# las controls the orientation of axis annotations.

boxplot(d$mathcomf, d$screentime)

fx1 <- function(x){x^2-10}
fx2 <- function(x){x^3}
curve(fx1,
      xlim = c(-10, 10), ylim = c(-10, 10),
      col = 2, lty = 1)
curve(fx2, add = TRUE,   # add is an parameter in curve()
      col = 3, lty = 2)  # TRUE -> plot on the existing plot

x <- seq(from = -10, to = 2, by = 0.25)
y <- exp(x)
points(x=x, y=y, pch = ">")  # Add these points to the existing plot
# Add the smooth line containing these points to the existing plot
# lines(x=x, y=y)            

abline(h = 5, lty = 3)      # h -> horizontal line at y = 5 
abline(v = -8, lty = "dotdash")     # v => vertical line at x = -8

abline(a = 0, b = 1/2)      # y = a + bx

legend(x = 5, y = -7,       # Can also be "top", "bottomright", ...
       c(expression(paste(x^2-10)), expression(paste(x^3))),
       col = c(2,3,1),      # Usually corresponds to the plot
       lty = c(1,2),
       text.col = c(2,3))

xx <- seq(from = -10, to = 10, by = 0.1)
yy <- dnorm(xx, mean = 0, sd = 2)  
# dnorm() gives the normal distribution density
plot(x = xx, y = yy, type = "l", main = "PDF of Normal(0, 2)",
     axes = F,      # Suppress axes
     xlab = "x", ylab = "Density"
)
axis(1, at = seq(from = -10, to = 10, by = 2))
axis(2, at = seq(from = 0, to = 1, by = 0.02))
grid()   # add grid lines.
# Explore the parameters allowed in grid()

par(mfrow = c(2, 2)) # 2 x 2 = 4 plots on the same page
plot(lm(coffee~screentime, data = d))
# lm() for linear regression - EPIB 621 material
# Plot your linear regression object will give 4 diagnostic plots.

nf <- layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
# layout.show(nf)  # Shows the partition of the plotting area
plot(x=x, y=y, type = "l")
plot(x=xx, y=yy, type = "l")
boxplot(d$mathcomf, d$screentime)

pdf(file = "Normal_Density.pdf")
plot(x = xx, y = yy, type = "l", main = "PDF of Normal(0, 2)",
     axes = F, xlab = "x", ylab = "Density")
axis(1, at = seq(from = -10, to = 10, by = 2))
axis(2, at = seq(from = 0, to = 1, by = 0.02))
grid()
dev.off()

mu <- 0:4
sigma <- 1:5
bg.color <- c("", "", "", "", "") # Colors of your choice
