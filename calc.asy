import graph;

size(9cm,9cm);

real y0 = sqrt(5)/5;
real x0 = 8/5;

real n0_major(real epsilon) {return sqrt(5+8/epsilon)/5;}
real n0_minor(real epsilon) {return sqrt(5-8/epsilon)/5;}

guide g_major = graph(n0_major, 0.2, 3);
guide g_minor = graph(n0_minor, x0 , 3);
path  g_asy   = (0,y0)--(3,y0);

path above = (0.2, n0_major(0.2))--g_major--(3, n0_major(3))--(3, n0_major(0.2))--cycle;
path under = (x0, n0_minor(x0))--g_minor--(3, n0_minor(3))--(3, 0)--cycle;


draw("$n>\frac15\sqrt{5+\frac8\epsilon}$", g_major, (0.2,0.67)   , dashed);
draw("\tiny$n<\frac15\sqrt{5-\frac8\epsilon}$", g_minor, (0.2, -0.15), dashed);
draw(g_asy, dotted);

fill(under, gray);
fill(above, gray);

real[] xs = {1, 2};
real[] ys = {1};


string xlabels(real x) {return abs(x-8/5)<0.1 ? "$\frac85$" : string(x);}
string ylabels(real y) {return abs(y-sqrt(1/5))<0.1 ? "$\frac15\sqrt5$" : string(y);}

xaxis("$\epsilon$", YZero(false),         RightTicks(xs), Arrow, true);
yaxis("$n$"       , XZero(false), dashed, LeftTicks (xs), Arrow, true);

xtick("$\frac85$"       , x0, N, -3);
ytick("$\frac{\sqrt5}5$", y0, E, -3);

dot((x0, 0), Fill(rgb(255,255,255)));

label("0", 0.2*SW);
