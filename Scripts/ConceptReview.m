%[text] %[text:anchor:T_2E9CDDC0] # Review: Laplace transforms and LTI systems
%[text] Transfer functions are derived by computing the **Laplace transform** of **linear time-invariant** (**LTI**) dynamic systems. In this live script, the basics of Laplace transforms and LTI systems are reviewed.
%[text:tableOfContents]{"heading":"Table of Contents"}
%%
%[text] %[text:anchor:H_AA53CC65] ## Laplace transform 
%[text] %[text:anchor:H_6C61F654] ### Definition
%[text] The Laplace transform of a locally integrable function $f${"altText":"f"} is 
%[text]  $F(s) = \\mathcal{L}\\{f(t)\\} =\\int\_{0}^{\\infty} f(t) e^{-st} \\ dt${"altText":"F(s) = \mathcal{L}{f(t)} =\int\_{0}^{\infty} f(t) e^{-st}  dt"}
%[text] The corresponding inverse Laplace transform is denoted as
%[text]  $f(t) = \\mathcal{L}^{-1} \\{ F(s) \\}${"altText":"f(t) = \mathcal{L}^{-1} { F(s) }"}
%[text] Inverse Laplace transforms (and forward Laplace transforms, for that matter) are usually found by appealing to a transform table. The formal definition of the inverse Laplace transform is rarely used and so is not discussed here.
%[text] ![write.png](text:image:3f9f) **Example.** 
%[text] **(a)** Compute the Laplace transform of $f(t) = H(t-a)${"altText":"f(t) = H(t-a)"} by hand, where $H${"altText":"H"} is the Heaviside step function with $a \> 0${"altText":"a \> 0"}.
%[text] **(b)** Compute the analytic Laplace transform of $f${"altText":"f"} using the [Symbolic Math Toolbox](https://www.mathworks.com/products/symbolic.html).
%[text] **Solution.** 
%[text] **(a)**
%[text]  $\\begin{array}{rl}\nF(s) = \\int\_{0}^{\\infty}  H(t-a) e^{-st} \\ dt\n = \\int\_{a}^{\\infty}  e^{-st} \\ dt\n= \\left. -\\frac{1}{s} e^{-st} \\ \\right\\vert\_a^\\infty\n= \\frac{1}{s} e^{-as}\n\\end{array}${"altText":"\begin{array}{rl} F(s) = \int\_{0}^{\infty}  H(t-a) e^{-st}  dt  = \int\_{a}^{\infty}  e^{-st}  dt = \left. -\frac{1}{s} e^{-st}  \right\vert\_a^\infty = \frac{1}{s} e^{-as} \end{array}"}
%[text] **(b)** The [`laplace`](https://www.mathworks.com/help/symbolic/sym.laplace.html) function computes the analytic transform of a symbolic expression `f`. You can use the syntax:
%[text] ```matlabCodeExample
%[text] Fs = laplace(f,var,transformVar)
%[text] ```
%[text] 1\. Start by declaring symbolic variables. 
syms t s
syms a positive
%[text] 2\. Then, define the function `f`. You can find a list of mathematical functions present in the Symbolic Math Toolbox in [the documentation](https://www.mathworks.com/help/symbolic/mathematical-functions.html?s_tid=CRUX_lftnav).
f = heaviside(t-a)
%[text] 3\. Finally, compute the Laplace transform with the input variable `t` and transform variable `s`.
Fs = laplace(f,t,s)
%%
%[text] ![write.png](text:image:4236) **Exercise.** 
%[text] 1\. Compute the Laplace transform of some standard functions listed below on paper. Assume $a${"altText":"a"} is real and $a\>0${"altText":"a\>0"}.
%[text] $\\textbf{a.}\\ f(t) = 1 \\qquad \\textbf{b.} \\ f(t) = e^{-at}  \\qquad \\textbf{c.} \\ f(t) = t \\qquad \\textbf{d.}\\ f(t) =  \\delta(t-a)${"altText":"\textbf{a.} f(t) = 1 \qquad \textbf{b.}  f(t) = e^{-at}  \qquad \textbf{c.}  f(t) = t \qquad \textbf{d.} f(t) =  \delta(t-a)"}
%[text] $\\textbf{e.}\\ f(t) = \\cos(t) \\qquad \\textbf{f.}\\ f(t) = t^2 e^{-at} \\qquad \\textbf{g.} \\ f(t) =  e^{-at} \\sin(t)${"altText":"\textbf{e.} f(t) = \cos(t) \qquad \textbf{f.} f(t) = t^2 e^{-at} \qquad \textbf{g.}  f(t) =  e^{-at} \sin(t)"}
%[text] **Hints:** **a/b.** substitution, **c.** integration by parts, **d.** [`dirac`](https://www.mathworks.com/help/symbolic/sym.dirac.html) (for the symbolic computation), **e/g.** integrate by parts and rearrange terms, **f.** multiple integrations by parts, 
%[text] 2\. Verify your answers by computing the Laplace transforms in the space provided below using symbolic math.
% Symbolic variable declarations
syms t s
syms a positive

% Compute Laplace transforms here


%%
%[text] %[text:anchor:H_FCF781EA] ### Visualize Laplace transforms
%[text] ![interact.png](text:image:6f03) **Try.** Use the controls below to visualize common Laplace transforms.
syms t real
syms a b positive
%[text] Set constants $m${"altText":"m"}, $a${"altText":"a"}, and $b${"altText":"b"}:
m = 1; % Positive integer %[control:slider:52aa]{"position":[5,6]}
anum = 1; % Positive constant %[control:slider:21bb]{"position":[8,9]}
bnum = 1; % Positive constant %[control:slider:8c74]{"position":[8,9]}
%[text] Select a function $f${"altText":"f"}:
f = dirac(t-a);  %[control:dropdown:82a9]{"position":[5,15]}
%[text] Define axis ranges:
trange = [-5, 5]; %[control:slider:40ea]{"position":[11,13]} %[control:slider:5535]{"position":[15,16]}
srange = [-5, 5]; %[control:slider:3320]{"position":[11,13]} %[control:slider:2f0c]{"position":[15,16]}

generateSinglePlot(f,anum,bnum,trange,srange); % This local function generates the plots
%[text] ![brightbulb.png](text:image:0c6d) **Reflect.** 
%[text] - What class of functions is most commonly observed in the Laplace transform?
%[text] - How do the poles of the Laplace transform reflect the behavior of the time domain function $f(t)${"altText":"f(t)"}? \
%[text] Laplace transforms and their inverses are also commonly found using a table, like [this one](https://en.wikipedia.org/wiki/List_of_Laplace_transforms#Table).
%%
%[text] %[text:anchor:H_53441522] ### Laplace transform properties
%[text] Laplace transforms have several important properties that can be derived from the definition. A few essential properties are reviewed below.
%[text]  $\\left.\n\\begin{array}{lll}\n\\textbf{Name} & \\mathbf{f(t)} & \\mathbf{F(s)}\n\\\\\n\\text{Time derivative} \\quad& \\dot{f}(t) \\quad & sF(s) - f(0)\n\\\\\n\\text{Time integral} \\quad& \\int\_0^t f(\\tau) d\\tau \\quad & \\frac{F(s)}{s}\n\\\\\n\\text{Frequency shift} \\quad& e^{at} f(t) \\quad & F(s-a)\n\\\\\n\\text{Time shift} \\quad& f(t-a)H(t-a) \\quad & e^{-as} F(s)\n\\\\\n\\text{Time scaling} \\quad& f(at) \\quad & \\frac{1}{a}F\\left( \\frac{s}{a}\\right)\n\\\\\n\\text{Time domain convolution} \\quad &  (f\*g)(t) & F(s) G(s)\n\\end{array}\n\\right.\n${"altText":"\left. \begin{array}{lll} \textbf{Name} & \mathbf{f(t)} & \mathbf{F(s)}  \text{Time derivative} \quad& \dot{f}(t) \quad & sF(s) - f(0)  \text{Time integral} \quad& \int\_0^t f(\tau) d\tau \quad & \frac{F(s)}{s}  \text{Frequency shift} \quad& e^{at} f(t) \quad & F(s-a)  \text{Time shift} \quad& f(t-a)H(t-a) \quad & e^{-as} F(s)  \text{Time scaling} \quad& f(at) \quad & \frac{1}{a}F\left( \frac{s}{a}\right)  \text{Time domain convolution} \quad &  (f\*g)(t) & F(s) G(s) \end{array} \right. "}
%[text] For example, the Laplace transform of a time derivative can be computed through integration by parts:
%[text]  $\\begin{array}{rl}\n\\mathcal{L}\\{f'(t)\\} &= \\int\_{0}^{\\infty}  \\dot{f}(t) e^{-st} \\ dt\n\\\\\n&= \\left. f(t) e^{-st} \\ \\right\\vert\_0^\\infty - \\int\_{0}^{\\infty}  f(t) \\left( -s  e^{-st}) \\ dt\n\\\\\n&= - f(0) + sF(s)\n\\end{array}${"altText":"\begin{array}{rl} \mathcal{L}{f'(t)} &= \int\_{0}^{\infty}  \dot{f}(t) e^{-st}  dt  &= \left. f(t) e^{-st}  \right\vert\_0^\infty - \int\_{0}^{\infty}  f(t) \left( -s  e^{-st})  dt  &= - f(0) + sF(s) \end{array}"}
%[text] ![interact.png](text:image:2705) **Try.** The symbolic derivative of $f${"altText":"f"} is defined below by declaring a [symbolic function](https://www.mathworks.com/help/symbolic/create-symbolic-functions.html) using the syntax 
%[text] ```matlabCodeExample
%[text] syms f(t)
%[text] ```
%[text] %[text:anchor:H_C9EB0FAA] The derivative is then computed using the [`diff`](https://www.mathworks.com/help/symbolic/sym.diff.html) function. 
syms t f(t)
dfdt = diff(f)
%[text] Use the [`laplace`](https://www.mathworks.com/help/symbolic/sym.laplace.html) function to compute the Laplace transform of `dfdt` in the space below.
Fs = laplace(dfdt)
%%
%[text] ![write.png](text:image:9649) **Exercise.** 
%[text]  **a.** Find the formula for the Laplace transform of the second time derivative $\\ddot{f}(t)${"altText":"\ddot{f}(t)"} by hand, using integration by parts twice.
%[text]  **b.** Verify your answer by computing the Laplace transform using symbolic math.
%[text] ![matlab.png](text:image:8ab6) **Pro-tip**: To compute the second derivative, use the [`diff`](https://www.mathworks.com/help/symbolic/sym.diff.html) function with the syntax: `diff(f,n)`, where `n` is the order of the derivative.
syms t f(t) % Definitions of the symbolic variables
% Perform your symbolic computations here
d2fdt2 = diff(f,2)
Fs = laplace(d2fdt2)
%%
%[text] %[text:anchor:H_7D36CC48] ### Visualize Laplace transform properties
%[text] ![interact.png](text:image:2fe7) **Try.** Use the controls below to visualize the properties of Laplace transforms.
syms t real
syms a real
%[text] Set constants $m${"altText":"m"} and $a${"altText":"a"}:
m = 1; % Positive integer %[control:slider:9b5d]{"position":[5,6]}
anum = 1; % Constant %[control:slider:23c1]{"position":[8,9]}
%[text] Select a function $f${"altText":"f"} and a property to create $g${"altText":"g"}.
f = sin(t); %[control:dropdown:660a]{"position":[5,11]}
g = diff(f); %[control:dropdown:7c0f]{"position":[5,12]}
%[text] Define axis ranges:
trange = [-5, 5]; %[control:slider:7af6]{"position":[11,13]} %[control:slider:949b]{"position":[15,16]}
srange = [-5, 5]; %[control:slider:7cee]{"position":[11,13]} %[control:slider:8391]{"position":[15,16]}

generateDoublePlot(f,g,anum,0,trange,srange) % This local function generates the plots
%%
%[text] %[text:anchor:H_EC8F4DA2] ### Solving differential equations using the Laplace transform
%[text] You can solve initial value problems analytically using Laplace transforms. In general, this is accomplished by 
%[text] 1. taking the Laplace transform,
%[text] 2. solving for the solution variable in the Laplace domain ($X(s)${"altText":"X(s)"}), and
%[text] 3. taking the inverse Laplace transform by referring to a Laplace transform table. \
%%
%[text] ![write.png](text:image:583b) **Example.** Use the Laplace transform to solve for the dynamics of the mass-spring-damper with 
%[text] - constant forcing $F = 10${"altText":"F = 10"} N
%[text] - physical parameters: $m = 1${"altText":"m = 1"} kg, $c = 2${"altText":"c = 2"} N$\\cdot${"altText":"\cdot"}s/m, and $k = 10${"altText":"k = 10"} N/m
%[text] - zero initial conditions: $x(0) = 0${"altText":"x(0) = 0"} and $x'(0)=0${"altText":"x'(0)=0"} \
%[text]  ![mass\_spring\_damper2-flipped.png](text:image:994c)
%[text] **Solution.**
%[text] **1. Derive the equations of motion.** You can draw a free body diagram and apply Newton's second law to derive the equations of motion.
%[text]  ![mass\_spring\_damper\_FBD\_flipped.png](text:image:9e46)
%[text] **2. Compute the Laplace transform of the dynamic system ODE and solve for** $X.${"altText":"X."} Note: $\\mathcal{L}\\{x(t)\\} = X(s)${"altText":"\mathcal{L}{x(t)} = X(s)"}.
%[text]  $\\mathcal{L} \\left\\{ m \\ddot{x} + c\\dot{x} + kx = F \\right\\} \\rightarrow${"altText":"\mathcal{L} \left{ m \ddot{x} + c\dot{x} + kx = F \right} \rightarrow"}$m\[s^2 X - sx(0) - x'(0)\] + c \[s X - x(0)\] + kX = \\frac{F}{s}${"altText":"m\[s^2 X - sx(0) - x'(0)\] + c \[s X - x(0)\] + kX = \frac{F}{s}"}
%[text] Applying the zero initial conditions and the values of the physical parameters implies
%[text]  $s^2 X + 2 s X  + 10X = \\frac{10}{s}${"altText":"s^2 X + 2 s X  + 10X = \frac{10}{s}"}
%[text] Solving for $X${"altText":"X"} yields
%[text]  $X = \\frac{10}{s^3 + 2  s^2   + 10s }${"altText":"X = \frac{10}{s^3 + 2  s^2   + 10s }"}
%[text] **3. Use partial fraction decomposition to separate the expression for** $X${"altText":"X"} **into terms where the inverse Laplace transform is known**
%[text] Try performing the partial fraction decomposition on paper and comparing your result to the symbolic solution found below.
% Define X(s)
syms s 
X = 10/(s^3 + 2*s^2 + 10*s)
% Compute the partial fraction decomposition
Xdecomp = partfrac(X,s)
%%
%[text] %[text:anchor:H_E96D4426] **4. Take the inverse Laplace transform**
%[text] You can take the inverse Laplace transform by rewriting $X${"altText":"X"} as a sum of terms in forms found on a [transform table](https://en.wikipedia.org/wiki/List_of_Laplace_transforms#Table).
%[text] $X(s) = \\frac{1}{s}-\\frac{s+2}{s^2 +2 \\ s+10} =  \\frac{1}{s}-\\frac{s+2}{(s + 1)^2 + 9}  =  \\frac{1}{s}-\\frac{s+1}{(s + 1)^2 + 3^2}  -\\frac{1}{3}\\frac{3}{(s + 1)^2 + 3^2}${"altText":"X(s) = \frac{1}{s}-\frac{s+2}{s^2 +2  s+10} =  \frac{1}{s}-\frac{s+2}{(s + 1)^2 + 9}  =  \frac{1}{s}-\frac{s+1}{(s + 1)^2 + 3^2}  -\frac{1}{3}\frac{3}{(s + 1)^2 + 3^2}"}
%[text] The solution is then constructed by taking the inverse transform:
%[text] $\\begin{array}{rl}\nx(t) &= \\mathcal{L}^{-1} \\left\\{ \\frac{1}{s}-\\frac{s+1}{(s + 1)^2 + 3^2}  -\\frac{1}{3}\\frac{3}{(s + 1)^2 + 3^2} \\right\\}\n\\\\\n  &= H(t) - H(t) e^{-t} \\cos( 3 t) - \\frac{1}{3} H(t) e^{-t} \\sin(3t)\n\\\\\n  &= H(t)( 1  - e^{-t} \\cos( 3 t) - \\frac{1}{3} e^{-t} \\sin(3t))\n\\end{array}${"altText":"\begin{array}{rl} x(t) &= \mathcal{L}^{-1} \left{ \frac{1}{s}-\frac{s+1}{(s + 1)^2 + 3^2}  -\frac{1}{3}\frac{3}{(s + 1)^2 + 3^2} \right}    &= H(t) - H(t) e^{-t} \cos( 3 t) - \frac{1}{3} H(t) e^{-t} \sin(3t)    &= H(t)( 1  - e^{-t} \cos( 3 t) - \frac{1}{3} e^{-t} \sin(3t)) \end{array}"}
%[text] Alternatively, you can use the symbolic function [`ilaplace`](https://www.mathworks.com/help/symbolic/sym.ilaplace.html) to find the inverse Laplace transform of $X(s)${"altText":"X(s)"}.
syms x
x = ilaplace(X) % The inverse Laplace transform of X(s)
%%
%[text] **5. Plot the solution**
%[text] Click the checkbox to plot the solution.
plotSoln = false; %[control:checkbox:774a]{"position":[12,17]}

% Create solution array
t = linspace(0,5,150);
x = 1-exp(-t).*(cos(3*t) + 1/3*sin(3*t));
% This generates a plot (do not edit)
if(plotSoln)
    animateSingleMSD(t,x,0.5)
end
%%
%[text] ![write.png](text:image:04e5) **Exercise.** In this exercise, you will solve for the dynamics of the simple pendulum using the Laplace transform.
%[text]  ![pendulum2.png](text:image:291b)
%[text] **(a)** Draw a free-body diagram for the simple pendulum shown above and derive the equation of motion for a pendulum with length $l = 0.5${"altText":"l = 0.5"} m and a gravitational constant of 9.8 m/s. Linearize the equation near $\\theta = 0${"altText":"\theta = 0"} and show that it is equivalent to
%[text]  $\\ddot \\theta + 19.6 \\theta = 0${"altText":"\ddot \theta + 19.6 \theta = 0"} 
%[text] **(b)** Use the Laplace transform to solve the linearized equations of motion:
%[text]  $\\ddot \\theta + 19.6 \\theta = 0${"altText":"\ddot \theta + 19.6 \theta = 0"} 
%[text]    with initial conditions $\\theta(0) = \\pi / 6, \\ \\dot \\theta (0) = 0${"altText":"\theta(0) = \pi \/ 6,  \dot \theta (0) = 0"}.
%[text] Write your solution in the variable `theta` in terms of the symbolic variable `t`. Then click the checkbox to plot your solution.
syms t
% Replace NaN with your symbolic solution and run the section
theta = NaN; 

plotSoln = false;  %[control:checkbox:9986]{"position":[12,17]}
% This generates a plot (do not edit)
if(plotSoln)
    plotPendulum(theta)
end
%%
%[text] %[text:anchor:H_9EB6E475] ## Linear time-invariant systems
%[text] Linear time-invariant (LTI) systems are characterized by the two properties stated in the name: linearity and time-invariance. 
%[text]{"align":"center"} ![SystemBox.png](text:image:04d7)
%[text]{"align":"center"} *Consider an operator* $g${"altText":"g"} *that maps an input* $u(t)${"altText":"u(t)"} *to an output* $y(t)${"altText":"y(t)"}*.* 
%[text] **1. Linearity**
%[text] The operator $g${"altText":"g"} is linear if it has two properties:
%[text] - Superposition: $g\[u\_1(t) + u\_2(t)\] = y\_1(t) + y\_2(t)${"altText":"g\[u\_1(t) + u\_2(t)\] = y\_1(t) + y\_2(t)"}
%[text] - Homogeneity: $g\[au(t)\] = ay(t)${"altText":"g\[au(t)\] = ay(t)"} \
%[text] Often these two properties are written together as
%[text]  $g\[a u\_1(t) + bu\_2(t)\] = ay\_1(t) + by\_2(t)${"altText":"g\[a u\_1(t) + bu\_2(t)\] = ay\_1(t) + by\_2(t)"}
%[text] **2. Time invariance**
%[text] The operator $g${"altText":"g"} is time-invariant if a time-shifted input produces an output with the same time shift:
%[text] - $g\[u(t - \\tau)\]= y(t - \\tau)${"altText":"g\[u(t - \tau)\]= y(t - \tau)"} \
%%
%[text] ![write.png](text:image:417c) **Exercise.** In this exercise, you will identify if several unknown operators are linear and time-invariant by examining their outputs.
%[text] **a.** Identify if the operators $g${"altText":"g"}, $h${"altText":"h"}, $i${"altText":"i"}, and $j${"altText":"j"} are **time-invariant** by examining the graphs of their inputs and outputs.
%[text] - Use the dropdown to change the operator.
%[text] - Adjust `tau` to change the time-shift of the input. \
syms t
operator = "g"; % Select an operator %[control:dropdown:0856]{"position":[12,15]}
u = t^2/6; % Input function %[control:dropdown:9d75]{"position":[5,10]}
tau = 1;  %[control:slider:6699]{"position":[7,8]}

plotInputsOutputs(u,tau,1,operator) 
%%
%[text] **b.** Identify if the operators $g${"altText":"g"}, $h${"altText":"h"}, $i${"altText":"i"}, and $j${"altText":"j"} satisfy the **homogeneity** condition ($g\[au(t)\] = ay(t)${"altText":"g\[au(t)\] = ay(t)"}) by examining the graphs of the inputs and outputs.
%[text] - Use the dropdown to change the operator.
%[text] - Adjust `a` to change the scaling of the input. \
operator = "g"; %[control:dropdown:4a14]{"position":[12,15]}
syms t
u = t^2/6; % Input function %[control:dropdown:4286]{"position":[5,10]}
a = 2.5;  %[control:slider:955c]{"position":[5,8]}

plotInputsOutputs(u,0,a,operator) 
%%
%[text] **c.** Identify if the operators $g${"altText":"g"}, $h${"altText":"h"}, $i${"altText":"i"}, and $j${"altText":"j"} satisfy **superposition**: $g\[u\_1(t) + u\_2(t)\] = y\_1(t) + y\_2(t)${"altText":"g\[u\_1(t) + u\_2(t)\] = y\_1(t) + y\_2(t)"} by examining the graphs of the inputs and outputs.
%[text] - Use the dropdown to change the operator.
%[text] - Try different functions for $u\_1${"altText":"u\_1"} and $u\_2${"altText":"u\_2"}. \
operator = "g"; %[control:dropdown:0ad0]{"position":[12,15]}
syms t
u1 = t^2/6; % Input function 1 %[control:dropdown:00b6]{"position":[6,11]}
u2 = t^3/10; % Input function 2 %[control:dropdown:39c8]{"position":[6,12]}

plotAddition(u1,u2,operator)
%%
%[text] ![brightbulb.png](text:image:51bc) **Reflect.** The simple operators used to generate the graphs above are listed below. Which operators are linear? Which are time-invariant? Do your answers match what you observed in the graphs above?
%[text] - $g${"altText":"g"}: $y(t) = g\[u(t)\]${"altText":"y(t) = g\[u(t)\]"} with $g= \\frac{d}{dt}  + \\frac{d^2}{dt^2}${"altText":"g= \frac{d}{dt}  + \frac{d^2}{dt^2}"}
%[text] - $h${"altText":"h"}: $y(t) = 4 \\sin^2\[u(t)\]${"altText":"y(t) = 4 \sin^2\[u(t)\]"}
%[text] - $i: \\ y(t) = \\int\_{t - 1}^{t + 1} 3u(\\tau) d\\tau${"altText":"i:  y(t) = \int\_{t - 1}^{t + 1} 3u(\tau) d\tau"}
%[text] - $j${"altText":"j"}: $y(t) = t \\frac{d}{dt} u(t)${"altText":"y(t) = t \frac{d}{dt} u(t)"} \
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.
%%
%[text] ### **Helper functions**
%[text] **Plots**
function generateSinglePlot(f,anum,bnum,trange,srange)
% This function plots a single transform pair
    colors = lines(2);
    figure("position",[0 0 1100 450])
    plotLaplace(f,anum,bnum,trange,srange,colors(1,:),colors(2,:),0.05,0.55,0.85,0.7) 
end

function generateDoublePlot(f,g,anum,bnum,trange,srange)
% This function plots two transform pairs together
    colors = lines(4);
    figure("position",[0 0 1100 500])
    plotLaplace(f,anum,bnum,trange,srange,colors(1,:),colors(2,:),0.05,0.55,0.85,0.63) % This local function generates the plots
    plotLaplace(g,anum,bnum,trange,srange,colors(3,:),colors(4,:),0.05,0.55,0.74,0.63) % This local function generates the plots
end
 
function plotLaplace(func,anum,bnum,trange,srange,c1,c2,p1,p2,py,vpos)
% This function plots a transform pair
    fs = 14; % fontsize
    funcName = inputname(1);
    
    % Compute the Laplace transform and generate functions
    syms s
    syms t real
    syms a b positive
    Fs = laplace(sym(func),t,s);
    Fs = collect(Fs);
    
    % Generate functions for plotting
    ffunc = matlabFunction(sym(func),"vars",[t a b]);
    Fsfunc = matlabFunction(Fs,"vars",[s a b]);
    fplotfunc = @(t)ffunc(t,anum,bnum);
    Fplotfunc = @(s)Fsfunc(s,anum,bnum);

    % Plot f(t) and label it with a latex function
    subplot("position",[0.05 0.1 0.4 vpos])
    hold on
    if(func == dirac(t-a))
        hold on
        plot([1,1]*anum,[0,1],"color",c1,"linewidth",1.5)
        plot(anum,1,"^","color",c1,"linewidth",1.5,"MarkerFaceColor",c1)
        plot(trange,0*trange,"linewidth",1.5,"color",c1)
        hold off
    elseif(func == 1)
        plot(trange,0*trange,"linewidth",1.5,"color",c1)
    else
        fplot(fplotfunc,trange,"linewidth",1.5,"color",c1)
    end
    hold off
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    frange = get(gca,'ylim');
    frange = [frange(1) - diff(frange)/4, frange(2) + diff(frange)/4 ];
    axis([trange frange])
    ylabel("$"+funcName+"$","Interpreter","latex","fontsize",fs)
    textVal = "$$"+funcName+"(t) = "+latex(sym(func))+"$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c1,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[p1 py 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")
    
    % Plot F(s) and label it with a latex function
    subplot("position",[0.55 0.1 0.4 vpos])
    hold on
    if( Fs == 1 )
        plot(srange,0*srange,"linewidth",1.5,"color",c2)
    else
        fplot(Fplotfunc,srange,"linewidth",1.5,"color",c2)
    end
    hold off
    xlabel("$s$","Interpreter","latex","fontsize",fs)
    ylabel("$"+upper(funcName)+"$","Interpreter","latex","fontsize",fs)
    Frange = get(gca,'ylim');
    Frange = [Frange(1) - diff(Frange)/4, Frange(2) + diff(Frange)/4];
    axis([srange Frange])
    textVal = "$$"+upper(funcName)+"(s) = "+latex(sym(Fs))+"$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c2,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[p2 py 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")

end

function plotInputsOutputs(u,tau,a,operator)
% Plots operator input/output and annotates the plots with latex
    figure("position",[0 0 900 350])
    tlims = [-5 5];
    ylims = [-10 10];
    colors = lines(2);
    c1 = colors(1,:);
    c2 = colors(2,:);
    p1 = 0.05;
    p2 = 0.55;
    py = 0.85;
    vpos = 0.70;

    fs = 12; % fontsize
    
    % Apply operator and generate functions
    syms t
    u = a*subs(u,t,t-tau);
    uFunc = matlabFunction(u,"var",t);
    y = applyOperator(u,operator);
    yFunc = matlabFunction(y,"var",t);

    % Plot u(t) and label it with a latex function
    subplot("position",[0.05 0.12 0.4 vpos])
    fplot(uFunc,tlims,"linewidth",1.5,"color",c1)
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    axis([tlims ylims])
    ylabel("$u$","Interpreter","latex","fontsize",fs)
    textVal = "$$"+latex(sym(u))+"$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c1,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[p1 py 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")
    
    % Plot y(t) and label it with a latex function
    subplot("position",[0.55 0.12 0.4 vpos])
    fplot(yFunc,tlims,"linewidth",1.5,"color",c2)
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    ylabel("$y$","Interpreter","latex","fontsize",fs)
    axis([tlims ylims])
    textVal = "$$y(t)$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c2,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[p2 py 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")
end

function plotAddition(u1,u2,operator)

    figure("position",[0 0 1200 500])
    tlims = [-5 5];
    ylims = [-10 10];
    colors = lines(5);
    c1 = colors(1,:);
    c2 = colors(2,:);
    c3 = colors(3,:);
    c4 = colors(4,:);
    px1 = 0.05;
    px2 = 0.375;
    px3 = 0.7;
    py1 = 0.85;
    py2 = 0.75;
    vpos = 0.60;

    fs = 12; % fontsize
    
    % Apply operator and generate functions
    syms t
    u = u1 + u2;
    uFunc = matlabFunction(u,"var",t);
    u1Func = matlabFunction(u1,"var",t);
    u2Func = matlabFunction(u2,"var",t);
    
    y = applyOperator(u,operator);
    y1 = applyOperator(u1,operator);
    y2 = applyOperator(u2,operator);
    yFunc = matlabFunction(y,"var",t);
    y12Func = matlabFunction(y1+y2,"var",t);

    % Plot u(t) and label it with a latex function
    subplot("position",[px1 0.12 0.25 vpos])
    fplot(u1Func,tlims,"linewidth",1.5,"color",c1)
    hold on
    fplot(u2Func,tlims,"linewidth",1.5,"color",c2)
    hold off
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    axis([tlims ylims])
    ylabel("$u$","Interpreter","latex","fontsize",fs)
    textVal = "$$u_1 = "+latex(sym(u1))+"$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c1,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[px1 py1 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")
    textVal = "$$u_2 = "+latex(sym(u2))+"$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c2,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[px1 py2 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")
    
    % Plot y(t) and label it with a latex function
    subplot("position",[px2 0.12 0.25 vpos])
    fplot(y12Func,tlims,"linewidth",1.5,"color",c3)
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    ylabel("$y$","Interpreter","latex","fontsize",fs)
    axis([tlims ylims])
    textVal = "$$y_1(t) + y_2(t)$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c3,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[px2 py2 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")

    % Plot F(s) and label it with a latex function
    subplot("position",[px3 0.12 0.25 vpos])
    fplot(yFunc,tlims,"linewidth",1.5,"color",c4)
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    ylabel("$y$","Interpreter","latex","fontsize",fs)
    axis([tlims ylims])
    textVal = "$$y(t)$$";
    annotation("textbox","String",textVal,"Interpreter","latex","Color",c4,"VerticalAlignment","middle",...
        "fontsize",fs,"Position",[px3 py2 0.1 0.1],"FitBoxToText","on","EdgeColor","none","BackgroundColor","white")

end

function y = applyOperator(u,operator)
    syms t
    if(operator == "g")
        y = diff(u,1) + diff(u,2);
    elseif(operator == "h")
        y = 4*sin(u).^2;
    elseif(operator == "i")
        y = int(3*u,t,t-1,t+1);
    else
        y = t*diff(u,1);
    end
end
 
function plotPendulum(thetaSym)
    try
        % This generates a plot (do not edit)
        t = linspace(0,5,150);
        thetaFunc = matlabFunction(thetaSym);
        thetaArray = thetaFunc(t);
        generatePendulumPlot(t,thetaArray,0.5)
    catch ME
        warning("Plotting failed with error: " + ME.message)
    end
end

function generatePendulumPlot(t,theta,l)
% Generates an animation of a single pendulum
% t: time array
% theta: angle array
% l: length of pendulum
    
    colors = lines(6);
    ms = 8;
    fs = 14;
    
    f = figure("position",[0,0,1200,700]);
    % Generate solution variables
    tlim = [min(t),max(t)];
    y = -l*cos(theta);
    x = l*sin(theta);
    
    % Setup the figure
    buff = 1.2;
    ymax = max([l/2,max(y)*buff]);
    axisLim0 = [tlim(1),tlim(2),min(theta)*buff,max(theta)*buff];
    axisLim1 = [tlim(1),tlim(2),-l*buff,ymax];
    axisLim2 = [-l*buff,l*buff,-l*buff,ymax];
    
    k = 1;
    % Create plot
    sp0 = subplot(2,2,1);
    xlabel("$t$","Interpreter","latex","fontsize",fs)
    ylabel("$\theta$","Interpreter","latex","fontsize",fs)
    hold on
    plot(t,theta,"color",colors(1,:),"linewidth",1.5);
    b = plot(t(k),theta(k),"o","markerfacecolor",colors(2,:),"markersize",ms);
    hold off
    axis(axisLim0)
    title("Angular displacement")
    box off
    
    sp1 = subplot(2,2,3);
    set(gca, "Clipping","off","Color","none"); 
    hold on
    plot(t,y,"k-","color",colors(1,:),"linewidth",1.5)
    e = plot([0, tlim(2)+(tlim(2)-tlim(1))*4], [y(k),y(k)],"-","color",[colors(4,:),0.5],"linewidth",1.5);
    f = plot([t(k), t(k)], [-l*buff,ymax+(ymax+l*buff)*4],"-","color",[colors(4,:),0.5],"linewidth",1.5);
    g = plot(t(k),y(k),"o","markerfacecolor",colors(2,:),"markersize",ms);
    hold off
    axis(axisLim1)
    box off
    xlabel("$t$ [s]","Interpreter","latex","FontSize",fs)
    ylabel("$y$ [m]","Interpreter","latex","FontSize",fs)
    title("Vertical position")
    
    sp2 = subplot(2,2,4);
    set(gca, "Clipping","off","Color","none");
    hold on
    d = plot([0,x(k)],[0,y(k)],"color",colors(1,:),"linewidth",1.5);
    c = plot(x(k),y(k),"o","markerfacecolor",colors(2,:),"markersize",ms*1.5);
    hold off
    axis equal
    axis(axisLim2)
    box off
    xlabel("$x$ [m]","Interpreter","latex","FontSize",fs)
    ylabel("$y$ [m]","Interpreter","latex","FontSize",fs)
    title("Position")
    
    % Create animation
    for k = 1:length(t)
        b.XData = t(k);
        b.YData = theta(k);
        c.XData = x(k);
        c.YData = y(k);
        d.XData = [0,x(k)];
        d.YData = [0,y(k)];
        e.YData = [y(k),y(k)];
        f.XData = [t(k),t(k)];
        g.XData = t(k);
        g.YData = y(k);
        pause(0)
    end
    drawnow
    close all
end


function animateSingleMSD(t,x,w)
% Generates an animation of a single mass/spring/damper
% t: time array
% x: displacement array
% w: width of the mass

    colors = lines(6); 
    fs = 14;
    
    % Create plot
    k = 1;
    f = figure("position",[0 0 1200 500]);
    
    % Setup the figure
    buffer = 1.2;
    xrange = max(x) - min(x);
    xmax = min(x) + xrange*buffer ;
    xmin = max(x) - xrange*buffer - w*1.5;
    tlim = [t(1) t(end)];
    axisLim1 = [tlim(1),tlim(2),xmin,xmax];
    axisLim2 = [-w*buffer,w*buffer,xmin,xmax];
    xground = xmin;
        
    sp1 = subplot(1,2,1);
    set(gca, "Clipping","off","Color","none"); 
    hold on
    plot(t,x,"k-","color",colors(1,:),"linewidth",1.5);
    a = plot([0, tlim(2)+(tlim(2)-tlim(1))*4], [x(k),x(k)],"-","color",[colors(4,:),0.5],"linewidth",1.5);
    b = plot(t(k),x(k),"o","markerfacecolor",colors(2,:),"MarkerSize",8);
    hold off
    axis(axisLim1)
    box off
    xlabel("$t$ [s]","Interpreter","latex","FontSize",fs)
    ylabel("$x$ [m]","Interpreter","latex","FontSize",fs)
    title("displacement")
        
    sp2 = subplot(1,2,2);
    set(gca, "Clipping","off","Color","none");
    hold on
    plot([-w*buffer w*buffer],[xground xground],'k-',"linewidth",1.5);
    
    % Plot mass
    x1 = x(k) - w/2;
    c = rectangle("Position",[-w/2 x1-w w w],"FaceColor",colors(1,:));
    
    % Plot spring
    xextension = x(k)-w;       
    xs = linspace(xground,xextension,12);
    ys = w/6*(-1).^(1:numel(xs)) - w/4;
    d = plot(ys,xs,"k","linewidth",1.5);
    % Plot damper
    ydamp = w/4;

    xdamp1 = xground + (xextension-xground)/2 + w*0.1;
    xdamp2 = xground + (xextension-xground)/2;
    xdamp3 = xground + (xextension-xground)/2 + w*0.2;
    e = plot([ydamp,ydamp,NaN,ydamp-w/10,ydamp+w/10],[xground,xdamp1,NaN,xdamp1,xdamp1],"k","linewidth",1.5);
    f = plot([ydamp-w*0.15,ydamp-w*0.15,NaN,ydamp+w*0.15,ydamp+w*0.15,NaN,ydamp-w*0.15,ydamp+w*0.15,NaN,ydamp,ydamp],...
        [xdamp2,xdamp3,NaN,xdamp2,xdamp3,NaN,xdamp3,xdamp3,NaN,xdamp3,xextension],"k","linewidth",1.5);
    
    hold off
    axis equal
    axis(axisLim2)
    ax = gca;
    ax.XAxis.Visible = 'off'; 
    title("diagram")

    % Create animation
    for k = 1:length(t)
        % displacement
        a.YData = [x(k),x(k)];
        b.XData = t(k);
        b.YData = x(k);
        % mass
        c.Position = [-w/2,x(k)-w,w,w];
        xextension = x(k)-w;       
        % spring
        d.YData = linspace(xground,xextension,12);
        % damper
        xdamp1 = xground + (xextension-xground)/2 + w*0.1;
        xdamp2 = xground + (xextension-xground)/2;
        xdamp3 = xground + (xextension-xground)/2 + w*0.2;
        e.YData = [xground xdamp1 NaN xdamp1 xdamp1];
        f.YData = [xdamp2 xdamp3 NaN xdamp2 xdamp3 NaN xdamp3 xdamp3 NaN xdamp3 xextension]; 
        pause(0)
    end
    drawnow
    close all
        
end

% Suppress unused suggestions
%#ok<*NASGU>

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"hidecode","rightPanelPercent":40}
%---
%[text:image:3f9f]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:4236]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:6f03]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:slider:52aa]
%   data: {"defaultValue":1,"label":"m","max":5,"min":0,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:slider:21bb]
%   data: {"defaultValue":1,"label":"a","max":10,"min":0,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:8c74]
%   data: {"defaultValue":1,"label":"a","max":10,"min":0,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:dropdown:82a9]
%   data: {"defaultValue":"dirac(t-a)","itemLabels":["delta(t-a)","1","t","t^m","heaviside(t-a)","exp(-at)","t*exp(-at)","t^m*exp(-at)","sin(at)","cos(at)","exp(-at)*sin(bt)","exp(-at)*cos(bt)"],"items":["dirac(t-a)","1","t","t^m","heaviside(t-a)","exp(-a*t)","t*exp(-a*t)","t^m*exp(-a*t)","sin(a*t)","cos(a*t)","exp(-a*t)*sin(b*t)","exp(-a*t)*cos(b*t)"],"label":"f","run":"Section"}
%---
%[control:slider:40ea]
%   data: {"defaultValue":-5,"label":"Slider","max":0,"min":-10,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:5535]
%   data: {"defaultValue":5,"label":"Slider","max":10,"min":1,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:3320]
%   data: {"defaultValue":-5,"label":"Slider","max":0,"min":-10,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:2f0c]
%   data: {"defaultValue":5,"label":"Slider","max":10,"min":1,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[text:image:0c6d]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:2705]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:9649]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:8ab6]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAcCAYAAACZOmSXAAACP0lEQVR42mNgoCLIy8vzys\/Pf15QUNDNQE9QWFioBLT4CxD\/B2GgA5LoZjnQwi0wi6H4TVlZGS89LA5FsxiGK2hqcW5urijQkidAfA+L5S\/S0tJYaWU3I9CCjUC8GYg\/YfM9MBH60yq4G6GW1OEIdhBeT1VLQUEJNLQDavg2IJ6Kx\/IfwJQvQLGlDQ0NbECDsoEGXoEa\/BUYrDpA+gMey0FBH0+RxdnZ2fJAg26gGVwKdEwBPouheCslFgsDDbiDZuC2kpISbiD9lAjLfwILISFyE9YKNMPugwxDSnDE4GSiLQwNDWUGxSfUcjkgPgU15DMQ6xUVFamBEhMJlu8nqowGWtoCLThAmqYlJCRwAAsTdmD0zgTy\/UBsIH2GBItB+C\/IExgWggwHSkQB8V4g\/odF4zmgg1Rh6oGOmESixdiLW6BBlUDBdwQ0\/QCGiC80CnLItBiEr6JYXlxcLAItInFp+AbE7lCHBgDZfyiw\/D8wygwxymho4fENTfFnoLgDksU\/KbEYivtxtURApdVlqKK7QFfqQ4M6HIh\/UcFicD0PSmNYHQBNfMWZmZmCUB8XQFMqqZaAsmQNKFsCPWUFpBciJeYogtkuKyuLB2h3EFDzJhItfgZMoLo42nigqvcgSfU20BGLSLBYCU\/jQx9UJAPVmBBte3l5OT8RWfIrMYbm5OQogqKE1DK+FV8JBsoRxJqFM9HhsVwciL\/jsLyQHi3V+VgsrmGgBwAGrRFyHJNUVVLJATuBli4FYnVKzAEAi4Bewge+mbwAAAAASUVORK5CYII=","width":23}
%---
%[text:image:2fe7]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:slider:9b5d]
%   data: {"defaultValue":1,"label":"m","max":5,"min":0,"run":"Section","runOn":"ValueChanging","step":1}
%---
%[control:slider:23c1]
%   data: {"defaultValue":1,"label":"a","max":5,"min":-5,"run":"Section","runOn":"ValueChanged","step":0.25}
%---
%[control:dropdown:660a]
%   data: {"defaultValue":"sin(t)","itemLabels":["t^m","exp(-t)","t*exp(-t)","sin(t)","cos(t)"],"items":["t^m","exp(-t)","t*exp(-t)","sin(t)","cos(t)"],"label":"f","run":"Section"}
%---
%[control:dropdown:7c0f]
%   data: {"defaultValue":"diff(f)","itemLabels":["dfdt","∫ f","exp(at)*f(t)","f(t-a)H(t-a)","f(at)"],"items":["diff(f)","int(f,t,0,t)","exp(a*t)*f","subs(f,t,t-a)*heaviside(t-a)","subs(f,t,a*t)"],"label":"g","run":"Section"}
%---
%[control:slider:7af6]
%   data: {"defaultValue":-5,"label":"Slider","max":0,"min":-10,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:949b]
%   data: {"defaultValue":5,"label":"Slider","max":10,"min":1,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:7cee]
%   data: {"defaultValue":-5,"label":"Slider","max":0,"min":-10,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:slider:8391]
%   data: {"defaultValue":5,"label":"Slider","max":10,"min":1,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[text:image:583b]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:994c]
%   data: {"align":"baseline","height":217,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAApkAAAK8CAYAAACkzqTXAABa50lEQVR42uzdCbh11fwH8PU2z\/NM89uMVOZKIVPKlJShRESRKJRMb4ZmKkQDqVDJLBGZ5W+KkOYkQ4lKiTRo+K\/lrOPus98z7HPvfd+7zr2fz\/P8Hnnv3ueus\/a553zPXmuvHQIA88Qlx62z3BVHbrC\/ngAAYNJcceTs98WQeftvjlhreb0BAMDEA+bhG68YA+YdsR684qjZ79IjAABM2JVHbXjkfwNmq26\/7AObraBXAAAYt6uO3XCl\/53FzHXlERu8W88AADBulx+1wdHVgJnrH85mAgAwLvks5j+7hMwHLz9ig\/fqIQAAhnbFkbPf3y1g5vrnNYfPXlkvAQDQ2GVHr7NaDJJ39gmZsTY8Qk8BAEzM6rH2maLaaX4\/2cuP3OD4\/gHzv\/Wva49ZfxUvDQCA8Tsh1oNTVDfO14D5vk1WjwHy3w1C5oPpwiAvDQCA8fvmFIbMi+fnE43h8YNNAmb7bOal71t3VS8PAIDxeUisrWJtG2u3WK+P9Z0eofCzsV4Wa9dYO8faIdbWef9qbZ8f69BYH4\/12x6P94X59SSHOYv5vzpq9rFeHgAAk+cjPULh+hN4zG1i3VR7vOPn1xO68ogNTxwqYLbqriuP2mgNLwcAgMlxeZeAef0kPO6zao950Px4Mpe+d\/01Y2C8exwh88Erj9zgOC8HAICJS\/MQH+gSMk+bpMe\/svKYL5wfTyiGxZPGEzDbZzOveu+GD\/GyAACYmBeG7kPlL5mkxz+18piPm9dP5rIj11srBsV7JhAyH7ziiA1O8LIAAJiYXvMxJ+ts3rsrjznPr96+4sjZp0woYLbq7muOmv1QLw0AgPHrNh\/z8kl8\/Hfkx7wz1qx5+kSOXXftCZ\/F\/F\/N\/rCXBgDA+KS73HSbj\/mhSfwdx+THvGyep+UjN\/j45ATM\/9Y9Vxyx8TpeIgAAw+s1H\/P5k\/g7Ts6Pef68fCLXHD17\/RgM753EkJnuAvRRLxEAgOF1m4+Zzmyu1HD\/9i0q39Fnmy\/kbU6cl0\/kiiM2OH0yA2aue688ZqN1vUwAAIbTbT7mpQ33XTDWX\/M+L+uz3Q\/yNgfOqydx2RHrz46B8D\/zIGQ+eMVRG5zsZQIA0Fyv9TGbzsd8SmWf9fpsNzu0bkW5yLx6IlceseGZ8yRg5rOZVx+x4XpeLgAAzfSaj\/mChvufkbe\/YSqfxOVHr7fBPDuL+b+7AG34MS8XAIBmes3HXKXBvlvGui\/vc85UPokYAj89LwNmrvtSmPWSAQAYrNt8zCbLDKW79vypss\/+UxYwD994wxQA50PITHWalwwAQH+95mN+L9autdo71mtjHR3rJ7Hur+3zyKl6ElceNfuc+RQw\/3s288qjNtrISwcAoLde8zGHrdtD6yrz+e6yw2dvGoPf\/fMxZKa7AJ3hpQMA0NtHJylknjdVT+CKozY8d\/4GzNbZzKsO33BjLx8AgB4ZrUtg\/H2sHWq1c2gNmb8y1vtjXVPb58CpaPxlR87ebP6fxcx1xAaf8vIBAJjb6qH7fMwmy\/SsEOuOMMXzMa84csMDY+C7sGE1DZDXNHy8Cy77wGYreBkBAHTaPXQf+n5pw\/3\/L29\/S6wFSn+yMRQ+0OzOPhu+1UsDAGD8Tu4RMh\/acP+L8\/afG4UnK2QCAMwfV3cJmFc33HdWaF1RnvbZT8gEACBZPXQ\/i3lKw\/03ruwzEldZC5kAAPPeS3qEzBc33D9d6HNzrG+OyhMWMgEA5r1Te4TMNabrExYyAQDmvWvD+OdjCpkAAMxlzdD9LOapQqaQCQAwXnuGia2PKWQCADCX03qEzLWETCETAGC8ft8lYF433Z+0kAkAMO+sFbqfxfyEkClkAgCM1949QubeQqaQCQAwyDKxnhRr91j7xHpTrKNj3dYjZKbh8hNiHRLrdbFeFmvXWDsLmQAAtJ3UI0yOp5YTMgEASH4xSQHzt9OlQ4RMAICJS7eHfFSsrYao7WPtUKv1hUwAABAyAQAQMgEAEDIBAEDIBABAyAQAQMgEAEDIFDIBABAyAQAQMgEAEDKFTAAAhEwAAIRMAACETCETAAAhEwAAIRMAACETAACETAAAhEwAAIRMAAAQMgEAEDIBABAyAQAQMoVMAACETAAAhEwAAIRMIRMAyvS4WC\/UDQiZAMBkmRXrp7H+GGsJ3YGQCQBMhj1iPZhrju5AyAQAJmqpWDfGuj\/WA7H+HWst3YKQCQBMxOFh7Cxmu87WLQiZAMB4rRvr7tA6g1kPmk\/UPQiZAMB4fL5LuHwwh85LYi2oixAyAYBhPKlHwKzWK3UTQiYA0FQ6Q\/mb0H2YvF3pQqCbYy2ruxAyAWA0rRzr4bFWbbj9SrEeGWu1cf6+\/cLgs5jtOsbhQcgEgNGxTqzjQ2v5oGqo+1us9+QgWZUWTH95+mytbf\/bWLsO8XuXj3Vr6H8Wszo3895YGzpcCJkAUL7XxvpXLdD9p\/b\/0913HpW3XzTWWQO2n9Pwdx8fmp\/FbNd5DhlCJgCU7bBKeLsw1jNC61aOaZ7kNqF1ZrL987+H1sLoH8\/\/\/45Ye+fQuVCsrWL9JYzNodxywO\/eJLTOTD44jnq6Q4eQCQBl2jeMnYXcr8c2D6+Fuz\/l\/70n1uMr220e65ratocP+P2Pi7VPlzqv8hg\/6bHN0xw+hEwAKM+jclBM8xz36LPdArHuDHOfSXxXZZslw9gZzGp9Ypxtq55d\/aRDhZAJAKNh4Vi\/ziHu5AHbppB5Vy08pvmby1e2eW7oPqR9mJCJkClkAjBz7BXG5lSuOGDbNcLgC2\/26rLNfaE151LIRMgUMgGYIX6WA9yJDbZ9WpcA+cbaNg8JrYuCqksNHTSB9gmZCJkAMGLSVeP\/zAHusQ22f0+XkLl5l+3SVeeHxDo4jC11JGQiZAqZAMwgaQh8+Ybbfr8WMNOtHReYx+0TMhEyAWAaWyzMfdHPZ+fD7xUyETIBYBp7Uph7qHxfIROETACYiG7zMTcSMkHIBICJ+FEtYN4wn36vkImQCQDT1NJh7vuKnylkgpAJABOxY5h7qPwVQiYImQDQz0KhNb9yhR4\/P7ZLyGxyB58Xx7pwgoFUyETIBIAR9MrQuqVkCnH\/ibV\/l20urQXM28Pg9TFnxbo+dL8rkJCJkClkAjCN7RHmPkN5W22bdbps860Gj92+BWW6b\/kaQiZCppAJwMzx8y4BMl3gs2Blmzd02eYjAx437f\/TvO0ZE2yjkImQCQAjJA1339klQH6zsk0a8v5tl23mNAyGaRh+HSETIVPIBGBmuakWHtP\/36Dy8\/26BMxBZycPiPVA3m6PSWijkImQCQAj5qxKgDs31mqVn70g1t35Z4eG1hnO9rbpDOVWtcdK+55Z2eawSWqjkImQCQAjZr1Yd4WxK8u\/HuvDsX4YOhddn5VD5DWVf08X9Hw11odinV8JpOnfD5rENgqZCJkAMIKeHeuWMPeQ+L9ivT0HzLblQ+uM5\/2h+zD6d2M9ZpLbJ2QiZALAiFoqh810BvKdobWI+sp9tl871t45AKZKa22uO4\/aJmQiZAIAQiYImQAgZIKQCQBCJgiZAICQiZApZAKAkAlCJgAImSBkAgBCJkKmkAkAQiYImQAgZIKQCQAImQiZAICQCUImAAiZIGQCAEImQiYAIGSCkAkAQiYImQCAkImQCQAImSBkAoCQCUImAAiZQiZCJgAgZCJkCpkAIGSCkAkAQiYImQCAkImQKWQCgJAJQiYACJkgZAIAQiZCppAJAEImCJkAIGSCkAkACJkImQCAkAlCJgAImSBkAgBCJkImACBkgpAJAEImCJkAIGQKmQiZAICQiZApZAIwLWwR69nTtM6phMzvTuPnufUkvRYWjfX0WLuqqavjX7z6A8e9ZPUHB9VrnrzCWfqruHpmrMV8rAC0nFEJYmo064eT9Fr4ir5UasL1DR8rAEKmkNnpn\/pSqQnXvT5WAFoOj3W5GumarPmm\/6p8UP4p1u\/U\/K9lFl\/g1ia16EKz\/qy\/iqk\/Vv52\/uNjBQB6h8zNdQc0trGQCQBCJgiZACBkgpAJAEImCJkAgJAJQiYACJkgZAKAkAlCJgAImUImCJkAIGSCkAkAQiYImQAgZAJCJgAImSBkAoCQCUImAAiZgJAJAEImCJkAIGSCkAkAQiYgZAKAkAlCJgAImSBkAoCQOSr2iHWowz0lXhbrXbFmCZkAIGROJwfHujXWwxzuKbF6rOtinR1rYSETAITM6eCdsf4daxuHekptEOtvsc6KtaCQCQBC5ih7fqwHYr3aYS7C0\/PxOFzIBAAhc1SlofE7Y30tTL+5gKPsxBw0dxYyAUDIHDULxPpxrLtirekQF2XZWDfHujHW8kImAAiZo+S1+fkc5\/AW6YB8fD4kZAKAkDkqlgytM2XpLOYqDm+RFs3H6N5Ys4VMABAyR8Eb8nM5y6Et2lH5OJ0kZAKAkFm6tDTOH\/NzeapDW7QN8nFKy0utIGQCgJBZsh3y87g1TJ+1GKezy\/LxermQCQBCZsk+lp\/HuQ7rSDgmH6+vCJkAIGSWKq2FeXN+HvtMs2OUzsouN4mPt0RoLR+0QO3fFx+ir9P+S9b+faFYiwzRjh3z8UoXaS0tZAKAkFmiTSvP41EN93lyrLfEOjq0zoJ+MdYPYu1e2SaFnzfF+lysn4XW4u7pYpVn9njMtAj8CbEuzNufH+vtsdYd8vlsHeu0WNfnANMOYxeF1sVNSw3xWOl+4WlI+uux7sjH\/K+x\/hHrvFjb5mB+Tw6K3czOzysNcd+f9\/9nrGtjHRZrvVj\/F+vIIdq1WuWYPUfIBAAhs0Svys\/hvtA6U9fEpyrPvVoH5J\/vEusPobWe4wtysHxHaN1JKG33pdBajidJZ\/BOjXVFrDfH2inWc0Nr6L59gcteDdq0dA6yKcS9LdaWoXUWc4kcBr+dH+\/GhsFsrRwML8tBc8XKz9LC6Pvl4Nl+7gt3eYw35ACawvVja0F0i1hfDa27+KT9jxnyuN2Q95sjZAKAkFmik\/NzuHaIfVaKtVlo3eLwL7WQuVcOZut02W\/vyrZpKZ40nJ3OEp4Sug8XX5i3vTeHxn5Oy9t+M7TODtal33VOJVDv3uexFsrP4c85UPaydW5bt5C5S\/73t\/XZPw27f36cIfO7eb8vCJkAIGSW6Fv5OXx\/nPu\/s9IP6U5B6QzbWj22XSa0zuw9mPvvkNAadu51j\/SXVx771AFh7d+VbX\/QY7s0H\/LWvM1tOSx3s1ve5uQGz\/8TPULmr\/K\/Dxruf2gOWsOGzE+O48uBkAkAQuZ88\/v8HM4Z5\/7VIJgC5BsGbH9pZfu7Yz2kz7abV7a9ss92aej9vsq2N\/TZ9pTKdm\/ssc0RofnV9s\/vEjIXDmPzQbds8Bg\/H0fIbLcxzfNcSMgEACGzNO3h3vHeD\/tllX5Ij7XMgO2\/W9n+cwO2fWhl29sHbPvBvF2a4\/iWPtvtX3nMj\/fY5oQwdsHQEwb83i3z76wGvSXD2FzLrzYIgZ8NrekDw3hz5XmM2qLsQiYATPOQuWjlORwzzseohsyLG2x\/fmX7QWc9VwydZz0HSRfTbDJgm70ahNz62dlj+zxuGupfo8u\/X115jHT2Ns0B7XVhVZr3udSQ\/f66yuOvJ2QCgJBZkhUqz+G9kxAyvzZkyHzRJIfMfs9zq9C6s9GJDULmYrF+F+a+ev5voXVhUTrruH2Ye73Mqj277P+fHDjTfMr9eoTTpqoXUW0hZAKAkFmSVSrP4bBJCJlN7kBTDZkvnEchM13gk85GfjmM3ZM9XfCTLsa5PDQbrt8o1nWh+1JN7UpXoD+9z2PMCWPD5t0qTS9IFxeNZ8H4vSqP8zghEwCEzJIsFTqXFBr1kJnmcJ4Rxq5gTxc1pfmZabmlWV3C2aA5ocvkoHhDn6CYLrx5Y5\/H2CY\/5\/\/0eYxrctuHsW9l\/4cLmQAgZJYkDfe2z7R9cMRDZlqz87ZKcEnhcsEu2w0TMttSQH1kaN3dJy2sfmmXoLn9gMdIZyvTQvNpyae0GP0dtce4KPReyqmbA4M5mQAgZBbsltD\/SutRCJlPCWNXyaeljJ7VZ9smITMdz80GtO3RsX5ZeawLKz9LV5M\/P\/S\/qjxdgX5wGDvrmurJQ\/R7dX3SZYVMABAyS\/Oz\/By+PsIhszrP8qQBj9krZKbQ+Iz836fldg6SLhD6RRi7\/WX7TGT73uLbNniMdIvL9tnkdw7R7yeFsbmmo0bIBIAZEDLPDmPL7IxiyNwodA47bzfgMV\/fI2S+L7TuPtQOmWldzkUbPJ9nVR5vsVrIfFfDPrwob\/+BIfq93Y8\/FzIBQMgs0dvyc\/hHGG5OYCkhc7tayNxwwGOe1jBkpp\/v2uD5zA5zn1Fsh8y0VuYCDR7jY3n7Nw3R77\/N+3xCyAQAIbNET6o8j\/UnGDLPa7D91yY5ZK5VC5k793m8FP7SHNT7u7T3\/aF1551qyPxNmPue5HXPzNue3SVkptqzQZ98P2\/7iIZ9vngYu1r9VUImAAiZJUoXoLQvmtl1yH0XCa17nlfvGb5mn+1TIPxLZfvTB4S4V9QC5DN6bHdBZZuf9HjMdLedb4fWxTa\/ytvemJ9D8uNYB9VCZqqPhN5neFPY+1Huv4f1CJm3DwiPKaSmOZmfH6LfH1t5\/M1G8DUnZALADAiZIYev9Dze33D7w2P9uRJOu90Z56eV7X8d6+bQe0Hy9Fjti17S4ubpbjt39tg+9ftVoXXP8Gqo+0Flm3Rm8DE5bKYQ\/bzchnR\/9rSs0e6Vbb8XWsPm6eKhpWsh8\/zctnSXnyfmx0uB8yGhtdj7Zbmdu9T6px0y088+FVpTEdKSSg+tBN7U\/o+G1hna1N5lhjheB4SxdUBnjeDrTcgEgBkSMl+dn8eVDbdPF8+cO6DOqGx\/doPtX5O33brBtqk2rbUphcc0\/P71HOraATYtafTD0LqKuyoNY6cliK6PdUpoDc23peWcvpZD5cqhdUHOTWFs2D79759ifTh0X6Nylfy722den5HD7H8q+9+d25XC6gJDHq9vhIktoC9kAoCQOV+sHMbOSs6eBsdmgRz01gljw+HDWL7LfumM4Wo5VDa5DeSqXf4tDa+vG1pnNBce53NbuhJUtxQyAUDILN2Z+bnMcWiLtnc+Tj8c4ecgZALADAqZm4TWVdfpYpiFHd5i\/Ty\/5p4tZAKAkDkqPpOfz0sc3iJtm49Pujp+gRF+HkImAMywkLl6aC25k65aXtQhLk66M1A62\/yEEX8eQiYAzLCQmeyfn9NbHOKivCAfl49Og+ciZALADAyZ6SrqtMD63dPseY2ydKV8WkLpktBa91PIBAAhcyQtmQPNpbGWcqinVFr\/M93RKN0pac1p8pyETACYoSEzSfMz011y0sLfizjcU+ajOWBOp9eYkAkAMzhkJmnR8XS7xg843FNiv1jXhO53FRIyAUDIHGnpLOaKDveUhfzpOF1ByAQAIROETAAQMkHIBAAhE4RMAEDIBCETAIRMEDIBQMgEIRMAhEwhE4RMABAyQcgEACEThEwAEDIBIRMAhEwQMgFAyAQhEwCETEDIBAAhE4RMABAyQcgEACETEDIBQMgEIRMAhEwQMgFAyAQhU8gEACEThEwAEDJByAQAIROETABAyAQhEwCETBAyAUDIBCETAIRMIROETAAQMkHIBAAhcyZ5WqyPxDo11oGxtou1QJ\/t08+eGOsdeb9z876HNDwuS8baPdZhsU6PdVas42O9NNYyDoeQCQBC5mhbONYZlT6t1i9jrV7bfqFYB8T6S4992vWVWCt3+X0rxTo51j\/77Jt+9qZYsxweIRMAhMzRdGbuy7+G1lnFeuD8bqwF87azY11a+dkVOTDOifX+WL+v7XtZaJ2xbHte\/j3pZ\/fH+lFonb1MZ0NPqR3bVB90eIRMABAyR8+zcj\/+O9amlX+\/shb2XhDr0ZWA+LNY23R5vBUq27Tr6PyzvXKwTP+WhsbX67L\/1mHus5rbOkxCJgAImaPlW7kfj6v9+wW1oPfrWP\/I\/53OPC7U5zGPr+17XayX5YB5d2jNueznktr+pzlMQiYACJmjY7NYD+Twt3btZ78M3edKHtvgcQ\/ost\/9uZ7bYP8v1Pb9lUMlZAKAkDk6js59+KPavy8S684uQfGiMDY3s5+DegTUoxq26\/zaftc7VEImAAiZo+Oa3IeH1P798V0C4h2h+xzKbg7vsv8lObw28esw9xXuCJkAIGSOgPUqfbhF7WcHdwmJ+w3x2F+q7XtfrEc03HexWPfW9v+MwyVkAoCQORrS+pXnxHpfl5\/Vh6tT6Fuq4eOmBdpvre3\/4yHa1e3q8oMdLiETAITM0ZbmXN4+gZC4eZeQeOQQ+3cban+cwyJkAoCQOdq2nGBIfH2X\/Z85xP6X1\/a9KfS\/tSVCJgAImSPgDRMMiZ+v7ZuCTNP7kK\/f5Xef4pAImQAgZI6+ekhMF+0s23DfdJ\/x+t1+fjbE7+629NFODomQCQBC5mhLIfFvtZD38yH2f1gY3+LtbT+o7ZvW6lzcYREyAUDIHG2bTjAkvrbL\/js33HeNMHZf83Z90SERMgFAyBx9r5lASEw+E+Yeal+u4b77d\/ndL+6yXZq3mdb1dDGQkAkAQuaIOCvMvT7mMkPsf2Nt\/58Mse8Pa\/veFWvp2jZpbc9\/558\/wuESMgFAyBwNN9SC3g+H2LfbleHvbbjvQ0KzofID8s9SmHUmU8gEACFzBMzuEhLfNcT+e3XZf7uG++4dmg2V\/zL\/7IMOl5AJAELmaOgW9J4wxP4fq+37z1iLNNz347V901nN+lzO7fLPHgitC5QQMgFAyBwBZ9SCXrq15EJD7H9Vbf\/zh9i3Ph\/zt7WfL5z\/Lf3sXIdKyAQAIXN0XFELel8aYt9VQ+sMY3X\/Nwyx\/2m1fT9V+\/mx+d9vyb8LIRMAhMwRkK7irl9489oh9t8lzD3UvtkQ+6djeF9l38tiLR9aw+KfzP\/2j1iPc6iETAAQMkfHFmHupYvWHWL\/Q2v7XxNadw8axtFdgmq7bgrDzQ9FyAQAIbMAac7j53J\/3hbr5UPun9avbF\/5fW2sR42jDSmUvjK07nV+V36sP8b6QDBELmQCgJA50pYKE1t\/chldKGQCgJAJQiYAIGSCkAkAQiYImQAgZIKQCQBCppAJQiYACJkgZAKAkAlCJgAImYCQCQBCJgiZACBkgpAJAEImIGQCgJAJQiYACJkgZAKAkAkImQAgZIKQCQBCJgiZACBkgpApZAKAkAlCJgAImSBkAoCQCUImACBkgpAJAEImCJkAIGSCkAkAQqbuACETAIRMEDIBQMgEIRMAhExAyAQAIROETAAQMkHIBAAhExAyAUDIBCETAIRMEDIBQMgEIVPIBAAhE4RMABAyQcgEACEThEwAQMgEIRMAhEwQMgFAyAQhEwCETCEThEwAEDJByAQAIROETAAQMgEhEwCETBAyAUDIBCETAIRMQMgEACEThEwAEDJByAQAIRMQMgFAyAQhEwCETBAyAUDIBCFTdwCAkAlCJgAImSBkAoCQCUImAAiZQiYImQAgZIKQCQBCJgiZACBkAkImAAiZIGQCgJAJQiYACJmAkAkAQiYImQAgZIKQCQBCJiBkAoCQCUImAAiZIGQCgJAJQqaQCQBCJgiZACBkgpAJAEImCJkAgJAJQiYACJkgZAKAkAlCJgAImUImCJkAIGSCkAkAQiYImQAgZAJCJgAImSBkAoCQCUImAAiZgJAJAEImCJkAIGSCkAkAQiYImUImAAiZIGQCgJAJQiYACJkgZAIAQiYImQAwv0Lmu2Pto5RqVO8UMgGgWchUSo2vhEwAqLlOQFBKyASAybZNrC\/GurDAqp5l\/VWhbVSTX7dXjvulI9LmC7yVAMDo+G0lbDxXd8wYP6kc95foDgBAyETIBACETIRMAEDIRMgEABAyETIBACETIRMAEDIRMgEAhEyETABAyETIBACETIRMAAAhEyETABAyETIBACETIRMAQMhEyAQAhEyETABAyETIBAAQMoVMIRMAEDIRMgEAIRMhEwAQMoVMIRMAQMhEyAQAhEyETABAyGTGhMw5sRbUJQCAkMlkhsxUf4h1aKxVdQ0AIGQyXl+thcx23RPrnFjb6SIAQMhkWLNi7RDr3Fj39gicV8U6ONYKugsAEDIZ1uo5TP6hR9i8K9aZsbbQVQCAkMmw0sU\/O8e6MNYDPQLnxbH2ibWE7gIAhEyGtUGsI2Pd0iNs3h7r5Fib6ioAQMhkWIvG2jXWRT3CZjrjeWHeZiHdBQAImQxrq9A6e\/mvHoHzxtA6+7mWrgIAhEyGtWxozcu8tEfYvC\/WeaF19fos3QUAQqaQybDS2c105XmvZZCuDq0r11fUVQAgZMKwVsth8voeYfPu0FqTc2tdBQBCJgwrXfzzvFjfDL2XQfpZrJfHWlx3AYCQCcNKyyB9uE\/Y\/HusD8TaUFcBgJAJTaS5mifEurlHwEx1eaw5sdbVXQAgZEIv6czlu2Nd1ydY\/iXWccEtKgFAyIQ+lou1Z+h\/K8p07\/O0pFFasH1hXQYAQiZ0k+4ClO5xnq4Wv6dHsLw\/tO4SlNbTXEaXAYCQCb2051n+LfQeDr8itOZZrqe7AEDIFDLpJd0iMq1\/eXWfYHlraN1uchvdBQAImfTSZJ5lWlzdPEsAQMikrwVD617j6RaRd4beZy0vjnVAcJtIAEDIpI\/2PMu\/9gmWV4bWPMv1dRcAIGTSy5qhNc\/yqj7BMt2Npz3PcpYuAwCETLpZNgw3z3IRXQYACJl0M+w8y5V0GQAgZNLLZrGODP3nWV6ft5mtuwAAIZNeHhpa8yyvDOZZAgBCJhNgniUAIGQyKarzLP8VBs+zXFmXAQBCJr2051ne1CdY\/iFvs4HuAgCETHp5SGidjbykT7C8LbTOaqazm+ZZAgBCJl0tE1rzLNM8yvt6BMt78s\/TdovrMgBAyKQb8ywBACGTSbNlrONC\/3mWv4t1WLCeJQAgZDLAKrG+1idYpror1r7BPEsAQMhkCAvE2j7WabH+0Sds\/irWgbFW12UAgJDJMBaLtXOsc2Pd2yNs3h\/rolj7xFpKlwEAQibDWCEHyYtC77Ob\/86BNAXThXQZACBkMoxNYs2JdV2fwHlDrBNibaG7AAAhk2Gk+ZvbxDo51h19AudlsQ6OtZouAwCETIaR5m\/uGlqLsfebv3lhaC3Wbv4mACBkMpQVw3DzNxfUZQCAkMkwNg2t+Zu\/7xM4\/xxa8zcfqbsAACGTYQw7f3NVXQYACJkMozp\/8z89wuZ9YWz+5pK6DAAQMhnGGrEOiHVx6H12M9156MxYOwS3swQAhEyGtFlozd+8vk\/g\/FNozd\/cXHcBAEImw6jO3\/xnMH8TABAymWSLh+Hmby6hywAAIZNhtOdv\/iL0Prt5ezB\/EwAQMhmnNH\/zyFh\/6RM4\/5i32VB3AQBCJsNoOn8zXb2ezoKuossAQMgUMhmG+ZsAgJDJPPWQ0DpzeUnofXbztmD+JgAImTBOW8U6PtZNfQLntaG1Ruds3QUAQiYMY8HQOmuZzl7+Kwyev7myLgMAIROaSPdNf2Gs7\/YJmWne5jdj7RYMowOAkAk9pKD4xFinhtY6mr3C5W9ivTm05nMCAEImdLV2aN128to+wfKW0Fr+aBvdBQBCJvSyfKx9Yl0U64EewfKuWOfG2jnWwroMAIRM6GbRHBhTcLynR7C8PwfPFECX1mUAIGQKmfSSliY6IdbNofdw+OWhtTTRuroLABAy6WWt0JpneU2fYHlrMM8SABAyGWC50LoNZLodZL95lul2kum2kuZZAgBCJl0NO89yGV0GAAiZ9NKeZ\/m30Hs4\/IrQmme5nu4CAIRMemnPs7w6mGcJAAiZTECTeZZ3B\/MsAQAhkwEWjLVDrDNj3Rl6n7W8ONYBsVbUZQCAkEkv7XmWf+0TLK8MrXmW6+suAEDIpJc1Q2ue5VV9guXfw9g8y1m6DAAQMulm2TDcPMtFdBkAIGTSzbDzLFfSZQCAkEkvm8U6MtZNfYLl9Xmb2boLABAy6eWhoXU28ld9guVtoXVWM53dNM8SABAy6co8SwBAyGRSLBRrp1jnxLqrR7BMgTPdN\/w1sZbXZQCAkEkvq4TB61mm0PnuYD1LAEDIZAgbhdai6Nf2CZo35jDqPuIAgJDJUNJFO0+M9bFYt\/cJnL+O9aZYa+gyAEDIZBiLxto51rmx7u0RNu8PrTma+8RaWpcBAEImw1ghB8mLQu+zm\/\/OgTQF04V0GQAgZDKMjUNr\/ubv+gTOG0Jr\/uaWugsAEDIZxgKhdRHQybH+0SdwXhbr4Fir6zJgotaMtYluYBzSkNxjdYOQKWSOnMXCcPM3l9Jl1KT72zvzPf2kkY91J+vBtoj1l1gv1q+MQ7rX8a2x3qgrhEwhc6S\/LJq\/OW+kOyulM8IPj\/XkWC+K9YJp8LzS+qtp+ayDHOJpZ7dYt4TWqhUTsn1oDZkcqk+ZgG3zB9A7dIWQqTtGXhrVmhPruj6B88+hNX9zC901l+eH1j3j\/xjrXz367\/oRf46bx7op1ocd7mkrTZdJN3R4yngfIC3ke1tora02GW9Kx8f6ZKzzY\/041tWxLnWcZoyX5DfP1+oKIZNpoTp\/844weP7marrsv77ep6\/a9ckRfn7prOyfYp2XXyNMX6flL0pbDbvjcrGuinVNrCUnoSE79fm2y8zxqdCa27WtrhAymVbS\/M1dc7DoNX\/zvlgXxtpzkj5XRtVHQ+tM5q19QuY+I\/w6SCeR\/hZr1Rn+N7FwaJ1cSys2fHGa9sdSOSdeH1rzbxs7PdYDsZ4wiY1ZKH\/DOUPInLGWy28+6QVpkWchk+lpxTB4\/maahnVmaM3fXHAG99Wysf6vS\/+M6oW278vt38WfQXhz7Zh+bpo+zyfm53du0x2ekgPmZ+dRgzYQMme0\/fOxP0FXCJlMe5uG1vzN34fB8zcfOUP76Ie1\/rg5tG4FOmrShUvpLPaPvOz\/6+zacb1yGj\/XL+Xn+JxBGy6YO+K+efhNahkhc0ZLV1Jen9+MNtQdQiYzwrDzN2fKUOsSse6u9cEXRvS5fD+3f3sv9\/\/avXZcj5jmXybTyck0zXLhJp1y3jxszNJC5oz31nz8Pz0Nn9vC+Qva42M9LrQuoFtwhh9vIZOqxcPY\/M3\/hJk9f\/NpXZ77KC731h4y\/YWXd4f0Ok8Xcb1+BnwOXJhfA6\/otUE6Pf+rvNHzhUzmoVVi3RNaZzPXnAbPZ7n8JvK90P2ih3T13Tlh5g4HCpn0skasA3I46XV28\/bQmr+5QxjNYeR+jujyfB81gs+jfcX867ykZ6xd8mvgt73+TrfOG\/w9tIY0hUzmx5vS20f4OSyUw+VtXT4o7spVPzvzaiETutostOZvXt8ncKalcdL8zc2nyXP+Se35\/TOM3kL264XWUGk6K72il\/GMtWh+\/abX8eO7bfChMOQVQkImE9C+AGhUh1fSh9xvah8QKUztFzrv55z+e4\/QWni5HTQfNx\/bmb5RPmqK63eVPnrTFLdlY396xavO3\/xnGDx\/c5URfZ7ps7A+8vGNEXweh+a2u+CH9gVAR3f7o\/5LmD\/rcwmZJNVVBtYZsbY\/I3RevJCC40E9zkCkeTgfzdu0t\/\/UfGzrwmHwws8zqX7qT2+kDDt\/c4kRem7P6vJcRnFk55Lc9jlerjPea\/Jr4dr6Dx5ReZFvOgm\/KN04PQ2L7R3r2bUQMd6QuXZo3S3mmNCan5MWOX3lkN9i0+ncNAcoLbWwXWjNPd2ySwjeJp992ilvu8CAdu0Y62X5f5teFZkms6f5iGme3pPzG+nGXY5L6sdX5LZM5I4Z6cxbuuDm47n\/3h\/rhaG1mGo\/aR23dA\/ax8R6ZqyX1n6+ce6r54XhhkrSGba\/59fBG0boj+jltQ+79N\/9lm04rcsHya+ETCGToT00tM5c\/rbP8U1TV07O7+Glz988tkv7txuxY7JyaA2Vp7Y\/dZzvT+nzL91y+JTQWvbn\/fk9Nf0srUbz4fw5VD8xln53urDy8fnzsX6\/92Vym9KXjxfHemwYcOVzxfL5RMjj8uf6brWfPzw\/7rO7tK19ciFlk3QR6NZ5u6cOOPmWclIabXl6bu\/ytW3WzCc4Xp77ZyLXM6ydP7PbGW312s9Tuz8QWgvrpzszHtDwcbesvJYf0S193h3GPx8kdepeuUHpsdJtI78W69uhdWeD7+UOHDZkpnD0jRxIzs3flg6JdWpoXVCRvsV+IofHfj7Q401pTiX0vSe0FgtPp\/3T7S\/\/EMbuI\/u8Li+y9O36xljfzN+k74x1f\/73fi+An\/Zoy6ty\/+8bWkOM9+ZvBO015u7Pv+fRQxyXjfMxaIebtFjuYbG+nPsuvSm\/vscbcq87d7T\/KD6X90\/PP13I848w3Jy7b4X5M0VjsuxYOyP5YD5WvaxXeQOu1vlTGDLTMbp9PtcdlZqK33+nkDntpPmbR4axEbhu9ce8TalLpV1ca2\/6\/F18xI7DcyrtH\/YkyIvzZ2taNvGIfNIonfh4c\/47vaqSJ9at7Pe0Hsf7L\/nnKRx+Jvdnyh6XhbGRp7\/Gemeffl66y3t8+8tLskLONbfkz+L78u+oBshn9mjfN3v8zj\/32H7Tymf4F3LWuDBX+573F+aTQE09LQfH9nST7+S\/kwdyztoi98+tOey\/OL9\/PtDlhFw3i+QskB6\/4\/qDMyd4huUhYWxB2d\/mbwz1D7p98hv+G4YImVvkJ5gmRy\/X5edrhLEr4m+qJ+ealNY\/ml8gD9RC5oq544+r\/Z4FK2ei0j7tuxg8Iwe\/3WtnOVcPY\/PPru\/yTaRt\/xySL6m9qN6S+\/HqfMawegFWesG17wxxXz4rOUi6m0Z7TtOhXYJkWnaifXHKiV32f39+\/tfU2rlgDkofy+H8NaFz4nrTb4vHhdFZpPbhYe71\/S4YsM92Pd48XjmFIXPtGRhIXiJkTlvpM2DQvcD\/md+jSjqzuWyXMPODIf+uFy3geRwZxhaQH8br8mfqa\/ts865K31RD5kb5s+Nz+UtrNWTunj\/TTql9uVg0f+7eU8kps7v8zkXzCalPhM4L0G7Ln8dpLdA0ippun3lw5ec3VV5f6SzgB2N9JXSugdorZM7Jn6W\/7RIyt8+Z4kWhcwmk1fMJqAdz+Fy9QZ+\/N\/f5baHzuoBZ+TPpgVxXVh5vdqU9TVcd+nW3TPGz\/I9fHMeL7KGVg5H+d+U+2z6q9kE9KGR+vrLtV\/v8\/jsqL7Imtyv8UC1kfie\/YLpZvRJK\/5i\/Jf2lT6B9Y+WxDx\/QjlmVs3kP5j+A9Ia5TI\/tl6y9EOf0eezHVP6gPtlnuwMqj\/eiPm+I1Suo0xv2RZWAXR\/2Wb3ha+eNldBc8lyqJSp\/0NV5YIPOkKzUJZh+aT5\/2AmZQuZ0k85C7ZY\/E\/rN07wgf1kvcZ3NbvMx3ztgn\/Q8DswnJ9pXc\/8mn0yYKu0LPX42xD6r5zNxTS76\/EaXkFn1hNA5denfYe5Rx6qXVra\/IdZafbZdtXISJn3+HZJPUrWdWnmsdDy6TT07sEHIbEvB9Q+V7XfMWWPzPier2tt+cMBjv7ayba+s85VKDtmq8u9pSP1tofko91fz4\/yw+o+35n\/8yJAvsPRLq6f8t2mwz6uGCJlX1v4IVx1wRizVOxu04YWV7a\/KQW9Wg2T+YP5W8coBZ7yGuY3UUZXtr+kTMKuP\/5\/KC\/tpPV6sl4WxIZiHDnhh31J5br3mn36\/0s70h1Bd83GT\/E0u\/ey0IV4\/u1Yec6uCP9S6rWXX9K4c6YtVmiOW5hXtEvrP7xUyhUy6a19xfkLl\/arXFedzRuB1fnSXtj+tz\/ZPDWMrVNQrfR5sOUXPoz2c\/eUh9nnpgBNHVc8dEDIXqfXF\/g0e89OV7X804D25PVKaRlTTUPt6lZ9tVclOx\/XY\/ylDhMzks7Vs0m\/Ju40r217fZ7sUfqtnfHsF6xeFyVnl4KQwtr7t\/85StR\/4HUM+WPWs3cUN93nYECHzM5Vtbwy9h2F3rGx3YYM27Fx7YW4\/YPuv1Q5mv0S\/YuhcK3HQWasjhvgm2\/b52ptq\/Xe8qXbmbJBPNOiLCyrb\/LpHWH3IkK+fbWvf2kq0Suic09eup4bRIGQKmaNs4xwar+0TLG\/M4XOrEXpeP+0SFLudCZuVP5fvD2N349sln3BJZ+za06FOmaLn0Z4beNIQ+7Tv+HZzGHyx6LoDQuZCtX5crMHvb98Csb3PS\/ps++PKdt\/v8vM0ytVv5O6xQ4bMM0PnmdaFB4TH6nPvte0uoXNOfpMTZOn1tvI4XxPVaQ7\/ndKxdhjf7azSwa1Oun5rw\/2GCZkr5G8In8od0Ev1iqarhwyZ6TT4oNs9nVXZftDZ3gVqB37QMHA1ZL6nYR8+o\/Y7tq39vDqk3uQODPs1+KJRDZnHTtIbVPW4vajQD4O3h+53IFk4jAYhU8gcNWkue5rDf1HofuFc+wv8ufm9fNQWL186zD3M3+11uWAOj+3Royflf18yh5H7K\/v\/eIrfW4b5THh5Zb+fh\/7XUiyST74sNYkhM+TXVr\/w2C1kvmMcfTSRkPmxBttXL87tdQ3Imxrmo1Vqffn4cb4u3lx5jFXaqb79D\/sN8UBPHueZnWFCZlOPrDzmtUOGzF822P5Tle0PHLDtrFq\/DJoPNJ6QuWTtxXVqj\/4dNATTtlMYvIZjNWS+dJKO2yahc55niS7v8gE3KlfDC5lC5qhYNL8vp7+te3oEy\/tzONgnNJt7X6pndHlux3T5uz07\/+w7tbNKX+qy\/xVT8DyWC8OPwiVprnp1kf0H8nFNq56ki0vWHfJk13hC5mG1379Og5A5nrmvEwmZTU7cVf9WVmhwEul3fR5r3VpfjndVhtdVHiNdw\/LfOWPjuer1rbUGrTcfQuasfNBel7\/hpavx0pyQGycQMn84ZMh8dYM2zuuQmVzS44Pz+bXfn+bKnDygvhIGX2BVDZlPmaQ3qeqL+i0Ffhg8pMeH3euFTCGTSZGGuNNQ981h8DzLdabJcz6yy3PcuRa420Hy7NA5arJJGG55nHlpjTDctRD1v8kH+hzzdH3CIQ0+P8cbMneq7ffsBiFzPPeUn0jIbPI50yRkVk\/CpalfvUZut65s9\/cw\/tG6V4batRbVcfh9h3igD9UO0vLzMGSmN5d0Or595dWtOfils19pCOGFMzBkVueJ3lT59wNqvz9NNzh4iHpqg5D56El6k9qo8pglLsi+U483wEeH0SFkCpmlWTu\/11zTJ2TcEsYWVZ9ufhzmPkPbXjpvicp77aldAsHTe\/TX\/lPwPFYc52dXWzqje13ov\/xUWipwi3kQMreq7fe6BsdqPGf2SgiZyfcq2z2mxzbVK+EPm8Dronrm9L\/THNcL45uTeVztIDUdvhgmZKY\/sDQPor3WVPq2u0+Ye57jRIbLRzVkfrmy3x2Vfz+o9vsfNUlvKBfMg8esHrdXFfhhsH\/oPhdskRkQMtNZ3B3mY6VpHbsOWULm6Bh2nuXC07Qf0tzC+k0uLsk\/S0PiPwpjw+fdLhpdKYxd0dyuNJw+FWtmLhYmPk9\/wfxlPl3r8MvQ\/QYgt4TeZ7HHGzIfHuZeo3pQyNxghEPm7DA2WvCVLq+t5Ssn8dII8URuClDNIOu1X9jtfzh0iAc6sHaQml5Z3DRkphdf9XL+9AJcq0FYmSkhs\/rir07mfVHt9+9QcMisrnG2e4EfCId2ecP7yYh9qI03ZL4qlH+LSCGzbDNpnmVT3e5Wc0J+T\/1dDuCHDHiMNGSeRhJPD607siwwhc+nfVw\/PEmPt0j+XDixFjjPmeSQ+ZTafntO85CZ\/hbTBcHti7XTtLi0VuuWOTO0LxZOWWfZCR7D6sWyK7dDUXuJlg8M8UA71g7SJpMcMqvDvukK8NUanhGbCSEzvalUJ06fVfnZerXfv98k\/fHPi5BZvSXZEwr8QDigywfCWUKmkElf7XmWf+tz7NIFdXPCcBd5TAfv6\/HFNV1tfl8oc0Snn\/aUh88MsU8aMT27wXbpc6Z91vY\/ofvZ2vGGzDeG7rdwnK4hM+WWX+UQn67uPz\/nr1tywExTU7aepNfECWFs\/uf\/zpi2F1Qd5qrZ1NjqZO2dJjlkVtdFe3+DF2O3kPnc3IHTLWRuXfsdu9R+\/ovKz84c4pimAPL4+Rgyq3chWK3AN9Ddu3wgHDFDQuZu+czKZFT1jfCmSXxcIbMcaZQpzbO8uk+wvDVM33mWTV3Up38+3yfslKp9R54fDbHPu0NrGbgFG2z74kr\/zJ7EkPn12heeMM1D5leGzAIT8YUwdsHeXP\/4f0M+WHVe5gkN93l4g5C5RO2FM2godZceITNdEPSnaRgyTwqdV+Et1OcP85bQfL5OGpL42HwMme3nfkco677Cbet1+SB42wQeb7X8IbPLCITMyVRdt\/W5U\/D7hcx5I12skoYZ0w0w+s2zTAuI7xqm7zzLppYIvacN1BeXT6unPHEEntOHw9g6nsOEzLTP0xtsu3zof7vi8YTMh9SOwytmQMhMt\/38+Xx6TbRvU95xI5j2jd7\/PuSH\/Sph7HT2raHZFeYfqHTKX3tsk86S3jtEsKveJup3tbMxfxyhkPnzBt\/uUkhoXwj1QI8\/1NSG71Yed58Gz3GT\/Lhbz8eQ2V6m48JQritqx\/Oj43yc9LdyabdveEKmkDlCFsnvn+nD8N+h\/zzLNN1kRV32P0\/p0lfp8ycNXd7Zoy\/PCBO7CGNe26NyzJvOqW2HzK812HalMHb3mwUahMznDxGM2yfWFpgBIfO8MPwKQuOR+rJ9C8uOdT63CcOvd9n2jEogPHtASE1vTtU7HdyXP3y7qQ4rnN\/nMbcLrWUOfpK3\/WflG\/Ob8+PU7RWanSrvFrAGLZC6cu1Fv9YQITPV+wYEhh+EZmuTpbNm14exs5lrDfi2+Ksc1nu5eB4EhT+FiS+XMK+9Msy9pMawdxjZLIxN\/0hTTLYQMoXMEdNknmX6QjZnHJ8hM8W7u\/RZe83hJfJJkYu7bJOCzlKFPqfqaM+24+iHFw7Ydt\/Qf5SvHjLTWeB+83yfFsbulJRGUtcc8Pury2w9aRz9s2PtJNIg1aUJ5wzYdrnQedenDRp+jv0mtC6qPrdS6bM\/TWVJF+28IPS\/VWY\/G1Z+z3bVH6RTzO17kO46jgd+bhi7EOWsLok6\/QG9JSfc+hI76Y8qXan+qto3oXSrqdtC57pNC3UJrTfkg79vbdtH5A\/29lVjaa5hur3S8Tl0Vdvw1XxAX1P5VrNHDnFn1w5kGtpNV74dXHmDWCN\/63hfDmvVx05nrw7PP19rQMhM0xbSnLV05WD9Cq9V8zeh9iToNzU4LmtV2pPO6D61y5eAbXPQTstg1M+6prO26T6kXwydw2FpCOxT+ZjuE8Y3n3LVCf7xzs+Q9ovQbLmLuvR3dUjur\/Yb4MOmoP1CppA5Hmvm97mr+gTLv4exeZazdFlf3w9zTyVYvEtoOrNLP7+34Of1xzDcWsftkHl37oO9urx2Uj+8LOeSn4Tet2euh8yTcnisf6akx0\/T7u6sBK11erxf7pvzwNdqj53acnr+7N2nz5nDzUPrwqJjc1uqdxZKeeLQWvte2iNrpN\/30fwZskPl5NH++fVQ\/1y6POeJA7oE7dRP3wvNL6pMJwDTvNWHD\/laaK9uc2e3Y\/aZ\/MNTxvlCSyn6S7mT7siP94GcmNOw+LdCa0j2YX2eWH2x03Vz8Lqv8k05vaGlNbXS2mKX5W\/YIYfDs2qdVP3D\/GDDzm2fBf1bg20\/l7d9esPHft6AkPme\/M3w2zkIn5v7MP2ef+cXaRpaHma4etH8om4H6+tzqE7H6sr8Qn536D5v84GGz+tp43i9tD\/4U6hesPAPh3Vqr4f0Gn9rnzOam+RwXn2D+V7+MjIVIVnIFDKbWjYMnmeZwoF5lsNZtPJls7q+ZTdL5vfF6rbXFfzc2tdmnD9EyLw7B6cX5BNFV+XP9mNzdkjB9Z78Wb9Mn8fqNidzv3xC6yd5\/xQ8fx3GpvW9PfSeu7nMEEHssT0e4+0N9q1eXX9Tg+2\/kLfdvmHb6texbBzGblN6b\/5yWK27ejxOyh27DfFaOC30WW2gfTvCGyb4jTR9iO0d66j84ktn8Daq\/Dx90B6dzwbtnT900tm0Tfu8Ya2en+icfCbykHwWsVs7t8hhrv5hulIOcINqVuV5DNp21bzt4g0fe8kGIbMtLcuUhvvTENWRua8mstxHmkv1jPwHcEI+u5o+fPvNo12vYY1nzlD7C8GJI\/IhsX6Ye35m+ls5J785fjJ\/kboxzD3napcpPMsjZAqZgyyYP\/DPDL3nBrZHnQ7I76UM5wlhuIsIv1Lb9oHQfe7g0\/P7z05T+NweXwkkSzTYPp2UeFbl\/y+e3xfenU8GvSd\/3jeZz9vrwp+l81m1d+fPu7fnz79BF8EuMMTnXq\/HWq7BvqvUMtNkZ42lamcX07G5OffrQn2+CK2btzmp8l5wd2g2HzX1XXsdzq4Xty5WSdSP854w34x3MfZRlv5Q2lMhthqxdr+l8ofUq9LPj8nfHqeakClk9rJZ\/gL71z6v5evzNuvrrgl5c5e+7bcu4QVh7uWfurk8TP289vQF+rJ+4WIeGu8SRjNFGrq\/J39JGXYdzC3D2EXGRzfYvn1tz039jsPb8kanOzZC5jz0ivx8vz2i7Z+V\/wDTorZp2PxdOXzuUUiwFDKFzF7Ms5waXwpzD0P2uz3t5bXtf9llm40qP99sip\/fy8LUrBQiZPZ3Yu6X749z\/8+F\/lM7qj6Zt317v43Sad7b8x+ApSeEzHnl5\/n5PsPhFzKFzHkuva+nq0t\/EPrPs0zz558dzLOcF19K63P8vztgn7+H7vP\/qw4JY9MYSnifuT6\/vjYSMovRXnT+9HHuf3zD981V8ntIugB8hUEP2r6V3rGOj5A5D7TXKL3AoRcyhcx5pjrP8l\/BPMuptFGXfh80vH1bbfvDaz9PZ0H\/kH+2fyHP8wVh7otahMyp1b7F42\/D8BfYpi9H7aUhPzFg2\/b6541WXkkN+XlOpes4RvPciWH4uyaN8gdferGnM+XW0hMyhcx5J13Ql27b+uM+ATNdUZrWx3tmKH+Fh1H2itB7fcxeLqltX1+Ye58wNrVh+YKea1q5JJ3NfPR8fJ1X+2llL7cO6UKe9uLox4Xhpr8cFsaWI9p0wO9IefE3YYhRkIfnb78XBHNy5oV0sUu69eO7Ki+AVGmqQlovK10NtuU0fN5vKeybt5ApZM4EaWm4dJXtdaH\/xWrpbMQj\/clMuo+HuacmDLoK+721fT5S+dnGYWw4\/cDCnmua85umBqQ5pIvMo9+Rpn+kq9PT2trfrPXThTmA71RY+J5KacnDK8PYNI1BFwBtlb8stJfO6rfIfsqHX89fWIe+E2BaBiitB\/gGx2jS\/SIMXudqun0YptCcrnI73eGfrxbI32DbNRVvvFMdMresPP+Z\/n7WvnPPzX3ee9KVwnOCkazJcmWtf5vcXjBNX\/hTLZimqVVHVgLmt0L\/WyJOlW3ze\/0x8+jxdwzN1op8tpfe\/6TlidIi8u0LytKNaj4RxhaWT19WTqn8PN3p6G0Nvgy1p1e+ZLwNOyS\/WHZwjCbVY3Of9qvHTKPnm+5S8Lv8priowz\/jTHXIpPuHTpoffW7ovP9xt3uQpw+hpXXZuFVvTZiGkp\/ZcL9Nan871bqg8GOyV2jdme7F8+CxV2rw+ZnK0Hl36YY46ULAdA\/3z4fW2d90V790d6F018Omtz3ePn\/5mTPRBqV5PbeH0VrPkHKkOyj8Mr+YBUwhU8gsz\/I5SF4Uel99flcOpCmYLqTLhpKmK6SzRKeG1sLlw0hzZdOo4vG5\/9NjpDN0ozCNLd0RKl1t\/HQvgWknrb+ZLk47aLIe8Lmh+y0RYZA0v\/dtwYUFQqaQOQo2zmcmrg29hyHTXa1OcOKBBrYPrfWEmV7SF4gX6gZAyGS82vM3bwnmbwIAQiaTLK092J6\/eW8YPH9zKV0GAAiZDGOFMDZ\/s9fZzX8H8zcBACGTcUpXP88JrZUjegXOG0JryH1L3QUACJkMI63VuE2sk0PnzSW6zd88OLSWNAMAEDJpzPxNAEDIZJ4yfxMAEDKZp9rzN\/vdP\/3PoTV\/cwvdBQAImQyjOn\/zjmD+JgAgZDLJ0vzNdOeQ80LrPtfdwuZ9oXVv5T1jLanLAAAhk2GsHuuA0H\/+Zrpy\/czQmr\/pNrUAgJDJUDYNrfmbv+8TOP8UWvM3N9ddACBkCpkMY9j5m6vqMgAQMmEYiwfzNwEAIZN56CGx3hzrN6H32c3bYp0a64mxZukyABAyYRiPjPX1PmEzVZrbuY+wCQBCJgzibkIAgJDJpEjzMl8U6\/zQf15mOrP5klhL6DIAEDKhm+oV5v8Ig68wX12XAYCQCb1sHFprZf6uT7C8IbTWytxSdwGAkClk0ot5lgCAkMmkWDQHxhQc7+0RLO\/PwTMF0KV1GQAgZNLLVqE11H1L6D\/Pck6sdXQXACBk0stGOTRe2ydY3pjD5za6CwAQMull+TA2z\/KBHsHyrmCeJQAgZDJAdZ7lPcE8SwBAyGQC2vMsbw6D51muq7sAACGTXtYOrUXQr+kTLG8NrcXUzbMEAIRMelou1p6xLgz951meF2vXWAvrMgBAyKSbYedZLqPLAAAhk17a8yz\/FnoPh18eWvMs19NdAICQSS9rhdY8y6uDeZYAgJDJBJhnCQAImUyKBWPtEOvMWHeG\/vMsD4i1oi4DAIRMemnPs\/xr6D0cfkVozbNcX3cBAEImvaSLct4Z+s+zTBf3fDDWo3UXACBk0suyYfA8y7vD2DzLRXQZACBk0s8qsc4Ovde0bF\/I88ZgTUsAQMhkSCvE2i\/W\/\/UJm\/+OdVasHWMtpMsAACGTYbTXv3SfcQBAyGSeaF9hfnMYfCefdXUXACBkMoxh70m+tC4DAIRMhrF8DpIpUPa768+5OZi66w8AIGQylLVDa\/7mtaH3cPotwfxNAEDIZJyazN+8LLTmb66juwAAIZNhVOdv3hvM3wQAhEwm2bDzN62\/CQAImQxl49AaKv9d6D2cfkNoDblvqbsAACGTYSwQWhcBpTB5Sxg8f3NtXQYACJkMY7Ew3PzNpXQZACBkMowVwtj8zX73Tzd\/EwAQMhmXTUJrqPy6MHj+5ha6CwAQMhlGe\/5mWsz9H6H\/\/M20KPxqugwAEDIZRpq\/uWus80L\/+ZsXxtozmL8JAAiZDGnFMNz8zQV1GQAImUImw9g0DJ6\/+efQmr\/5SN0FAEImDKM6f\/OOYP4mACBkMsmWjPXSWN+IdV+PsPmfWF+NtVusxXUZAAiZMIw1Yh0U6zeh99nN22N9LNZ2sWbpMgAQMmGQ9pzN3wdzNgFAyNQdTMDqsQ6MdUmfYJnW3Twt1pNCaz4nACBkwlysowkACJlMCleUAwBCJpOmyb3N2\/Ms3dscAIRMIZOeVgjD3eVnIV0GAAiZdLNYDowpOPabZ3lRDqDmWQIAQiZdtedZpqHuW0L\/eZZzYq2tywAAIZNeNs6h8Xd9guUNOXxuqbsAACGTXpYPg+dZ3hXMswQAhEwGWDQMN89yaV0GAAiZ9LJVaD7Pch3dBQAImfSyUQ6N1\/YJljfm8LmN7gIAhEx6qc6zfCAMnme5sC4DAIRMuqnOs7wnmGcJAAiZTEB7nuXNofdw+OWhNWS+ru4CAIRMekmLnx8c65o+wfLWWCcH8ywBACGTPpaLtWesC0P\/eZbnxdo1mGcJAAiZ9DDsPMtldBkAIGTSS3ue5d9C7+HwK0JrnuV6ugsAEDLpZf0weD3Lv+bw+SjdBQAImfSThsQ\/FHrPs0z1h1jPDu4bDgAImQwpDZGnq8Hv7BE0b4h1ZKyH6ioAQMhkWCvGOij0Xp4oXQB0TqztdBUAIGQyrFmxdgitK8vv7RE4rwqt9TJX0F0AgJDJsFbPYfIPoff6mGfG2kJXAQBCJsNaMLTWzey3IPvFobVm5hK6CwAQMhnWBqF1IdAtPcLm7aF1IdGmugoAEDIZVloCKd1G8qIeYTOd8bwwb2MJJABAyGRo7WWQ\/tUjcN4YWmc\/19JVAICQybCWDa15mZf2CJv3xTovtK5en6W7AAAhk2FtE\/ovg3R1aF25vqKuAgCETIa1Rqx3xvpzj7CZ7jT0sWAoHQAQMhmHdPHP82J9M3RfBukluggAEDKZiLQM0vtD54VCQiYAIGQyKX4iZAIAQiZCJgAgZCJkAgBCppApZAIACJkImQCAkImQCQAImQiZAABCJkImACBkImQCAEImQiYAgJCJkAkACJkImQCAkImQCQAgZCJkAgBCJkImACBkImQCAAiZCJkAgJCJkAkACJkImQAAQqaQKWQCAEImQiYA47ForPWUmo91dSVsvFp\/zJi6pHLc36g\/ZnQt6qMXZk7I\/F3lzV8ppZSal\/UoH70wc+ziTU8ppZSQCcwL3\/fGp5RSSsgEJlv6o7+\/8iZwSKzlp7hWjnVFpU0XFdCmVMdU2nRPrC0LaNO2se6rtOutBbRppdB5kc\/PY61QQLuOqB2\/RxXQpsfG+k+lXe8ooE0rxvplpU2\/yv821e06rNKm1GePL6BNW+bXUrtd7ymgTelvrXqx1aX5b7KE99AFfeTCzHNG5Q3pb7GWK6BNO9a+AT+vgDYtFeuGSps+U8jxO7XSpr\/nQDDVnlw7frsV0KbFY\/2h0qYvFHL8PlJp0x2xVi2gTdvVjt9LC2jTIrGurbTpq4Ucv+MrbfpnrNULaNPjYj1QadcrfMwBU+Uhsf5VeUM6upB2XVBpU7pIqYQrE19R+\/DdpoA2rRLrH5U2HV\/I8Tuv0qY\/xlqigDbtUTt+TymgTenM\/e2VNp1YyPH7QqVNf461ZAFt2q12\/J5WQJvSGbpbKm06tZDjd06lTTfFWsZHHTBV5oTOocQNCmjTpqFzKPHAAtq0QKyLK236Rf63qXZo6BxK3LSANm0U697QORVjqs2K9dNKmy4p5Pi9udKmNP3hYQW0KS05c3foHMovwQ8rbbos1kIFtOmASpvS9KOtCmjTmrHuDJ1D+QBToj6U+LlC2nVSpU23hdbcoqm2feg8m1LCAtOLxfp9pU1fKeT4fTB0DgWXMJSY5vJVhxL3KqBNaSi4uo7otwo5fu+vtOnOHFym2pahcx75PgW0aaEceNtt+k4hx686D\/nfsdb2UQdMlT1r4emJBbSpPpT44UL66ouhvKHE3UP5Q4mnFHL8zg2dQ4lLF9Cm+pJizyigTWl+9s2VNn2ikOP3qUqb\/hpr2QLatHPt+D27gDal1\/WNlTZ92sccMFXSUOLPKm9I6QrTEoYSDw6dQ4mbFdCmEocS0\/G7qNKmX4cyruZ8Y+gcStyygDatG+uuSrsOK+RvsLqk2OWhjKHg19WOXwnL0KR55NWh4CMKOX7frLQpXaS0SAFt2qfSpnQGf2sfdcBUqQ8l7llAm9Ib9TWVNp1fSF99IHReVbpGAW16bO34vbKANi0c66pKm75dyPE7KnQOJa5VQJu2CJ1DwfsW0KYUdKtLUn2vkOP3ntA5j3z9Atq0eehcUuyAAtq0YP7C2W7Tj\/MXUoAp8blQ3lDwrqFzKOrpBbSpPpR4WiHH76zQOZRYwlWlz6kdv50KaFMaSvxLpU2fLOT4WVKsGUuKNVfikmLADJWGEqtDwXMKadcPgqHEJh4aOocSDy\/k+FWHEq8MrTOcU+3VoXMo8TEFtKm+pNgxhRy\/EpcUe3ktPG1bQJvqS4qdUMjxK3FJMWCGOjqUP5T4mgLaVOpQ4nsrbUpzD9cpoE31ocTXF9CmNJT4m0qb\/i+UMZQ4J5S3pNgmoXNJsYMKaJMlxZqrLyn2Vh9zwFRJQ4k3Vd6QziikXZ8MnUOJJVxV+qzQeTbluQW0KQ0lVq8qPbuQ4\/fxUP5Q4q4FtMmSYs1tHywp1lSJS4oBM9S+oXMo8dEFtKk+lHhUIX1V4lDi3rXjV8LdidItE6tDiccVcvzOr7TpuhwSppolxZqzpFgzpS4pBsxApQ4lHhY6hxJnF9CmUbg70U8KOX5vq7QpDd9tWECbNg6dQ4kHF9CmUpcUe0twd6Kmx6\/EuxO9IZS3pBgwQz2l9m38BQW0KQ0l\/rHSpnML6atRGEp8cQFtSmcJr6+06UuFHL8Phc6hxNUKaFN9SbGXFdCmUpcUK\/HuRPUlxV5VQJvqS4qVcnciYIb6WugcSixhKHivUOZVpdWhxA8Vcvy+XGnTn0IZV5W+uHb8nlpAm1aIdWulTScVcvwsKdaMJcWaK3FJMWCGSleVVocS31xAm9Kw4c9D2XcnSsPnJdydKC1SXR1KfFsBbarfnehXoYy7Ex0YOoeCH15Amywp1pwlxZorcUkxYIY6MZQ3lPiE0DkUtUcBbSp1KPG40Hl3ohKuKn1c7fjtXcjxK\/HuRJYUa8aSYs2VuKQYMEPVhxI\/Uki7Ph\/KG0p8YShvKLF+VenHCjl+Z4fyhhKfVzt+zyqgTaUuKXZmKH9JsVLuTlTikmIfC+UtKQbMUG8K5Q0l1q8qfWchfVUdSizlqtLXh86hxK0KaFO6OKM6lPjeQo7fhZU2XRHKGEq0pFhzlhRrptQlxYAZKA0lXl15Q\/pWIe06NnQOJZZwVemWoXMo8dUFtKk+lPjdQo7f4aFzKHHtAtr0yNrxe10BbbKkWHOWFGuuxCXFgBnq+aFzKOqZBbSpflXp6YX0VYl3J9qpdvyeU0Cb6kOJZxVy\/E4L5Q0ljsKSYp8t5PhZUqyZ+pJiX\/YxB0yl74XyhhJfG8q7qrQ+lHhkIcfvG5U2XRvKGEp8VegcSty6gDalocQ7Ku16fyHHz5JizdTvTlTKkmJfCpYUA+ipPpS4XwFtSkOJl1ba9KNQxlDUu0P5Q4lvKKBNaSjxF5U2\/biQ4\/eO2vErYSjRkmLNWVKsmVKXFANmqNMrb0jpqvMVCmjTM2vfxp9fQJvSWYoS7050SugcCi5hKPFJteO3ewFtSkPB11fa9MVCjp8lxZqxpFhzJS4pBsxQa4TOoeBjC2nX10N5V5XuFcq\/O9EHCzl+XwnlDSW+pHb8diigTfUlxT5ayPErcUmxEu9OlJYUq84j\/3ghx6\/EJcWAGeqdoXMocYMC2pSGEqtDwW8qoE2lDiW+NZQ5lHhPpV2HFtCmNJT4o9A5lFjC8RuFJcXeVch7VYl3JypxSbH63YlKWVIMmIHSUOIfKm9Iny+kXR+ttCmtAbdqAW1KF7JUh6JeWkCb0lneayttOq+Q43dCKG8o8fG14\/fyAtpkSbHmLCnWXIlLigEz1B6hcyjqKQW0qX5V6YmF9NUXQnlDibvVjt\/TCmhT\/e5EpxZy\/D5TaVO6+04JQ4klLim2TOi8O9HphRw\/S4o1U+qSYsAMlIYSf1p5Q7oklDGU+ObQOZT4sALaVOrdiX4Yyrs70QGhvKHEdULrzE67Xe8p5Ph9K5S3pNh+tePn7kS9lbik2CtDeXcnAmao+lDiXgW0qX5V6dcK6asShxIfUzt++xTQphSUrqq06TuFHL8jasevxLsTvbaANpW6pNgo3J3ojQW0qb6kWCl3JwJmqHMrb0g3hDKGgl8QOoeinlFAm+p3J\/pEIcfv06HzqtIShhKfXTt+OxfQpqVj\/aXSpk8VcvxOD5YUa8KSYs2VuKQYMEOtGzqHEg8rpF3fD+VdVVri3YnqV5UeUcjx+2boHEpcpIA27RPKuzuRJcWa2ytYUqypEpcUA2aoo0LnUOJaBbRpi9A5lLhvAW0qdSjxPaFzKHH9Atq0eWjNqW2364BCjt+vQ3l3J7KkWDOlLil2SLCkGEBP9aHEMwtp1xmhvKtKdwzlDSXWryo9p5Djd2roHEpcsYA2Pbl2\/HYroE2lLin2kdB5d6ISlhQr9e5EJS4pdnwob0kxYIZ6TegcSnxMAW2qX1V6dCF9dUEobyjxFbXwVMJVpWko8R+VNh1fyPH7aqVNaZ5fCUOJlhRrzpJizZS6pBgwA6WhxN9U3pD+L5QxlDgnlD+UeFABbUrDhhdX2vTTQo7foaFzKHHTAtq0Uax7K+06pIA2WVKsOUuKNVfikmLADFUfSty1gDbVhxI\/V0hfVe9OdFso46rS7WvH7yUFtGmxWL+vtOkrhRy\/D4bOoeAS7060VwFtcnei5kpdUuzKUN6SYsAMdX7lDem6HBKm2stq4emJBbSpPpT44UKO3xdD51BiCUPBL6odv6cW0Kb6UOLJhRw\/S4o1U+qSYp8K5S8p9mwfc8BU2Th0DiW+pYA2pWHDn4Xyrip9SyhvKDFdVVodSnx7AW1KQ8EXVdr0q9CanjHV3lg7fo8ooE2WFGvOkmLNlbikGDBDfTh0DiWuVkCb6leV7llAm0q9O9EHQudVpWsU0KbH1o7fKwtoU\/3uRN8u5PhZUqwZS4o1V+KSYsAMle46cmvlDemkQtr1uVDeVaWjMJR4WiHH76zQOZS4TAFtek7t+O1UQJvqS4p9spDjV19SbLkC2lTi3YnSkmI3VNr0mUKOX4lLigEz1EGhcyjx4QW0KQ0lVoeC5xTSVz8I5Q0l7h\/Ku6q0PpT4vkKO34WVNqWLJBYuoE2WFGvOkmLNlLqkGDAD1a8qLWUo8ZhQ\/lDiawpoUwq6v6206buFHL\/3VdqU5h6uU0Cb6kOJ+xfQJkuKNTcKS4r9IpQxj7zEJcWAGep5tW\/jOxbQpjSUeFOlTWcU0ldnhvLuTvSs2vF7bgFtqt+d6OxCjt\/HQ\/l3J7KkWG\/VJcXS2boS7k60fbCkGEBf1aHEK0IZQ4n7hs6hxEcX0Kb6UOJRhRy\/EocS964dvxKGElcNnUOJHyjk+JW4pNiewZJiTZW4pNjuobwlxYAZ6pGhcyj4tQW0qdSrSueEzqHE2QW0KQ2HVYcS31hAm+pDiT8p5Pi9vdKmtIzXhgW0qcQlxdKxsqRYM\/W7E1lSDKDmE5U3pHTV+QoFtOkptW\/juxTQpjSU+MdKmz5byPE7OZR3d6In1Y7fiwo5ftdX2vSlQo6fJcWasaRYcyUuKQbMUKvmD7f2G9L7C2nX10PnUGIJQ8El3p0oXVVaHUr8UCHH78uVNv0plDGU+OJQ3lCiJcWas6RYcyUuKQbMUO8IZV5VWh1KfHMBbSr17kQHh86rSjcroE31uxO9rYA2lTqUeGCwpFhTJd6d6HXBkmIAPdWvKv1CIe06MXQOJZZwVWl9KHGPAtqUhhKvrbTpq4Ucv+NC51Di6gW06XG14\/eKQo5fiUuKHR0sKdZEqUuKvTeUt6QYMEO9NHQORe1QQJvqQ4kfKaSvPh\/KG0p8Ye34Pb2ANi0f65ZKmz5WyPE7p9KmtGRWCUOJlhRrzpJizZS6pBgwA6WhxJ9W3pAuCWUMBb8plDeUWL+q9F2FHMPq3YkuC2UMJb4+lDeUuGboHEp8byHHz5Jizbg7UXMlLikGzFCPD51DiS8voE31ocRvFdJX9bsTrVlAm7YMnUOJry6gTaUOJR4eOocS1y6gTfUlxV5XQJtG5e5EJS4pdmABbSp1STFghvpM6BxKXLqANu0SyruqtD6UeHohx++TofOq0hKGEneuHb9nF9Cm+lDipws5fqcFS4o1UeqSYieF8pYU2z6Ut6QYMEOlq0rvqrwhvbuQdtWvKi1hKHG\/0DkUXOJQ4pGFHL9vVNqULlIqYSjxVaFzKHHrAtpkSbHmLCnWXIlLigEz1JGhcyi4hKHE+lWl+xXQplLvTvTuUP5Q4hsKaFMaSvxFpU0\/LuT41ZcUK+HuRJYUa86SYgB9pKHgv1TekD5ZSLtOD4YSm0hnKapDiZ8p5PidUmnT32OtWECb6ncn2r2ANtXvTmRJsd5G4e5ElhQDqHl16BxKfEIBbUq3bKsOBR9TSF9VhxJLuar05bXwtG0BbUpDif+otOmEQo7fVypt+mMoYyjRkmLNlXh3IkuKAfRR6lWl7wpl3p2oOhT8pgLalIYNf15p0y9CGUOJbw3lDSVuFDqHgt9aQJvS39qPgiXFmrCkWHMlLikGzFBPrn0bf2EBbarfnejzhfTVR0J5Q4nb1Y7fSwto02Kxfl9p03mFHL8TQnlDiZYUa66+pFgJdyeypBjAAF+tvCH9PoeEqbZHKO+q0pVDa8mSdptOLOT4fSGUN5S4W+34Pa2ANtWHEk8p5PiVuKTY82vH75kFtGkUlhQr5e5EO9WO33N8zAFTpT6UeHABbUpDiSVeVfrm0DmU+LAC2lQfSnxHIa+rH4byhhLfEDqHErcsoE3rBEuKNWVJseZKXFIMmKE+FDqHglcroE31ocSXFdCmUocS319pU7qdYgl3J3ps7fi9qoA2paB0VaVN3ynk+FlSrBlLijVX4pJiwAxVH0o8uZB2fbbSphtCGUPBJd6daLlYN1fa9IlCjt+nQ3l3J3p27fjtXECb6kuKfaqQ43d6sKRYE\/Ulxc4t5PjVlxRbKQBMkTeG8q4qrd+daE4hfVUfSixhKPi1oXMo8VEFtOmhoXVmtd2uwws5ft8MnUOJixTQpn2CJcWaKvHuRHuFMpcUq96dqJQlxYAZqD6U+O1C2nVUKO+q0vpQ4r4FtCkNJVavKr0olDGU+J5Km9Lc0fULaNPm+YtUu12vL+T4WVKsGUuKNVfikmLADPXc2rfxZxXQpvpQ4pmF9NUZofOq0uUKaNOOteP3vALatFSsGyttOqeQ4\/exUN7diSwp1pwlxZpJZ3mvDeUtKQbMUBdW3pCuDGVcVfqa0DmU+JgC2lS\/qrSUocQLQnl3J3pF7cN3mwLaVL870fGFHL9RWFLsKQW0qb6kWCl3J7KkGEAf9aHE\/Qtok6HE5upDiQcV0KY0bHhxpU0\/LeT4HVppU1rGa8P\/b+\/sURAGYzAcN\/82obt4DRcnB8Fdhy5ewkE8hyCINxDBO9hjCOI9JCSF6AX6wJfnBC9JafN9Td4ANP1biu0BmnqeM\/p2IqKl2BHyXidaiiVJUigX4U26LoOml9hNYteM\/Lai7TfcQmJ1Et6k60J+94cTbHoG\/iy1h4QaEqtoKXaDaJoHTW8vprom\/grWwnwHiVW0FHtANEVLsQ\/kQJUkSaHoyr1GGPY8Ee3n00b2PkhT7YXcFKSp8vytYPnTA8vBizsKG7E+wxlI08Tzt4bl7yp2ez8EaVILozusaNL+7KfY5iQSZ7FBvHF+4srgC5\/JNcL9sQ8jAAAAAElFTkSuQmCC","width":209}
%---
%[text:image:9e46]
%   data: {"align":"baseline","height":201,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAy0AAAGzCAYAAAAi4\/gcAABfQ0lEQVR42u2dB7gU1dmAD11UQMQuIEoRRYwRYy+oWKJgbNiwoEZjb8GukSQioEQTjbEl9t5i7y32GruAiqioiApiQREp\/\/ky3\/z77TBt9+7ee\/fe932e74G7c2Z29kw775zmHAAA1IW\/+fgd2QAAAAAAAEgLAAAAAAAA0gIAAAAAAEgLAAAAAAAA0gIAAAAAAIC0AAAAAAAA0gIAAAAAAIC0AAAAAAAA0gIAAAAAAIC0AAAAAAAAIC0AAAAAAIC0AAAAAAAAIC0AzYi7fUwlGwAAAABpAYDGyuM+fiQbAAAAAGkBAKQFAAAAAGkBAKQFAKD5sIWPQT7WJCsAkBYApCWVxfWZKdGb7GyydDHHuRvZAdA4mO1jgY9byAqAZi0tv+YQQpWRAn+rGpeW\/vrMlBjLIW2y\/Noc5yPJjsbHy2XEks00r65IyI8XfDzs4xofp\/hYA2nJxQop59gjmqf\/1nw\/zccePlYq4zse8DHBx55c7oC0LMQdPk6vwHaOMNfvhpwWDUInF7whXqeB96Onj3N9vOHjJ1MI\/MrHvT729dGuhO218bGBj+199PXRMiVtS\/39g\/XflkgLVFBa2vr4l4\/3fZzVRH7zij4e1HLSHo19ZxeUEcs205P52Zz5M9\/HVSXelJujtKxcxrknefuMj51zfsdlZl35zR25JwPSspC0yPVxSB23M9pca9TeNAzraf4\/3UDf38LHyT7m5riXv+Vj9ZRtfeHjehWVzyLrvu5jlZh1NtHCpE37jgteJCItUAlpOTByfm3WBH7zPyPlpA61IC3zfEzKGUshLe5JF9QEPOVjvI8ZMTflu5CW3NIyT\/MwjJ9yPPTu87F0xndcZdLLg7S51hIC0pIlLXJ97Iq0IC114IzIPfoH3ZebXfAm96vIcpk3pUfCtn72MdnHJ1p4lFqTbV1QC79An8cWEZNZuuxOHyN8jPTxvI8pPl5FWqAC0nJI5Bzetgn85qtrqZwU7ui3nKslScuKMcuXc0Ezpp9NusZa1dbYpOXdhDRSW9XHxzb6ABofuWG852P5lO+QZgov+pjmaJ8KSEuatIRv2bZEWv53TMPmqUhLPvq54OVTeA78w8cSkTTSzOtQlZkw3e0p0iI167+KfN7eBTUvsmxx8\/ndur1jIulbmEIZ0gJ1lZb2el+Y7oIaipY18Juu1PvZVTnKSYc39h+DtFROWkJOMOn+g7TUSVqiyA3isMhD7yV9GAIgLXWTlvBZUE6fiKYkLeG9\/mukJTeXmON\/dUbaHVxxLfuyCdLydsL6t+q6q5uCpNTOT04oRMqIULOQFqiAtNQi77rCS96aB2mpvLQs6QpvnOTftkhLxaQlZLArrtE6ldMTkJaKSIuE9Cfog7QgLSVg+5KsnCP9Eyb9TgnS8kTCuhfpeuGgN6u67CbZLyMtgLQgLUhLPNNM2q5IS8WlxamohOvPdAs3RQBAWkqTltfM\/yfnuM8hLUiLIE2w5uh3f1jG+XJIgrQ8kLDuPyLSsror9HNM4kmkBZAWpAVpiedzVxjtajGkpSrSsqiPT802mOAPkJa6SYv0S3jO\/P2mj85IC9KSwSLm2L+Qc51xZp0D6igtMtSztGr4QAUqijQZm4a0ANKCtFSKVvpwbFHH7bTVG1hDSssyrtA8bFKZD4BK0a4JS4swymzj3grvXyWHrG7tGnZytVa6D5WmbQOd10hLdaSlhwuat75lPntGXxBUS1palyBGeWnp6tYsty7SUo1rrW3O+0cp0tK+wvvYWSPvcKm2Vm+TOkqLPWa7xaQPh6ltCGlp4arXRLya226o725Z4eunjSuts3w1paVFHcoVLV35fXerLS2LVCGfFqmWtMiQsydqhMPPyo3kBlcY4WNSwo1MRn06x8dETRf2AZEJqf5YwoNsNR+XumBYw\/D3SFW1vDE8uoIZmldazjfpjsmxXamJOcoF48h\/6wqj+Mj48me70iZUlALHn1zwhjQcNniaFkwGZkhLT3Msh+X4ri4mfTkTN1ZCWjY125ges3xxs49bZWxrWc3vCa7Q1EGG5JThOjcwN45we9tlbE9GvbnWFeYYCIfw\/IsrDPO5stlev5htdDPLw2togAtG3Plcr5e3Em5ma7lg1JBP9PqS7\/\/Qx3nm+3uY7feP2UZfszw8DzfT75+uv2uWXmsHRB4O8v\/hWoD63hWGQJVRTJrCMJFNVVqc3t8+MJ\/fk+OBWYq0rKT3yUmueKjNV1wwQW\/c82I\/cy5mPRt2d8Gb\/KwH43G6veNd0Dk83P5HppAbfrZPyrZkdMPrzDNvvv7\/Ol2WxQDzPUuZe9uNrripsVy\/f\/fRvQxpkd+7ry6bY577cu0e7up3XrGtzW\/6JuEZXaq0bK35Lr\/pWB9r+1jfBc2IZ+ozpr6kpbue3++7wiho0irgKr0vR59Nm5t1h8WUqZL4jY8Lc+z70bq9E+ooGisl\/C55zvxC03Qw+z8wZhtLmeWrm7LE6VoWDMstcv3IPD1ZE9XacktYLuuqZcvJup\/ynPzYBfO29auAtByi3zc8R56t64LJKD92hfmL5Nn9kpbV0uYq6qtl24\/0N8zV7UifrrDP4XLm99uR9nY1n3\/pCpO7hp\/Z4e3tMRuU4zetovn7jilLfqdl2CNyvBBZzHzfxuaZM1bFyt6f7o7uU10nl1zTfC7\/38IUUMJ4JGan94hJF40vE97AWE5xxR2y40JuVr2rKC2L6EUiBbHbTJqHctwgBmvBOG3\/Z6vEZb0t2NQtPA5+dGLGM\/XhFSctciLNMN+5dI68D7ddzjB5lZCW9pHf2D5GjMNlf0\/Zznb68EzKO7lhnKQFt\/CzK1IKQ2cZEY+LmXq+bGs+iysUbWaWd9OHVHQOm7jastNd+gRvM7UwtZX5bP+Y7Qw1y2Uo3D9n\/K47tPAjN8H7Ms7rU5CWRistQi9XaOYajgjVogLScrAWHtPOjU+10Gn5g1l+VMZvekqlOu3huXlEyq7I2KfnY7axgj6os56Zj7j0odmPNGnXUOFKu86+TijMhbVWHWI+vzljH1\/UAlB98Lz53ksT0pQqLU6vw+i5JX\/vpoWf+pCWPV3x6JbRmKP7aZ9N55j1jzefn5CxTw9pwS6tdmuDjLJYXobl+F0Ha9koLZ\/6meXDVOI+yii3yLO7VUoZKky7kRZwp6dsT86rk+soLZN1+Ssp22mnsjI\/x\/0hTtqPMoX3uJil4jHAfPZ7s\/7dGd95j0lrj9n5Kb+pld7n52Rs+xN9iZD2gjhMO1LzfHrGOXBGNaRlWy0MfaYnq5zAp8W8adrLHEixs79qYWyQXvDXmQLXD\/odcfzRfPfnaq3b6Xb21xuefQguU0FpmakF\/G9j8kd+\/4Euu4rzYFc8rv2H+tbkJC30PhPZ7m0pF+5akRvKbL1BXapvd950xX0\/kpqHnZPzhim\/bYqx93L67VRCWpyeQ3GFrrzSsknkIpS8eVTfykjevW2WDc8hLX+KHDe5IV\/uY4yPi\/VtUnhuH12CtGyu68h5MkrPn5ExYn9i5PtnaMH0En1zO9Xc9A4rQVrCYUalQ+tBep3t4uOayI35dD2v5us6e2rafTRf7Y1oPaSl0UpLeF+ZaZb\/pY7Sclik4C01m0P0\/Nhbz5f55h7bM3Ith8L+esp+rJVxTodcF9nfw7Rgf7N5+TPHfDYqsn4vVzxT+yxN9we9Bm6MvJj7NOXlmZWWG\/XfV\/X+EL7cOC3ygku2t2jOY\/x7s97T+kyWAv\/OKnj2pUO1+W2koNs75fmQJHpL6dveuJeCXfUlmtxvjzEvGJdz+UY1q4u0DIk80+WceFDvvVfrW+Tw3jc8QVq6mGf5xJQXBX3NtXJYyn7\/y6WP0paH38T8rgf0d13jCiPHzddrLq+0HGNejHwYeU6+G3mOXZRDWg40eTdetzNGtzslsr0TqigtrfW42+\/7WM+BMfrMeNK8cI9Ky0GRdb9RCblEa58+NtfPQQnScpK5d31nytvhZyeVKC1S9rwzsl\/PaFn1RC27fuiKa84PzCEtd+v5NF3Plx30efDbmDLw1i7yBQ\/njM4J0vKWHsTOGQXV701hLumGNci8MXk15sIdaC6iF1yhSj1ODMIL+4YKSktWTNLvTrrhbGZO2Ll60OOaX2wZedt5Tkyalq64Dfr9+gYwLk8\/U9GamyAtK5ll76fU7tjC7Jll5melpOVjs50BJUpLW3MDCvNuxYSamK+0oJUmLWub\/JunN8bWMTUxB6gcfVuCtMgxlnl\/Fk\/Ji9UiAjY2pmDTRt\/mzY0USLOkZYGep3EcG6mVmqMForhaqGtM2n8hLY1aWkKpty9ETipTWvob6ZAmmN0StrOTuTc+Hll2g\/mOdRPWv8ykeTkhTRfzfIm7z2X1aZFr6h3zPQ8k3HOXj7w8m5Bw\/R4Zuc7GJNx7V4yI0n45j3H44mVqzPfL\/enf+pzZ29W9X2kaPSL3vNNr6DrJkpaOLhgqPEwjBcO41gq7a+Hx65Tn+uVm2aYJ+3NB5NngEvbpe1NoLqeviPQR\/jIi1XHlrT1ifleWtHytz6FjY17ItlT5nJtxXxkc2d4P+mK8Rcxz78yIMPevkrTYvrY\/aAE87oXzCvrS3jbN7KaFeCtrHWPy5hC9n85MkBZLVp+WPNJiB86Y6oqbNNo8PtmUzedoGSZNWsK59pZOKNveFBGcOvdpWTPy5nTNjPQXm\/QbZKQ9w6SN9kf4j37+vcseyetGIwcr1eGm9WzE0g\/W+J0W5s7Vh5I9GP9MOBCvmzQHZXxvX1douiS\/YfWYtzv2Id02Y1u2ZiKuadGtKfke8pSplSi3SUGlpMXeJHuXKC3DIhdOWt4NcIUaqiRpudYs\/3PGfg+LnCtZ0jInx5vCS1y+al6nD4QFJUjLsynbahl5k3VeStoVzU3tdaSl0UuLsL2R4fkJb9CypOUmcw\/Lalf+V7MtO9Hlxi69WdGSkQe+RFxt3tEZD\/osaTnZFTcDTisMttaXfbY5RJq0PJ6RN3bfL8x5jGdlbHspV\/nBEOLe1D4eud+2rqHrJEtajnLFzbDSmnNv4YprLs6JedakTdTZwS3cnDmucPg7V\/e5zI6JnOtpv2tQ5HdlSYvEiIzvP8mkfTJDWhboMyvvM\/KqKkjL8uaFiNzrti4xv8eY7782I+2ekd9eLWnpa14kScuNrDm8bI36GzHCZqVldsoLLKGrOae+qLS0vJLjpjUjZ1qhZ0IhaMUSDmr0pD64QtKSJkq\/jbwdGBZzYYfLHsz53Ue55GrSf5pl2+XY1hkZ0rKJK26SFuWXrjJvyishLW1ccdOkTiVKi7X4PB1mz0uRlpbm\/P7GpdeIhDxXgrTkaY881bzdWTJH+ldKkJbDMrZlq443zkgbCs4UpKUmpCWU7HnmYbxjCdLS3gh\/nvN4HbOtMyLLXjPPrOg1NsIVmgs\/nFIwCWumZyVcJ2nS0tJcZz+6fHPZdDUFmekxhXUrLVnn0vqu+K13Ht4wBYQtG+g8Gx0pb6xeY9dJlrQ8kiDaSVzj0ltQPGfu5UskvHCSc+leV6jZifKyLvvJFTfrL4XHzH6unSP9dSVIS57an7aueAqJpVPKd8\/l2L9lXKHGd2ZMgbqu0vL7OpaP3jH32O450j9SD9Lyd5c+p1LWebNNirTkeR6ErWnmVVpaLi7hopeDfWJGnGQKpNawd3PF1fJZ2\/lLCftYCWkRzjJpo2+TzzXLds753R3MhfZRwgNJlucZKa1PhrTYwuwct3C74svNDaRfHfKzEtJi26\/PSnjrkSYtH5gHQ57hBNdJkZbeLr6TWxrHliAtozO21d2V3uHy9yVIS9YbLHtjyxr4Imyr+inSUjPSEi1c\/+iK3+6mSYsd5e\/pHPfskSb9nZFt2TbcB0RkIhyNTPo7bmv20zZnsR2T\/5lxr\/864x5QypDxt6ZIvc3XHTO2s5wrboKUhx2NcMq\/0i5+c1faULB1YRfzLJ+rBc1aI0tawpqPqTm3t22GtOzt4ge6aWEKtmebZ4Q8q1dIeLl4bR1+93cl3qu3K0FaLsq5TdsvZ3CKtJxYRoG6X4Wl5e4SXt7FlfPC6+S\/OdfZvx6kZbK5l+YdKn13s82\/pUjL9Tm2ZfvdVVRastqn2pGKSo13zHaOrsN2bqsnaeka+V47CIB9I92thO9\/3ciCbQP5uXlrkZcfMx66+5p9PM18vrRZ9746PgQqIS220\/lTZUhL2N53Ys7va5siLRu60pttbF2CtBxRglBdmvP7Sx09LO+b1KxangeRlpqUFhcRipmuMIRrmrTsVod7drRZovQnmRGzbEjkRYsU7ibEFGZsf4G1y5CW3csoJEXvVcNTpCVrxMzFy5CW8BhER+iZqsdt5SqeX\/1ccZPkY2r0OkmTFju55jM5t7dChrTIM35aTAF2kJG\/8HoNax9treQ\/zPY3LPM3L5rxfM0q+2RJy7E5t3mcWee3KdKSd6CB81Oea3WVFtv0v9S5kFZxxQPf5GFAlaWltXnh8XIJv8W2lLo3RVrOz7Gt+6olLVltE+3J9b4rjGKQJ6yRn2C282qJ2zm1DjetUqTFueIOUraD+KMlFO4sdiSFLjFveD4qYVtfZUhLOyNDst2wCvWUEgqx1ZaWlq54grLTSpSWFuZifLOE752dIC0DU94sJLFxCdJyYMa2NnH5hne2rF+CtGxUgrRk1fghLbUrLcIFkYJvzwxp2ccsG1\/iPTuuQHduzJvSB2Le3B2hn03We5jtmPxsjnt9nLT8toQXCZbDUwpDVlqymhaVKy1hYeFit\/B0A3NVRis9Ae5SrjCyVClv1mtNWjq7\/H2SQjpkSIswKqYMEV6v\/zbpDjT30zYqGzNdaW\/s4+hivv\/RnOt0KkFaDs25zQNSrp3BrvRJbe0In0MqLC0fmJcn5Qh+KTUQQp8qS4s9nk+U8FuWccl9kay0jGlIafl9Rlr7JvqqOlxI9qFxcj3etEqVFttRzg5QcKMrHpM\/Lx+ai8FW64ft\/WblfOiIOf\/ssps32Deqg\/VmOMXIYl2pq7TY6vOfEwpcWTUt011pVfr2zVNUWn5hluUdqW7HEqTlgBIeqnnbuv8aaUFaypAWuf9cG3kJdUVK4WH7MoQ+jd7mhYMIzKqu0Kxi\/UjB8BtTODnEJfc1zCstO5htjCphn22T4d0aSFpCpI+E1Hi8FZGXP1bwvGqnhRU7nHLrGr5O0qSllTn\/8r4A655DWrqbZ7UInx3d047e1N68iJR79vASXnZllRXC35V30JQeJUhL3tHj0qYGGJzxDI3D9k3duMLS8l+zfscS89vKw0M511mvytJi5\/UrpZxmmyfeWqvS0sU8aJ6rw4W0kfnOyxuptPSMvMWyHel+X0Kehazqkjub2RFZ1sqxrbxtspc1J+vdrriJx94NLC0ymsWXOc6DLGl5yZXWVG\/jFGlZ3DxgJpVRkKmrtHQ0D7S8338q0oK0lCEtTl9i3OPim3RFpcU2e7ivQvt9vytMQhyOSvliTLpwJDJJH3ZMnubSZ4BPk5YVTUHulRL292WTB6s0sLRYZIK6cEjrH12+vn15uNLs52MuX3\/LWpUW4QPzAq1DiS+szklJd7srNMW8IEWMwvuvlAeedoWRnhat4+\/+0BVeluYZXGbnEqTl\/pz7cFmKZFhpydtn+ZGUslxdpeUWs\/5vypDEsCnlVy7fS+hDXfX7tDxtlvfM+Vtsc9gTa1VanCt08P7Z5Rt++FQ9KHbM7bbm7dk0l6\/d4MX6hqy+pMW2mXw25gEeFi5l5tBOOb77upR8HulKaxZ0scvfkfQqI17hWP9TKvRgK1da5KFu52aRWpKlypQWO\/b4GTm++wqXPuSxbcK3Vca2FtXjXylpiUrYwBw3yIlIC9JSprQ4vfc+lUNabKFuVsr1apGH2b4py21hZX7KNRTWythRBrPmlsoa8tg+xIfk+C12X+MKOvUhLWkFIDvE9KoVOKfsMLUvudLfONeitFhJy9Ns8K6c0rJlzHkeNwqqrZXJMxlsXq52+UeQdJEXGVnSIuWK1XKc718ZqV4k5dr6Jse9ZSVXGL59cszyukrLoZGyX6lNLu2klFkDNbWIPPOrJS22puvqHL9ByrSfmWPcu5alZbhJf7tLn8hqa1O4j1bDjzXbOSvjO49wlakhyCMtUhA8PvKAHJrx5uC+DPGy46R\/EvPmpIfJJ7lpbZ6yrW1d8XDMWdKydkyB5PgKPQRKkZal9GZyTWT\/pW122qzqWdKyujlWP2RsawdXPAZ9nLTYtvtSSOuaUoC40pU2T0seabHNX6QT8jIpac9xpc3TgrQgLXFILfKrOaTF3seyasiHmusy6X7T0ohQOMxxUu3Jva64KWlWrWqWtGxhtveVi5+kzhbSvsjIm2pLi7zxldrXXgnLx9XxHLDsZO6T0n9padc0yJIW26fwa5c+pPPwyPVyTkbB1E5kOt0l157YEermpRzvUrDPoBkZknFA5HflmadF7h1LplzjV2Y8c6PztDyQ8vyR+8PDGS8q6yotnVzx3HEXuPRR+lZ3xSOY2RYtUzLuVae4+pmnpb0rnoft6IwXWfdl3OtrSlpaR97MSbvozjEFOmmHGTZNkht+dLZhWedD8\/ZhVMyJKpk30hW3NW1fh4vXSsuFmtnyJuNSfXhIG8QvIyfRHQlitoQrnojyNb1YbJvfvpG3HD+55JFlbM2OvMk8MfKwkBP\/T7qNCa4w+k6eITufjJwnnSr0EFg5ss8PazzvgqYUr+mDdpaLb4IiF9GvMr4jS1qcKx5NSCToDy7o3NZSY3V9qP+s+\/RDyg20deQtrBSkjtVj2UEvVilAhDUyd1VYWuQasO3UP9L1wglA2+o5FBZUn0NakJYKFFiX1QdiWsF8EVc8cMZFbuFmNG30gRi+Mf7YpQ9WcrzL1x9jm8jLsrz3+q9T0pwXecP7+8i+LqG\/xQ7IktSfp5rSsqtJL\/fTaBPitczz4IOMF4lZrO2KO\/lP1nt5WoxtItIi3BkRFzk\/VzHlGun3+A8ViudySkv0xevZKens0OL3V\/C33x35XSMiv0vOoYu1rPVcCdLygiv0idvL3A9kmxu74loHOa96Z0jLi64w+MBg8xxqpy9sXzRppSagSxWkRTg0UlZ5XF90tDa\/b10XTHT5kytuBdQqkofSkuQw8wK0jb5cvT7mGV4taQnLInNMumsiAttK77P2BdY7buE5hmpOWpwKyDuRG74MRXyuSsxks0za9yXVHEhHn2kmrfz\/Ot3OTZFlUkNR12rvZ11pQ3Xe4NLbgMpF\/3ZkHfm9E11h5C57fAZnFFb\/E7MPX7jiAQHkwh\/gCpOj5ZEWWzV4bgVvhCu78oZAnaWymKfdcB5pWdzcPBdE3lTZmpWZKjDfpUiL05vLOzl+h1yIG1ZYWsKHwrSY74s2HXg98nYQaUFaetTxev7UpY\/i09MV147M0IL3ufoQnhJZlvVSoou+RPjJLTyfVPRtdfiSKM+oh3mkpZW+sIpeY5P1N0avtwtdclORakpL9EWhFCxf0nu\/vJCaaz7frQ7HfwVX3Nw1b9xSI9dJHmlZyi08uEHcvXeaKx71KUtaOmoZYG6OazR8MVDJuXCWjimrxP2uzyO\/K0tajnfFTd\/D8uDcmO\/ZM2HfrLTs4RZurjrDFbd8CctBAxO2VwlpCZ8L0fz6SY\/97MjnO8TcSz\/Kkd+TXHFrmGpKi7BLzEvkaVpm\/c4tXIPWPeUlV01Ji9BZC33zUm5mT7rsWXNXjvygaMjJemvGA60S0vKtXrDP6BuHjXJus6M+sGenbPtuvRHkecv+95gTe4E5YcO3bKVIy\/OutH5IlZKWH\/WG87G+qbhUC9YdSviOPNIiLOaCJntJ5+N4cy5mSYvTN64XJxyLH\/QhJYUJO+Tw3hWSFqGXKx6gIRp36RuQAUgL0uIq1zRICiTTXfrQo\/LAujGmIGHjIbdwZ\/UkLteCTxZH6HWcpyYhj7SE7BV50bYgpmCRJQPVbh62qObT\/JQXQQfV4bjL9l8u8yVUU5KWsGxzfUpev6LX2SIlSItT6c1TS3igSnOlJw5dMuO6fVnLB4uWKC2t9dmc9OydnHE\/sdIyVJ\/lt6ScbzIZ97op26uUtAjDXaFvR9r+9E14+XlvynoyuMUykXJUtaVFWMMV14DFlW9G63Fw1ZCWhmZlfZhcpDdgOXlPcMXzmuSVJ1lPZk6VWhbpWHiUy56Zu7GwlJ7g5+v+y0zNIxJO5ixW0ovtUr3JSK3Ejq68MfhtofkG1\/SRN8HHqsBI3o3TtyDlPgC6aIFFbs6n6NsiWyW9lcs\/43w5iBSNdMGAClKd++cyri1o2tJSjXNukxzp+ui1done++Xed5xL7x8SxwBXPMxxEvKyY98q\/WZpsjFIH9bXaIzWz9o0omOzkubx3zXP\/6nP36U5bSvOanrfv1wlRpp1be3Kb34nhf3Nc6RrX+ILrlJZPeZ3bVXC74pKi332nqJluOu13CLP3nYZ2xuc8AyVMuEZ5tk3Rq\/HVvV8HsjxGKL5dI1edxfrdbh2jvUljQxIdaW+nJE+3Bs1gvM7PA8u0zLr+Xp\/7cKlDw2JNf11yI5MRmshTCLP8JB2du3tyD6kBQCgCZMkLeWSJC0A0MyQN55hVfATZEcubEe\/NXOkt23i1yD7kBYAAKQFaQGA0rAjlw0hO3Jhh+K+ICOt7dQvo861IfuQFgAApAVpAYD8yKgP4fB20nm1JVmSC2kzbkfXkHa50cmupI2ujHJiO+iNIOuQFgAApAVpAYDSsHMQHEx2lIT0U7FDNobDoMqQ1DLayLeueLSNy5BCpAUAAGlBWgCgNGRow7DZkozB3Z4sKRmZfyVu7hcbMizlfmQV0gIAgLQgLQBQOjITbTgC1l5kR52Qfisy\/4EMUygzIcvoYjJZp0ya14rsQVoAAJoRK5jyxdYV2F5\/sz2G8wcAAEBaAAAAAAAAaQEAAAAAAEBaAAAAAAAAaQEAAAAAAEBaAAAAAAAAkBYAAAAAAEBaAAAAAAAAkBYAAAAAAEBaAAAAAAAAkBYAAAAAAACkBQAAAAAAkBYAAAAAAACkBQAAAAAAAGkBAAAAAACkBQAAAAAAAGkBAAAAAACkBQAAAAAAAGkBAAAAAABAWgAAAAAAAGkBAAAAAABAWgAAAAAAAGkBAAAAAABAWgAAAAAAAJAWAAAAAABAWgAAAAAAAJAWAAAAAABAWgAAAACgqrw9sl\/bBTe7VuQEANICAAAAzYvFfIz2MaZC0aNaOzpxTK+Txo\/pTSEMAGmBxkcXH6vExNo+BjSyWJzDBQBQe+ziY0EFY+tq7OTbZ\/dYbsKY3t\/6+GLyeT2W4LABIC3QqLixws+SasapHC4AgNqjnQvehvX3MSxyY7\/cBW+l1nALvz1bx8duPs71Mcus07caO+ll5XIfCyTGj+lzLocNAGmBRsVRKZJwl48T6xi2Rv9iH5foM+pOH8\/4mOxjXk5p+cRHGw4ZAEDtMiRyYx+Yc739zTqLVlxYxq66jpeVef+TltH\/E5c5E8\/q05fDBYC0QKOhhY\/7EyRhqo9l6mEf5CXc6j72UamZmCIuu3PIAABql3Hmhv6DPgDyPqy+1KgoCxa4Fl5UngxrWcKYOKb3QxwuAKQFGhXLqKDEScJ9+qyob9ZTgfkxsj9Pc7gAAGqXl80N\/eEy1n250js0YWyvYUGTsGJp+Z+4nNVnOw4ZANICjYqtXHIzreMacL+kWfPtkf0ZwOECAKg9OvmYa27mJ5W4\/us+bqnkDk05t2t7LycfTYgRFq1tee+983u149ABIC3QqBibIC1zXFDz0ZD81sdPuj9XcqgAAGqPaH+W9RPS9XLBiGNRpBPkOZXcoQmje\/8pSVgK4tLnOA4dANICjQrp5P5Cgri86xp+yOFNXdAEeraPZTlcAAC1he3P8p1LHlnlBheM1BLlMx\/7VWpn3j+zZzcvJbNSpSXolP+NDIfM4QNAWqBRIc2xvkkQl6sawf7trvvyBw4VAEBtYfuzPJCQpoMKzdhq78yEsX1uzqpl+f\/alrG9L+HwASAt0OjYzSWP3rV3I9g\/mVtGXri15VABANQGMlmj7c9yckK6C3X5kKoKy1mrbuRlZH5OYZF088aP7kmHSgCkBRofVyRIi9TC9GzgfVvRBYPOrJ8j7WgfN1co\/sVpAQBQHtH+LMf7GKSxk49DfNyjy2RUmCWrtSMLRrqWE8b0eilvLcv\/x9heT8vwyBxKAKQFGhWL+RifIC4vudqp5XjULTxscrkhz1EGkQEAKIO\/lHCzfaOaOzJ+dJ+DSxaW\/+\/j0msohxIAaWlApFO3TLb7q5hlUqsgI1f1aob50j+lwD+2xn6LTKAcbfZ2g8pZFBETmbtmoI9RPr416\/TmcgEAKJ1XzI1U\/j9UY5gWeqRafKYu\/1u1dmLSmFU6efmYVra0jOk9WYZJ5nACIC0NwFI+PnGFN+nbm2X9XNAfUJbNcsGs7c2NYxKkZX4kr2qBVSO\/YVzO9dYw4rIllwwAQGl0dsX9WZJGUvmDLt+xWjsycWyvcXUQFm0m1vt0DikA0tIARN++2xGyToksO60Z5o80370zQVym+ailUSCj0nJ2CeuGz9IDuGQAAErjN5Gb7yYJ6c5QuelcjZ1YcLNrNXF0r2MnjO51YlxMHNP7azPU8WdJ6caP7XMEhxQAaWkA+rpg8sTwXmrvRVu74pqF5vqWfWkfnyaIy\/0qNrUoLaU0ceuu6\/yRSwYAoDTOMzdemWwrqXPgdS7oNNkgeFn5yEjL6xw2AKSlEbKx5vtBPlpGlsmgJuerwDRnNnPFtfs2amWy4Ki0jC5x\/Y98XMnlAgBQGq+aG++jKel+ow8bpAUAaQGoC6MSpEVqqtarQWkZlZBOhlSWecSigy\/c6+NxTgMAgPzI0MXzzI230fYHQVoAkJYUFvExQAuJcbTQguMGLugM3SohndQ0Syf5dVzQsb5UOum6qyV8h4wY9UsXjEDVnGnt4+kEcXnfR8cmIi0b6\/KNI5+P8HF7xndITd1GPob7ONoFfaby9vuRAWlkJLs1XTAPW3iNyChuPVLOf4uc\/7vqd8uodzI1Qr+c3y\/DWEsTyKN8HOiC2sU8QzzLfkkT9X1dUFspAzQsrnmxv15fANBM2Sly490UaQFAWmoMKYh9YO5jb7vCm20pKMlkuVMi97qpPnY32+ji4yJXGCUxjEdyFtSW93G9j5\/MurJPO+hy2Z\/nzbKvtWDWnOnmY3qCuFzZRKTlwARpyZKVg12h78\/Xei5Jkzp5yXiHix82W4RYBjT4Oea5vqePL81n41Xek47Lda7QhG++K27O97KKT5J0jDDf9ZmPGa4wmegpKqxxknOGXpcyyt6LLmgFIk3Wv9fvlG2sxW0doHkXasIb0Wx9E4O0ACAttcLiKiQyy\/gqPt7S+9lzLpgf4yUt\/B3rgpoYmSvlRk0jBTGZCf0XWlh6XUViDY3\/usLIVmkDkKzk40Mfk3zs7YIO+fJW\/Ect8MkoUTIU8oMuePO9gf4thcvVm\/k5uotLnhNs7xqXFimIv1CitEgNyb91nTd9bOgKgxPIIAbn6jklAhDtGyW1e69pQd\/u21l6rom8jzOfPx3z\/fJ9X7jCnGyDjGTItRIONPFWjHwsppIfStF6RsL20TJGkpBercsu0Dxw5qWDbUqItAA0Y94wN4MnGvOOIi0ASEsMh2thaMlI4WeBysx\/XKF5TMgaJs1jLngrLP0Ook1m9jfpDkz4\/tYqSM+oQFlujuyLFMakWdgE83m5x+dE3edqxLr1fAwvTpAWmc+ksU7EGZWWx\/SYSJzk4+8+3jXL80iLyMntrjBfWlITwqM1jUjxOgnn5L\/Nd89VcRHOMZ9\/EvObvnaFJnrR6+aMyG+OCkS471Ib9MuY\/TrVrLuD+fwX+tkMt\/DgFSH3Iy0AzQ95KEs7V3nbuLO+sQlvIg\/qw0reVi7lGlmba6QFAGmJ4XWVg5AnzT3tnYT7WLdI4evmhG3vYdKMTEhzmha24voaWGk5VD\/bJvLdQ8r83Te5oMlMNWLXej6Gi+hxjBMX2Z+2NSAtWZFHWn5n0u+a8RwPm0O+56NNTJrjzbZ+coX+WT1cUIMzQ6Xc8qxZZ5eYbdrm5CI3tvZxB7Ps1oT9FgkKa4H+Yz4\/TD+b7OKbjgnDkBaA5sfEEm6y9yMtAEhLI2aVSMFfmpL8qJ9Jc5i1E9b7lbnPSZv7JRPS2TfLByYUHqXp2V9ShCpcv7spNH6jn93j8nWIbg70cws3aypnDpSGkpbLXdD8MAwZbVNqrebllJa2rtCHZb7LHgTiEvPdcZNUHmeWP5Xj92xu0n+TIQ\/S92v9yOd2UIW0Zn1hv6555oXCkWbdf7j4Dvsr6G9enksFoHkg1a7yVlA6wp0YCWnrOiYSjWryM6QFAGmJIAIwyhRyNjGFn3tT1jvKZdegCLe59El3pTmYzM\/RNWZZZ1NgfT+yTN44S6fpFpyiRRyWIC1SiN++kUtLUkf8a3JKy5ZmWzNzfP+JLv0Fo5WWC3Ns71xX3NStFJZ1xaOQbqznf1xcZ9KF\/bn6R9b\/XPNNmsHJ6GltuDQAoKZAWgCQlgxOMwWf43PKyMCENPLmO6wRkdGMSh2kZIj5jks5FXNze4K4TKxRadk9p7TY\/h4f5vj+Y036GRnSclqO7T1m0l9TYl4MdKU1lQtjkNnGeSnppurvac3lAQBICwDS0hR40BR0kjqTS+3GNFdo65\/Ud8\/2Pbm1jH2xb6734FTMjTTV+zhSaJWmftvWqLSsk1Nazjfbmpzj+4+JfP8iKdJybI7t2UF5LioxL3aL7IscqwE5ol3kupQWHz+kyMsDjuaUAIC0ACAtNY68hf3WFWpGkt7K2pHDnkzZ3oUm3fAy9uc1V2jatBynYkls7IrnGjmsEe5jVFrOSkgnkyEOddl9VMaabX2V4\/ttTYuMDtYyRVoOz7G9F0z6f5WYF7+O5EW\/OuTrknq9yT68FyMuh3F5AADSAoC01DIDXPEb2SRsv4kzE9LI29ypmkbmpehS4r5IATVso\/92lX6vdFh+uEqxXQMfS5nn5puMY1Qr0pKXg1xxzVIWtinkBzHLS5UWO9LdgyXu+yqRvCi1P6yM5rdZwjLp+\/VXVxjp9A1u6wCAtAAgLbXM0abQdEJKuhtNus0T0gxMEKB1VUb6mM9kNKWrXNBEJmR3s\/7VCd8h\/QYeqsPvHasFzWpEQw7CIhMohm\/Yb3CNd7CCqLSMqeP2urviKQiyRsm6zKS9uALSYqVJanqy+o\/IaF62BvGtnNeffckQNs2UQQXmZrwc+Lsr1CrRRAwAkBYApKVmuckUmn6Zku4TTfO9ix9aNcy3uKGOpXA43vy9n0k3yxSwbzWfj0go8EkNznBO0SJk8s3nXGEej3aNeF+j0nJ2hc\/hYRlpw+kLRKLXiFl+fInS0tEFk6yG6\/wmJa0cFxnh68\/ms33NulnP5w013QD9+3SXPoGrsI25zgAAkBYApKVmCee4+MIlz6ptm7Hcl7Ktl9zCb7xXdEGfmd+bdHeZdO\/pZx1ccWfi6OSRLXW9Dxp5oby+kbfn4Szu0qSucyPf36i0jKvANldyQS1H2N8q6Tze3nxv0hxBp5g0x+X8\/v0i53PSMTjCBYNYdI+c1w+b9fdNWFfSPappXURaZDLYthn79jCXCgAgLQBIS62ysiks3ZCzUJZWkHtE00zTv2Vkpge0MG1HabpS073rgpm6paZFhjee7gojlJ1i0ovQSFMyqeX5BadnEeHoWZ9p4b0xIs0DZZhemf39woi0vKnn19aaZpArrxnTQFcYUOJaF8zpY9lSzy9ZLkN322ZcHfV7pZbkGVc878oOumzDjO8\/06z3igv6F1kGq5QfHbOuNO0LJ1SVmsRjI2LeQX+TnP9rxkiLxC0umP\/I0kWFZr4rHiYZAABpAUBaaoo9TaFnv5R0F7nCiF5pIxz9WtNI\/FMLTPLmuXsk3VpaOHtXC93ydnyWFqy21MLZzypSV2mB\/CsKXgsRNmWa5ZKHqm4MvOhKm4ekQ5nfs5b5rh\/0vJLaufGuMDqeDA8crYlZJ8c+Tcjx\/XINhU3FpPmZzGIvTR7\/q+dz2uAInVRMwv45X\/t42sc9eu5LDeNGkXVCablH08t3S5+v81RivtPr7EguFQBAWgCQllpG3sxL0yLpV5D2dnt9LfwdmmOb0gRHOjvf4YLaksUS0smbaxnJ636VotXNslVVZqTm5m4XdDhektOyiKFaMJYO1js08n3dSQv0QzV2VgHdxnwmsY+Pg13dZnKXWrstXDDgggiDNGe8wgUd5pdOWEc+P9Dsx3aRfZN+Mrvl\/H6Rj9+qgDyu3z\/aLVzzkoTMcj9Sr8vH9TcckJAne+q2W+hvOFGvOxnF7DoX9AvrzqUCAEgLANIC0BBIrYrUrjD\/BgAAIC0ASAtAo0NqocJO56PIDgAAQFoAkBaAxoRMvvmua\/xzsQAAACAtAEgLNENkQsHnVVhk6Nu2Dbw\/IkwyX8jSHBoAAEBaAJAWADsXiwwR3KkR7NPOuj\/rcHgAAABpAUBaAMK5WD7x0a0R7I\/MISLDWb\/BoQEAAKQFAGkBOFaF5RvXOCbWDCcCXaD7BgAAgLQAIC3QjBnignlYZILArRuJsIS1PjJZ4rIcIgAAQFoAkBZovsjkmzKru8yQvm8j2B\/pcH+HK8wQfxeHCAAAkBYApAWaL719fKlycHoD70t7vRY+N8IisSuHCQAAkBYApAWaJ1Kj8Z6KwWUNtA8yvLI0Rxtn5MnGdBd0xgcAAEBaAJAWaGZIrcazKgb3+Whd4e131ljSxyo++vnYwscwH6f4uNrHSz5mx4iKjQs5VAAAgLQAIC3Q\/Gjp47YMWcgbX\/uYoTG\/Qtu0sS6HCwAAkBYApAWaH+dVQS6qEW9zqAAAAGkBQFqg+fG7GhEWiRM4XAAAgLQAIC3Q\/OjlY1AFQ+Z3GWpipwpuuxOHCwAAkBYApAUAAAAAaSFHAJAWAAAAAKQFAGkBAAAAAKQFAGkBAAAAQFoAkBYAAAAAQFoAkBYAAAAApAVpAUBaAAAAAJAWAKQFAAAAAJAWAKQFAAAAAGkBQFqQFgAAAACkBQBpAQAAAACkBQBpAQAAAEBaAJAWAAAAAEBaAJAWAAAAAKQFAJAWAAAAAKQFAGkBAAAAAKQFAGkBAAAAQFoAkBYAAAAAQFoAkBYAAAAApAUAkBYAAAAApAUAaQEAAAAApAUAaQEAAABAWgCQFgAAAABAWgCQFgAAAACkBQCQFgAAAACkBQBpAQAAAACkBQBpAQAAAEBaAJAWAAAAAEBaAJAWAAAAAKQFaQFAWgAAAKAutPXxSx8DiMrHTYd1m3rbkd0XSFx\/SNd3yZOKxaJcukgLQJXo7GOVCsWyNZ4XXXwM9rGvj6N9\/NnHpT625DQBgPrmVh8LCKLG4hUuXaQFoEo8WMF71X9rPC\/OSfhdgzhNAKC+mUwBmKjRaMHli7QAVIHhPk7zcb6P9yL3nct9jPHxJx8napysn8myZ3zMMenvrfG8+JWPQ32cZ37Tzz4W4zRpFCxOFkBzlJa3fRxMEI08\/oO0IC1QcU7yMcnHv30sYT5v7eMCHx\/6uNBHq2aYN3eZe857OddZ3cf3us7FTSQfVjb58AKXTIOzpl6XcjzudEFTf4BmIy0PkhVQA1yMtCAtUFE2dMU1CWeZZcMjy4Y3s7wRSfva\/P5LSlh3rK5zahPJiwNMPozjsmlwok37dyNLAGkBQFoAaWnK7Bgp\/Fxqlo2ILDuhmeXN2pHfv3sJ6w7TdfZuInlxjcmH33DZNDi3R87NvcgSQFoAkBZAWpoy7Xw8pNfUpz5WM8uW8vGmKzQJWqKZ5c1x5n4z38cyJay7ra63cRPJiykmH5bmsmlw1vfxpbk26WMESAsA0gJIS7NACuStYz5v6WO5Zpond5r7zZsZ4hfNu910vRWbQD70MfnwFpdKo6GNjxXIBkBaAJAWQFqg+SKyNsPcby5ISNfRxyy3cJ+Cw33M1u3UOgebfLiIUwMAkBYApAWaj7TI+Sudm+\/QguDOMYXh\/X1c6eMBH9dr4bFdJF1XF\/Q1uc4FI13J0LQblLAfq\/oYpevKNmQSwTZm+dY+rnLByGLyPc2lGUq0P8uuCenCvis9I59LDcsWTSQvrjP5sGfM8h4+Ruu5\/EcfiyRsR86rvfWcvtsFHfr7mOUykeUZei5e5oImUE2RjnqdXaL5cK0LhthOq9GUvJHmije5oD+LjPi3pFm+mor1XZqv3XiUANICgLQA0lIJpGDxjcrID3pOj9BlO\/mY6uMLH\/drmm9dof16ez3\/ZY6QH\/U+frsWGudpur\/l2Af5PplTRIY7vsUFQ9\/Luk9pwepMH3O1IHSr7udLKYXSpsSxrrg\/y9IJhfBXXdAXqCnzickL29ytpRa2pUbpaRd01p+tAhNlJR+v6zn0hI\/bNK3EHj56+fjIx\/taiH9d832XJpSPbVX8v3OFqSau1etrugtq7OL6QMlEnl9qiOQ8ruvLcenvY4jm63MqmJ+5oJawF48TQFoAkBZAWurCAC2QDdG\/w5GAvjMiIW9SFzXr7GrOfUkj86Z8rQU+2wRprEmXVuNyuH7PkWZ96ZcRdrx\/TfdxO112kBasZNmOZf5uka3OVYpKN8Oy\/Vmi\/Tjku2Qulht1+U1N+Fzt5eLnqWmjMi2SsZ6P3lpoFml+JbKNTppOJt5cxXy+u25XCtwTVWZEiJfXMskClcKmQBf9\/Qu03DXQLJPr7iJdNinmXiEvJv7po4P5PEz\/vt43ztbPZQjz8brsrzxOAGkBQFoAaakLV\/h415zDt5jzWgp9O8es092kmaUC0T8m3S4m3SkJ399fC0Jx+XylWf9G\/ayvCkz4ebnH5wNX3OSqkjGigscn2p9ljv4dxpzIdx\/ZhM\/VA83v\/JeRT6kdeN4VRlR70aT7T2Qb8vb\/HZUXi52wUmr01tDPbzSff9YE8lBG4Zugv+dDlTLLWZFzLZzEdXGVuetjnnf7m3U+UtmTNJ+az2\/gcQJICwDSAkhLuUifFGnqdVpCYX5Mwnp9XL4+Foe57HlVpMnZMwnLHjLrD9TPtjKfzdbCZjlIzc\/QKsVSFTxG0f4sT\/i42QXN7x7WAvoss7x\/Ez5frza\/cz8XDHv9pAtqomxNoJW8P5jP19fPBsVseyOzzuPm82dceRN6Ntbr\/UlXaGYY1\/zrEfN77zOfS23r9y5+qPFTzDoj9bNFVP6YuwWQFgCkBZCWOrOBnr9he\/Nu5pyW+3HbhPV2MOnuSNn++SbdTjHLO2nBZo+YZXJNfeUKTXbCTv\/y5lc668ub282bwTl4XERalo9JI+ImtWLTmvi96COTDzKwgPQ1kZrC6BDP0mRQ+j0d6wo1BcI5LqhlicujoxNER5qbSZM7qYFoX+P5d5L5jXcmpBmsonZJRL5f0mdeHHZyyc3M5\/vocWAERkBaAJAWQFrqhDQ9Wtz8Pcyc0\/9IWW+cSbd\/SrpXTbpVEtJ0TPi8v1n34WZ8Dt5t8mFCSrqZrrL9WWTODWkKdHMFQ0Z+K3dSUNt8SwRN3vpfVOK9d5EUEb\/NbL+Sk3D2r3Ae3qzXZqsS90NG9\/rG\/MbBJa6\/uIvvqyX5H04sOcstPKIgANICgLQA0lJxLjHn9O4p6V7OISMyQlPY96ScSQCPcNn9YZo6rVRGwnxIetPd2dWtf08cPfVZ\/HAF414fy5a5P8Pdwn2H5uq5eEJEvsuR97Dg\/X2K2JTDhhXOw4dVsEqVA9vvRGouK1VrtIbZ7kM8MgBpAUBaAGmpD8abczppduuOrtBWfUrKto4y2zqrjH2xTU7Wb6bn368ihfQ9UgTjRRXFpsoVJh+OUqm+y4ixjFzVo8xtr2W2fX8Tzb+bzG98soLbtc3qTuaRAUgLANICSEu1WdoUACempNvOnPfXpqR7zOUb7jgOefMdDmksAwW0qcLvlRHQBlQpKjXp5fERaVmuGV+L4QARco4uYz4\/3OTPXWVu2\/YbOqGJ5t9z5jeOreB27zDbXY9HBiAtAEgLIC3VZkeXb5SkMSbdbxPSSBMgWxsTtoWXuR1OdsVNhGSZDABgO1MPcNlNTqTD7\/A6\/N4prnpDHleqOdt9Ll9\/lqbOiiYf3ogR3HD0tBmRZTJgRHRCSBn8ITq6m+03tGHM97fV87ZHDefhm+Y37lPmNpaNCLk0X\/xat\/mjW3hABGFlvR5a8zgBpAUAaQGkpRKc47KHMBbsELBJhbhDTZrzzOe\/08JNZ1MYfVvTPW3SnWHWHxezfSmovuvqNgRtNWtaKtFfQAp537imM9xuXdjN5MMFMfkUCvLHkXPkc1dcqzBC0\/7sYxv9bDEjPVKLEzcwxD66TrcazsMHXPHIa1mIkPQ3\/w+ba043Lx02M9t8JWE7\/1Th5hkJSAsA0gJIS0V41hU6Ny+ZkEYK4z9pundTtvVvFz8S0wuueJK5f5h0P5nr6B3z+b4x2x+qBcx+Tfh4rO+Ka2\/2aubXYZgPu0WWLe\/iJ5IMC9ThJJEruOJ5Q8L+F7ubzz6I+W6pZXnNVXZktoZgRAnnUhu9Tqfr\/3eLnIthbdSF5rMrYrYjfayk0\/9hPEoAaQFAWgBpqQRWRl5MSWffrF6Yku51V2gyEo7EtKcLhqq17d7vNdv7u362aaSAFJ3fRURFRtQ6r4kfkz9E8qFnM74O7Wh1y8VIxRxddqX5\/B5XXHu3rtmGFMb76H37UfP5a5Fty3KpKZD5glap8TxcwhXmPbo5JV0vzRORjbA2yvatekXzXF5sfGk+\/1tkO9IUVIY8f94xDDIgLQBICyAtFWITcy6PSkl3mkm3Y0a+LVC5kDfhMv+LDCUb7esRvv0VeZEmYwN9fOqCIV1v0GXPaEFKmubISEXfuWCEp6bWRl5kTPpWPKWF53kRaZmhhUCpTXjYNe1aJos03\/pZ8+CdhDShePzXBZ305TyVWpVfmjSL+vjCBU3BZI4SGXhCavpmu6Bv1o+a5wdqAX8j3a58vkUTyctBKiOSV5f76K35IkK8g0qf\/F7pNzTArCej2EnN5iRdZ1UXjEAmI7adqNsTgZFaVekvtLMLaq1kMtAVeIwA0gKAtADSUil2cYU5KlZPSRd2wpfCS4eUdF1c8dtxGQHs8Jh08gbWtrWXgtE1Lqj5kcLUFa64SY8Iy59ddUYTa2iGa76+oXkXxqSYmOqaz0hiXY20HJWQRoT2CXOeiJgMjUk3xBX3E\/rMx1a6bEsX9ImxovhspPDeFFhb82p+5LeKvMns9du6+Ekk\/xi5FqVGtocuO06vcTt\/jrx0WNYBIC0ASAsgLRVGCmfLZ6SRDrnSzKZjju3JNSEjB63jsif+k7exG7v4js6yT9IsTfp4LMIp2Szp6wqdwtPON6kx2NwtPDqYRc6hX+h53C7m\/JbrYAtX2yOF5UGkV2pYByXkRRxSAyXNO\/vFPPPkGpfaqU31pQUA0gKAtADSAgAAAEgLANICSAsAAAAgLYC0ANICAAAASAsA0gJICwAAACAtgLQgLUgLAAAAIC0ASAsgLQAAAIC0ACAtgLQAAAAA0gJICyAtAAAAgLQAIC2AtAAAAADSAoC0IC0AAACAtAAgLYC0AAAAANICgLQA0gIAAABICyAtgLQAAAAA0gKAtADSAgAAAEgLANKCtAAAAAAgLYC0ANICAAAASAsA0gJICwAAACAtgLQA0gIAAABICwDSAkgLAAAAIC0ASAvSAgAAAIC0ANICSAsAAAAgLQBICyAtAAAAgLQA0gJICwAAACAtAEgLIC0AAACAtAAgLYC0AAAAANICSAsgLQAAAIC0ACAtgLQAAAAA0gJIC9KCtAAAAADSAoC0ANICAAAASAsA0gJICwAAACAtgLQA0gIAAABICwDSAkgLAAAAIC0ASAvSAgAAAEgLANICSAsAAAAgLQBICyAtAAAAgLQA0gJICwAAACAtAEgLIC0AAACAtAAgLUgLAAAAIC1ICyAtgLQAAAAA0gKAtADSAgAAAEgLIC2AtAAAAADSAoC0ANICAAAASAsA0oK0AAAAACAtgLQA0gIAAABICwDSAkgLAAAAIC2AtADSAgAAAEgLANICSAsAAAAgLQBICyAtTZc1fJzv4x0fs3xM9\/Gij9N8LJmwzgY+TvYxxsdFPm7wcbUuW9vHP33cr\/eF\/mQxAADSAoC0ANIC5dDKxzk+flZRGedjHx8H+Ljbx3z9fKeYdS8y13sY433s4OMnH4\/6mKqf\/+ijH9kNAIC0ACAtgLRAKbT0cbNery\/56BaTZhcVjnk+9o8sW83H0Mh1P83HDB+napofzLKRZDkAANICgLQA0gKl8Ae9VqWWZeWUdKdputk+fpWQ5jNz7b9trv8nzOe7kuUAAEgLANICSAvkpZtKiFyrL2SkXd5c108lpBlv0pxqPpf+MIf62IYsBwBAWgCQFkBaoBTONNfqhTnSTzXpf5EhLYPIXgAApAUAaQGkBerKS+Za\/VOO9BNM+uMzpGUlshcAAGkBQFoAaYG6Mt1cqyflSP+WSX9RhrQsQfYCACAtAEgLIC1QV350pY3qZaXlmgxpaUf2AgAgLZCMFJIP9HGbjwt8DIks7+BjuI\/LXTD\/gDx4ZQjPNpF0K\/oYoctvd8G8BeuQvUgLIC1N8NkicV6O9O+a9H\/JkJY2ZC8AANICyciD9xsfN7rCqDhH6LKdXdCR9EvNS5mbYJYrjIbTTgvZ0kxC3kB+5OMOH\/e4YHI1ibFkMdICSEsT4TpzrV6RI71tTrYb0gIAAEhLeayr+fRr\/fse\/XumC2pN5qiQLGrWGWYeske6oJ22TIq2hwsmXbMyFKYbQFYjLUgL0tIE2N4Vz6uSRjeTVu6pnWLSTEBaAACQFqQlG2nK9Y75+07zAJ3rY8eYdXqaNN+7oBZmjZh0e5h0I8hqpAVpQVqaCE+Z63WVlHQjTLqTE9J8YNIsQtYCACAtsDDtVTpONJ9NMQ\/QUQnr9TNpJHZKSHe0SXMc2Y20IC1ISxNBalCm6fX6mCuuiQ7p4wpNwx7w0SomjTSvtfO4rEDWAgAgLbAwm7mgz0kP\/XsV8\/B83yU3VdjFpLs1Zfv\/MOkGk91IC9KCtDQhVvUxSa9Zqa0+3McmPrZ0wahiX+uyG1zwgshyqo+XjfiEIX0LX9Fle5PFAABICwRI\/5MO5u\/h5uH5t4zCV5gu7cH6pknXjexGWpAWpKWJITUsp7jifikS0hdQamC2T1hParHfVjmReNjHs+ZvGXHsQLIXAABpgXgud9lNvoTXTbruCWlsv5dXyVqkBZCWJs7SPvq7oAamPdkBAABIS\/V4X\/NMmowtk5BmSR\/zNN0HKds6zhTC\/0jWIi2AtAAAAADSUldWMIXmN1PS7eDyzVHwpEnHBJNICyAtAAAAgLTUmaGm0HxBSrpxJt3wFAEKa2Mmm0J4RxeMVNaF7EZakBYAAAAApKVU\/moKzb9JSfeCSdc1Ic1RJs3Z5nMZXecHlRdAWpAWAAAAQFqQlpJ4SfPrZxc\/a7OwmC4Ph\/hM4h5TAF9PP5OCuAzleQ1ZjbQgLQAAAABIS6lYGXkmJd0gl29I5PGaRiaubK2fydDIcx39W5AWpAUAAAAAaSmDLUyBeWRKupEu32SRl2iaL10wDOgwH7Nc0J8FkBakBQAAAABpKZk9Na++89E3Jd15mk6GRl4sJZ0Ml2zncvnWx6FkM9KCtCAtAAAAgLSUixSSpe\/JChnp2vjYwCX3ebG08tFLt9uBLEZaAGkBAAAApAWQFkBaAAAAAGkBQFoAaQEAAACkBZAWpAVpAQAAAKQFAGkBpAUAAACQFgCkBZAWAAAAQFoAaQGkBQAAAJAWAKQFkBYAAABAWgBpQVqQFgAAAEBaAJAWQFoAAAAAaQFAWgBpAQAAAKQFkBZAWgAAAABpAUBaAGkBAAAApAUAaUFaAAAAAGlBWgBpAaQFAAAAkBYApAWQFgAAAEBaAGkBpAUAAACQFgCkBZAWAAAAQFoAkBakBQAAAABpAaQFkBYAAABAWgCQFkBaAAAAAGkBpAWQFgAAAEBaAJAWQFoAAAAAaQFAWgBpAQAAAKQFkBZAWgAAAABpAUBaAGkBAAAApAWQFrIDaQEAAACkBQBpAaQFAAAAkBYApAWQFgAAAEBaAGkBpAUAAACQFgCkBZAWAAAAQFoAaUFakBYAAABAWgCQFkBaAAAAAGkBQFoAaQEAAACkBZAWQFoAAAAAaQFAWgBpAQAAAKQFAGlBWgAAAABpQVoAaQGkBQDys5iPbj5+6WNbH\/3IEgBAWgCQFqQFABoDO\/qYbe7FYZxI1lSEjj7e8jGpQrEHWQpICwDSAkgLQHNjBx93+ngzIi0bkjUVoa+Pl1Vcvork8RwVkQmaxsZEHz\/FyOS+ZCkgLQBICyAtTYG1ffxFCzfR62qQjwt8bE02ZbKNj\/t9XOGjazP4vXKufKf34x98tOUUqDjtffxsnnt\/y0jfyseaPh416wwkGwFpAUBaAGmpdXr4mGWuqwPNsk19zNPP5\/vYpB72Z30fK9RgPso+\/2jy8ZEG2IfBPtrV4\/f1N7\/3MS6lqjDQFdeaDM653nI+vtd1ViEbAWkBQFoAaal19ogUiq4yy06JLDu9HvbnHR9jazAf14\/k1ZR6\/v6l9Hu3r8fvPNr83j9yKVWFkSaPpcalYwnrPqcvHagBA6QFAGkBpKXmWdHHDFeoTdnVLBvggjb0YfOfX9TD\/khb\/bNrMB8XNc9TiUvr+fuX1e8dUo\/feYf5vYO4lKrC4yaPnytx3ZsbQJ4BkBYApAVpgaohw9Ye7GOjmGUyjO2hPnrV0768W6PSIiyl+biLC\/oW1CfL1bO0tDSyKzUAHbiMKs4irrjJ4agS17\/bx1NkIyAtAEgLIC1Qed6rYWlpSFaoZ2lZ29yLXyD7q8JmrrjJ4VYJ6TZ2wWhu0WfiMz6uIRsBaQFAWgBpqStSwzHcBSNzLRGzfGkfv3HB2\/vdXdCUK47ePobqtqSgU0pnbLmO1vWxn25jmchymUBwJx\/7+Fi1HvJkUgNJSwstiO\/mY38tIGbVHrTTdDJ4wXYueDMeFYlhmq\/LVnn\/u9aztBxr7sXnJKSRjvoyIl3WAA6Lu6AvjuTjlm7hWqpeen7K\/DAdXfPhDFc81PFiCemudsHw01H+6Oq3uSAA0gKAtCAtTRAp5MroPuGQsd+6QvOs5X1c62OuC\/qZzDIFl5GRQuGTZlk4R8OHPn6dYx+kkP66rvOj+TecJHBzH9N0uxLSqfesKufLB\/UsLW20AB4+C21+z3DFo6lZ9vTxRSTvPnfBzPDCMZpnszTfvlP5q6YA16e02P4s0e\/s6eMBk4fy7wkp8vNdJB+ltk36U0kTtHEm\/xbo+bhBM7kX2v4szyakkZcM3\/i4iEcHIC0ASAsgLZVmWS1ojNaC2TN6Tr\/vgjkWPtHP5C1+ez3Xx5hzXyb3k6FPZVbyG1U+pPAtb\/7vd4WO891S9uFXKkoyNO9aLni7vborTGY3TguKf9d96Kv7taDKhcb6lBYpXL+hv0lGLdvVFWqpVnNBJ+Z5buG+Pofo5zJ\/TXf9bDcVntl6XKWfx\/567HZSqfzWVW9I4vqUFjlnp+v3ST50Nsu28PG1CwYi6KHX8lcq0lHGqtidrtdEC5WbBbrOBZpnoYAfpXk8vhncB6P9WeJeFsjgD\/fo8mE8OgBpAUBaAGmpNFJIm6kyIFxjzmt5M\/8vH60j6\/Q2ad7UAs2RMdvey6Q7IuH7pYnNJBWe6HV0rVn\/dZWZpUwhVeKwJiAtInrT9PfIRHyLm2UigC+Y3zsysp4UtA+P2eYUs86FphA\/z3zerwlIyy\/M73nNfD5EJWO4\/v1Hk+6ryDZEvKUmMTpEczsVk3C93+vnB7ji\/h3ty9hvEdGHfDxchbjLxTfxLJdofxY5Ry\/RkGv0Ab2HhMu78+gApAUAaQGkpRr33UvM3y+Z81qahLSMWadHpBAzLmHb+5o0ZySkuUAL2IvGLPu3WX9P\/ezXke\/etMalRQp4U\/W3fOSjU2T5RpHfa99ii8jdnrBdO3R02P9otNmOFOirNcpWfUqLnZ\/lfHPeiZhsFckrW+gOkfPui4RzuLNZZ6Yr1EzdZD5\/vw7H\/XoXDAVcbtxk5MHGXxOup3I5I3IOpsVkHhuAtAAgLYC0VJr+kYK\/FGJ\/1s++c8lvTDc25\/7bLrmZ0SiTbp+Y5e21MHhqwvrvmYL3UvqZ\/CvNp36oB6GotrTIfeO5GDGzLKcFcMkDeasddgwPJ5DcOGadFVxxTZg9blJL9aULmpBVi\/qUltvNb5UmdSNUAteKpDvZBc3iXtPzPkRqA+cmnOv2PL\/TfC55971K5qau6WP7s7xoPm+pYidNOe\/W5f\/isQFICwDSAkhLpZERwfZ1hdqUbcw5fXPKeiebdMenpHvApPtVzHKZHXu4i2\/KsryLb\/ZTV9ZzwQhaeWKaFlbzpl+uxH0ZZn6j9NFpnZCuvSvuq+G0kL17Qvo9zHb\/VkHB2j5nPhyi3z0mZ\/qdXXkzpbdQAQt\/6zNajuhdwjbWcMFAFHGcYrZ9TDO9B8q5Z\/uzJEn8Lrp8bx4bgLQAIC2AtFQbWzNyeE4ZWTchjfTLmO0KfQhKneBwd\/Md51XwN77t8jd1KTVOL3FfbC3LPyr4G\/9htrtjhbYpQjanink3sIx96h+zHWkGdqYLRvyqK\/Y8X7OZ3gM3j+RvkuD9TpevwGMDkBYApAWQlmrzlDmn10hII7UB37pCE7I2CemGmm1dUca+XOKSh7GtC2GtRZ740AX9JPKmb1miBNhO8UMr+Bsn6jbnuoVraOpCh5z5sIYrNHfLk75TmftzhMm\/h\/Q8+8p8dlsdti01P9\/rdr5oxvf4P5n8lKajSXPT\/MUFzTYBkBYApAWQlqoiw5qGNSNfppzT65rz\/oGU7dlRyHYpY3\/eMwXvJRooT6rZpyU6IlPXCm3X9md5qYHyrb76tNziFq4BECn9u\/n8xjK3vYnZxk3N+B74pMmHF1LSdWrA6xQAaQFAWpCWZiQttpB2W0q64026kxPSSMf8b1xh2ORw9my5TqTTbuuMfemeo+Atb+h71LC07GJ+47QKbncflz2qm0jFUk1AWj53hclM7Uhocn6FI7L97IoHiuiU87z5g8seVruXK38EtnX0uM+oQsgAAUtXIH8XNS8yFrj6nWgVAGkBQFoAaYnlZJdv7pO7XHrnemEHF9+hf1v9rKf+LU3LzlIxOc2kO8isf2nCd8hz4p4alpZB5jc+n3Mde5+RCRBlNDEZzWmw+fw6s929EwqiMoLYCTUuLb1c+gzt483yxSPn72Pm7z4uGGxBtmH7Zz1j1t8wZvsrqRDtWub+izRKH7IxVYhTXXKzzVLYyhXXBm7PIwEAaQGkBZCWhuZucz4njb5kZx+Xf5M61\/\/TxffVuDFSwLS1Nj+Z6+gh83ncpJVSWzPfVf9NfjWlRWqK5upvfDlHeml687SP\/fTve00ePayfSRO\/b1x653E5n2U0qGVqXFr2M79zTMzy71yhqWPI4vrbDzWfvR0jyN1cYVJJ+TeuNmWsj09deaOe1Qp2YI6GbKYJgLQAIC2AtPyPFkZG0iaHW8Oc87ekpHvVFPg6m3XnmEK3cJ9buLZBhjr+2Xw+OLJtqSl4RdO3rHK+VHuelnCSQmlCl9ZhfGXN089cUDPgdJ1osx07+MGCmML2qj6+dtVv5lMf0nKpS68BCM9nK8kiwDK\/z5L697KR\/DpEPz\/RfPZFzLY31XP50CZ+X3jW5MPLDgCQFkBaAGlpYPqZc\/mylHSHmnQHp6S7wxX31ZCRsmQo2kcionGBpntc07TX+7\/MMh4277nApJdmZc9o4b0+hlattrTITPVh3wtp6hZ9ky01XmdqQfsNFzSJCnnD5I80Berh42MXNH36wRUmWwyR5mhTXDAbfOsq51t9SEtYQzI3QfgeccVz\/Kyi5+MZJo3kw0zdxsl6H1\/bBbVVItTzVLzt8Ml7qfhd2QTvA\/LbD1Npu8gVj24n\/YfO03w6wlV2tDsApAUAaQGkJRf7unzDC4fDEEtTrpUyCj9hwVlqRGSIZGnyFX3zLx3u5Y349youU7VgvbrGR64wq\/t\/XVADI\/Kzaj3lS7WlJRSTV\/R3SgH6Py5oBvahKwxE8Fu3cB+FIVqonKp5972u20Fl5QddLtt61xX6F3Wsh3yrtrQs4gpN6x5JSCP9rcLhj19UEZFzsF0kXThs8mTNP6lBuUmF5hj9ntm6bIrmqYhiU2wW9prLP6\/OCzweAGlBWgBpAaSlvpE31X9WeUmjh4\/RPrbMsc1VtdAn290h5RqRoX7l7e44LUDa2gYpYB+kx0H6LUhTsVb1mC\/1IS1O82YLF9QCyMSQ8kb7KJc8V46VwxE+zvGxhyuuQREhlM72MvyvjIS1Tj3mW33UtBzggkEclk1J08XH0Xr+HOKSa5gGuqAGQfqpbB85V0WeT9d8PMnHak34PiDNEPu6oFbKhtRwDojEijweAGlBWgBpAaQFGgf1JS1Njfoa8hgAAGkBQFoAaWn2SFO008iGkpHhfKUp36ZkBQAgLQBICyAtUF1kiNyWZENZdCQLAABpAUBaAGkBAAAApAUAaQGkBQAAAJAWQFoAaQEAAACkBQBpAaQFAAAAkBZAWpAWpAUAAACQFgCkBZAWAAAAQFoAkBZAWgAAAABpAaQFkBYAAABAWgCQFkBaAAAAoKrS8oOPSQTRyOMbpAVpAQAAgObHeFMIJIhaCqQFaQEAAIBmwhAf9\/t4uFLxxqhec98Z3Xu+xPWHdv2qktsmGn9cd0jXL8Lj\/\/ZZveZV8buQFqQFAAAAoDwmjOn9k48FGvSVaW7Hf2zve83xn0eOANICAAAASAsgLYC0AAAAACAtgLQA0gIAAABICyAtAEgLAAAAIC2AtADSAgAAABRakRakBWkBpAUAAACQFkBaAGkBAAAAQFoAaQGkBQAAAJAWQFoAkBYAAABAWgBpAaQFAAAAAGkBpAWQFgAAAEBaAGkBpAUAAAAAaQGkBZAWAAAAQFoAaQFAWgAAAABpAaQFkBYAAAAApAWQFkBaAAAAAGkBpAWQFgAAAACkBZAWQFoAAAAAaQGkBQBpAQAAAKQFkBZAWgAAAACQFkBaAGkBAAAApAWQFkBaAAAAAJAWQFoAaQEAAACkBWlBWgCQFgAAAEBaAGkBpAUAAAAAaQGkBZAWAAAAQFoAaQFAWgAAAABpAaQFkBYAAABAWpAWpAVpAaQFAAAAkBZAWgBpAQAAAEBaAGkBpAUAAACQFkBaAJAWAAAAQFoAaQGkBQAAAABpAaQFkBYAAABAWgBpAaQFAAAAAGkBpAWQFgAAAEBaAGkBQFoAAAAAaQGkBZAWAAAAAKQFkBZAWgAAAABpAaQFkBYAAAAApAWQFkBaAAAAAGkBpAUAaQEAAACkBZAWQFoAAAAAkBZAWgBpAQAAAKQFkBZAWgAAAACQFkBaAGkBAAAApAVpQVoAkBYAAABAWgBpAaQFAAAAAGkBpAWQFgAAAEBaAGkBQFoAAAAAaQGkBZAWAAAAQFqQFqQFaQGkBQAAAJAWQFoAaQEAAABAWgBpAaQFAAAAkBZAWgCQFgAAAEBaAGkBpAUAAAAAaQGkBZAWAAAAQFoAaQGkBQAAAABpAaQFkBYAAABAWgBpAUBaAAAAAGkBpAWQFgAAAACkBZAWQFoAAAAAaQGkBZAWAAAAAKQFkBZAWgAAAABpAaQFAGkBAAAApAWQFkBaAAAAAJAWQFoAaQEAAACkBZAWQFoAAAAAkBZAWgBpAQAAAKQFaUFaAJAWAAAAQFqg2UlLax\/L+OjnYzP9F5AWAAAAAKQFGlxaRFBm+lgQidHkPNICAAAAgLRAY5CWbXw87OPtiLRsT84jLQAAANC0WUYLg12QFmjk0mL5VIVFvmMJch5pAQAAgKbLAB\/fauFvho\/Vs1aYcm7X9hNH9zprwtg+Y+Kj99z\/L7SO7fNBUrrxY3ofSfbXJhPH9Dk85fi\/Xzj+vecnpZNz6PVz1lyszF3o6gq1LK9yRJAWAAAAaPoFBNvMZlSelSaM7XWZeZteXoztNYzsr1FpGd1n97oe\/4ljel9Rh13Y15yz53NEkBYAAABo2pwckZZj86z05qiVl\/UFz5nlC0vvZxcscC3I\/tpEjp0\/jk+Ve\/zHj+793TujVlu+DrtwhTlnh3JEkBYAAABo2nTwcYOPD31c5yN3c53xY3qPKLPQOm\/i2D7rkvW1zXuje\/3SH8u548s5B0b3OrGOXz\/ZSMsKHA2kBQAAACCWt0f2a+sLoBPKkJbLyb2mQZnNBCe9d36vdnX42pWNsLzHUUBaAAAAAFIZf3bvwf9r7pPr7XpFmgVBI+L9c3ouU3ozwV6\/qePXDjfS8q+ENL197O5jk4xtiTxt6WMfH5v7aBVZLh3+9\/Ax2EdHjjjSAgAAAKUjs4Cf7eMVH5\/7mOLjMR\/Swb1lwjp9XdAfYLKu86iPbc1yKcD9x8eXPv6rBcRUJoztc389NguCxiauJTUT7PVoBb7S9mfZN7JMmord4mO+j1maZmSK\/Hylaebqv5N8rK\/LT\/UxR0OWfeGCyS0BaQEAAIAcyJwUl7hgforZPq73cbSPET5u1wLWuJj1hmr6\/2pBTjrhT9MC3jE+9vLxsw9pvnWYjzt0Wwek7cy7Y3uv5gukc6QmJatZ0OSRPRbh8DUtgmaCvSbmkJa548f07V+Br\/zASEsP8\/mvVMRvcsHQ3Xv6mOqCobyjjFBRketkJZX8I3WbM32M1WtlL02\/v15vH3PEkRYAAADIRgpY4Wzgr\/noaZa193GrK0y4t4xZJh3f5Y3xn1xxE5i9NL0s+0GXC9tq4U2W\/Sdrp3yB9K+ZQ9yO7bMjh69pMn5MryFZzQQnju51QQW+qrsRlo\/M55v6+NoVRr872qT7KXLOb6Jyvndk2zKa3Sy38PDfO6nYh58vyxFHWgAAACAZ6QvysSt0QI7OYH+KKx6+uJt+vriP911QgxJlE5P+Mx+L6udvms+fytqxN0Z37+wLpl9WuVkQNGLSmwn2mTFxXJ+lKvA1+5jz8hr9bAcX1KbsYtI9adK9Yj5v7YKamrhroY0rNBMT0emkn19mtjXNLdzvBZAWAAAAUNr6eNEUnjaNSfNXs\/xB8\/khWghbLmYdO0nfRebz183ne+YqtI7pdWiVmwVBI+b\/mwnGzcsyts8RFfqaf5nz8rcuaLb1lVu4w700d\/xZ5X4D8\/mvdd01Yrbd32z7SfO5SJHUwEg\/r8EcaaQFAAAAkvm9KVA9lpBGpGSMC9rm274j0iznLwnrXOTiJ+mTYWWlqc3meXdwwc2ulS+gvlalZkFQA8Q1Exw\/pvfbL18yoE2FvuJ9c75Ks0Xpw7JWQtrWMZ+t6oprZCyHmW2PzLEtQFoAAADAIAIywxSo9qvgtsP+MdJmf+k6F1rH9tw80rdh+viz+nbhEDYP4poJvjO291YV2nxXV9z8UeItH3\/2sU4Ftn+jS6\/JBKQFAAAAUhgSKahVqiPwMq7Qwfi1Su3sxDG9bzNv2Y\/k8DUvipoJju59ZwU3PcxcA0+7YOjjr8xnd\/tYssxtSyf8z3U70hSsHUcSaQEAAIDSOMdVZwbwPc12z61YofWcVVf2BdYfpVnQ4yMH0qymmfG\/ZoKje7\/uz4HZb4\/u2auCm77UnK\/D9DOphRxnPr+3zG3b\/iwPchSRFgAAACid69zCIyZVuhA4pJI7PHFMr1Hjx\/TahkPXPPlfM8GxfcZUeLPjzfm6gvm8pcp8uMzWtizmgmHCs7BDJJ+SkEaGW+7A0UVaAAAAIJ6bTIHqtDLWb6tSskXk80lmu8vErLeKC95cdy31CyvY8RpqlAqfAzJcctiUcXzM8ufcwkN9C1e6YDLVEDmXb3DBMN52xLH7zPrbJXy\/NBs7kCOLtAAAAEA8Z5kC1SE50kt7fBkJSd5Ay5wST5j1w9qPNc1nUxO2I0MoywR+NPGChmYHc75eErN8ilt4Ikk5b6XPi605ecZs50b9rLOuF34eJ+knu2DyysU5FEgLAAAAxLO+KVCNzUgrzWEe8vGNC4ZA3twVd+LfXdOdaT57KGY70hfhWx8jyH5oBIw15+veMcs\/0GXvmM+k34tMFhnWvLR3xTPbn6yfH2Q+m+2CTvmWX7qgluUUDgPSAgAAAOncpYUqeaOcNLP4QBcMYSxvl9fTz37tiud3WUTXl9qVOa4wEpOlqxb+nnDBLOEADc3TLr75V8htuuwD\/VuEfbIWgC2fqbhIfxupkenjglnuH3XBZJTR4Y63d8GoYne4oOYSkBYAAABIQToXv6CFKmmydagPmf9iLx+n+3jFxzwft\/voYdaT5iyf+pjugvldpKblLZWbtX3M1G3KCGUy2\/cZLmgG84arwLwtABVAaj6+0\/P0lYQ0a6h8SJrnVdzl346RdPsbuZEaxh98POCCWpjfqbj8pBLzrgrOVT4W5TAgLQAAAJAPqSWR5lqvu6DZywL9VwpyI10wulEcG7igo\/IsDRmNLKytWc0FnZB\/MoU5EZfFyG5oROzj4y8RIY8ifVOO8XGhj+P0eolDalJOdUGfraGu0AdG6Kvnv\/Sb+YMLmoYB0gIAAABlIk1VOlVwey1SCnkAAEgLAAAAAAAA0gIAAAAAAEgLAABAM+f\/AKUkhe6O7RgiAAAAAElFTkSuQmCC","width":377}
%---
%[control:checkbox:774a]
%   data: {"defaultValue":false,"label":"plotSoln","run":"Section"}
%---
%[text:image:04e5]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:291b]
%   data: {"align":"baseline","height":162,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAW4AAAH+CAYAAAC8xOTMAAA1aUlEQVR42u3dB3hc1Z338RNJluUiyTZy75bcsbFxNzbuxt3Cxt24AQZscAFp1FxkXLGxAZu6JJAQAiEJyZuQfQjJprEku2EhhOQlZdnwhpBlSQOylND1\/v+eK3J1NdKcURmdmfl+nuf\/GKS58ujcq5+Ozz33HGPqli21VuphqV9KvSH1jtQLUo9JbZfqYQAALa6V1E6pP0tVRal3pW6S6kizAUDLOEfqexaBHayXpc6n+QAgvvJMeBikqoH1ptQ4mhEA4kOHR37YiNCurj9Idac5AaD57WqC0K6uB2lOAGheOnvkT00Y3B9LjaZZAaD5rGvC0K6uW2lWAGg+X2yG4P4dzQoAzedXzRDcWrk0LQA0j781U3APo2kBoHm83UzBfR5NCwDN47+aKbjzaFoAaB7faobQfk3qUzQtADSPa5ohuO+nWQGg+ejSrO82cXAvpFkBoHmdasLQ\/jfDMAkANLtOJvzQTGND+33D8q4AEDc6fe+tRgb396X60pQAED+6ONTvGxDYH3qhfZdUsWGoBADiqqcJ7zP5sWVovyr1iBfa1TWGZgSA+BsrdXurVq1eC4Z1RkaG9rCrNw2+K0IdlcqkCQGgBZSWlm7Ztm3bp9esWfPgypUrH960adNDS5Ys+Y86AttfTAkEgJYK7rKystv8tW7dukcsgvuMCc9WAQC0dHAXFRUdk08dtwjvLbQgADgQ3PKxQ\/KpqRbBfadUAa0IAG4Et075K7cI73LD9EAAcCK4jdebvtMivCfRkgDgRnCrrRbBrePhWbQmALgR3B2lTluEdyGtCQBuBLdaahHct0l1oUUBwI3g1qckj1iE91W0KAC4EdxqgkVwa7H7OwA4Etw65a\/IIrj3S6XRsgDQ8sGt+hi76YHTaVkAcCO41SaL4Nat0trRugDgRnDnSN1iEd4raV0AcCO41XyL4L7DhDdtAAA4ENwZUgctwnsXLQwAbgS3Gm3spgeOpJUBwI3gVjstgvug10MHADgQ3D1MeCw7WnjPpaUBwI3gVmstgltnoeTS2gDgRnDrfO2TFuG9ntYGADeCW80ydtuc9aPFAcCN4Na1SfZZhHexYZszAHAiuNVQYzc9cCytDgBuBLfabhHcR6Va0\/IA4EZwdzbhnXCihfciWh4A3AhudYlFcJ+R6kTrA4Abwa27vR+3CO8ttD4AuBHcaqqxmx5YwBkAADeCW6f8lVuEd4VheiAAOBHcKt\/YbXM2mbMAAG4Et7rCIrh1PLwNZwIA3AjujlKnLcL7Ys4EALgR3GqJRXDr3O8unA0AcCO4M6WOWIT3VZwNAHAjuNUEY7eOyTDOCAC4Edw65a\/IIrj3m\/BKgwCAFg5u1cfYTQ+czlkBADeCW220CO5TJryrDgDAgeDOMeH9J6OF9yrODAC4EdxqvkVw687xPTk7AOBGcGdI3WAR3rs4OwDgRnCr0cZueuBIzhAAuBHcaqdFcB\/0eugAAAeCu4cJj2VHC++5nCUAcCO41RqL4NZZKLmcKQBwI7h1vvZJi\/C+lDMFAG4Et5pl7LY568fZAgA3glvXJtlnEd7Fhm3OAMCJ4FZDjd30wLGcMQAEtxvBrbZbBPdRqdacNQAEtxvB3dmEd8KJFt6LOGsACG43glsttwjuM1KdOHMACG43gjvLhHd9jxbel3HmABDcbgS3mmrsblQWcPYAENxuBLdO+SuzCO4Kw\/RAAAS3E8Gt8o3dNmeTOYMACG43gltdYRHcJ6TacBYBENxuBHdHqdMW4b2MswiA4HYjuNVii+DWud9dOZMACG43tJI6YhHeV3MmARDc7phg7KYHDuNsAiC43aBT\/oosgnu\/VDpnFADB7YY+xm564HTOKACC2x0bLYL7lFR7zioAgtsNOSa8\/2S08F7NWQVAcLtjnkVw687xPTmzAAhuN2RI3WAR3rs5swAIbneMMnbTA8\/j7AIguN2xwyK4D3k9dAAguB3Q3YTHsqOF91zOMACC2x1rLIJbZ6HkcpYBENxuaCd10iK8N3CWARDc7phpEdz6xGU\/zjQAgtsNaVL7LMI7ZNjmDADB7Ywhxm564DjONgCC2x3bLYL7qFRrzjgAgtsNnU14J5xo4b2IMw6A4HbHcovgPiPVibMOgOB2Q5bUcYvwvpyzDoDgdscUY3ejciBnHgDB7Qad8ldmEdwVhumBAAhuZ+Qbu23OLuDsAyC43XGFRXCfkGrDFQCA4HZDR6nTFuG9jCsAAMHtjsUWwa1zv7tyFQAguN3QSuqIRXhv4yoAQHC7Y7yxmx44jCsBAMHtBp3yV2QR3JVS6VwNAAhuN\/QxdtMDZ3A1ACC43bHRIrhPSbXnigBAcLshx4T3n4wW3qu5IgAQ3O6YZxHcunN8T64KAAS3GzKkbrAI791cFQAIbneMMnbTA8\/jygBAcLtjh0VwH\/J66ABAcDuguwmPZUcL74u4OgAQ3O5YYxHcOgsllysEAMHthnZSJy3CewNXCACC2x0zLYJbn7jsx1UCgOB2Q5rUPovwDhm2OQNAcDtjiLGbHjiOKwUAwe2ObRbBfVSqNVcLAILbDZ1NeCecaOG9iKsFAMHtjuUWwX1GqhNXDACC2w1ZUjdahPflXDEACG53TDF2NyoHctUAILjdoFP+yiyCu8KEpxICAMHtgHxjt83ZBVw5AAhud1xuEdwnpNpw9QAguN3QUeq0RXgv4+oBQHC7Y7FFcOvc765cQQAIbje0kjpiEd7buIIAENzuGG\/spgcOp6kAENxu0OmBRRbBXSmVTnMBILjd0MfYTQ+cQVMBILjdscEiuE9JtaepABDcbsgx4f0no4X3apoKAMHtjnkWwa07x\/ekqQAQ3G7IkLrBIrx301QACG53jDJ20wNH0VQACG537LAIbm27VjQVAILbDd1NeCw7WnhfRFMBILjdsdoiuHUWSi5NBYDgdkNbqZMW4b2BpgLQLCSoN0tQn\/FXSUnJQVqmXjMsglufuOxHUwFoluCWOu0vCe8baJl66dZley3CO2TCa54AQNORkN4kdau\/JLwP0DJRDTF20wPH01QAmrrHvVHC+hZ\/lZeXV9IyVrZZBPcxqdY0FYAmEwqFNpaUlNzsLwnv\/bSMlc4mvBNOtPBeTFMBaDIS1BskqE\/5S3rh+2gZa8ssgvuM1Dk0FYAmD24J7JNeEdz2sqROZGVl\/TAnJ+e1tLS0++oI78tpKgBNQkL6Ugnvk4EiuC0VFBQs7tWr18u5ublVWm3btv1ZPT3vQbQYgCYJbult3xSovbRM\/QYOHDhn0KBBP5Gq0srLy6vywvvD9PT0B+sI7goTnkoIAA0nvev1UicCtYeWiUxCeorU96oDu7r69+9fHdxV2dnZv62n1z2FVgTQKNK7Xid1PFAVtExNgwcPnikB\/UQwsP3VtWvXT8I7IyPjK3UE9wmpNrQogAYLhULrpId9Y6DKaZmz0nQMW0L7x\/UFdnXl5+draP+1devW3zb1zzJZTtMCaMxQyVrpYR8LVFkqt8nw4cMzJYg3SP3SJrC9ellqqxy+xESfHqhzv7ty9QFo6FDJmrKysqOBKk3FtpDg7Sm964Py56sxBLa+dne\/fv2yvC+jmygcsQjvbVx9ABoc3FJHAlWSSm0wZMiQMRK+90u9H0Ng\/1lCvqRHjx5tI3zJccZuHZPhXIEAYlZeXr5aetiHAxVKgd51ngTvzoEDB\/4ihrDW+qMcUzRy5Mh29Xx5XRGwyCK4K6XSuQoBxNrjXqUbJ\/irpKQkWYM7TYJ3tte7fifGwH5Rg76OHnYkvU14Te5o4T2TqxBAzMEtPeyD\/pKPFSfT91hQUDBcgrdSwzfGsNZ6Vm9UTp8+PaMBf\/UGi+A+JdWeKxGAteLi4lW6442WbqCgJf9dlOjf18CBA4dK4O6X+nUDwvoD6V1\/ZciQIdMb+TZypG62CO81XIkArElIr6wO7EQPbl\/P+vkGhLXW6xLYtw4dOrRvE76tiyyCW3eO78nVCMB2qGSF7njjL\/nY9Ynw3iVksyVsC6V3fac3j7ohYf2xfJ0fyJ+X+qb0NSUdYjlgEd67uRoBWAe3VKW\/pMd9naNvN12n7uk0PAnr78c4fS9Y\/y11JD8\/vyAO7\/s8Yzc9cBRXJICopId9ie54Eygnen96Q7CgoGCiBHVIQvafpf7WiKDWelPq81LzTfyn4e2wCO5DJvwADwDULRQKXaLrb\/tLwnxXCw199NC1Qbxx6u\/I\/7\/dyKDW+lC\/ls4MGT58eEvO3ugudbtFeM\/jqgQQbahkua6\/7a\/y8vKdzfl39urVq42E8lipLQMHDrxZQvW7Un9pgpCurrfk635Zau2AAQNyHWru1RbBfatULlcmgPp63Mt0\/W1\/SY97RxP0nrOl9zxMhyUkQHfIn7dLfVvq\/0l91IQhXV2vyN\/zGfl7l+gvBkebWx\/eOWkR3hu5MgHUG9y6\/ra\/pMd9beBl6SNGjOio0+S8MB6ngeytoHed1DEJzHvlz296j5C\/0QzBHKz3dEMDvVEpf+rNv08lSJPPsAhufeKyH1cngLqGSi6WHna51rp16564+OKL31iwYIGOLb\/m1ftxCGHboH5S6rCE9bwWHq9uDN26bK9FeIcS6JcRgHiSwC7U9be1Vq1a9czixYur5s+f70JQvyoB\/Q3pwe+RP2c4PPzRoJEkYzc9cDxXKICIwa3rb2utXr366RYK7v+RcH5c6oT896ohQ4akwjDBNovgPibVmqsUQA2hUKiwpKSkVEt63P+xaNGiqnnz5jVXQOvTjd+VgL5LNx\/QlfoKCgo6p2jT6\/d9m0V4L+YqBVCDBPZS3ThBqzHB7c25\/p03Dv2Q9p692ST6SPqoKOtXp6plFsF9RuocmgqAv8e9RNff1tqwYcNXly9f\/lxhYeEzEriflrpbS0L4uK60pxsI6L6KUqvlvxdKTdCZJoRyg+naKDdahPcVNBWAGsGt628H6ipaJm4uMHY3KgfRVACqh0oWl5WVFVWXLukqdSUtEzc65a\/UIrgrTHgqIYBUJ2G9SJdxDdRWWiauBhi7bc6m0FQAzga31HWBYkw1\/i63CO4TUm1oKiDFlZSULNRlXP0lHyO446+jCS8wFS28l9NUAD3uBbqMq78kvC+nZVrEIovg1rnfXWkqIIUVFxcvkB72Tn+FQqHLaJkWoZsoHLEI7+00FZDCJKjn6zKu\/pIe95YE\/XY6mfD6HlOluiTo9zDO2E0PHM7VC6QoCel5uoyrBPgnJT3uzQn0Leh0ukuk\/lWqylcfSz1mwjM2Es31FsFdaeK\/\/RoAV4K7OrDlv6\/xalOCvP0eUt\/ygvolqV1ej3u21I+8j78iVZBgp6W3sZseOJMrGEjR4PYFdiIF9wipV71w1vDODnw+x\/f556UyEuzUbLAI7lNS7bmKgRQjPe2LpLb7q6yszPWts0ZK\/dkL5V9ECO1qt5t\/DJ1cnWCnRr+nmy3Cew1XMZB6Pe65Utv8VV5evsHht9xN6vdeGL8jlV\/Pawt9wf1cAp6euRbBfYdUT65kIIUUFxfPlV721f6SHveljr5dnS73I18YH4\/y+mGm5g3LwQl2enR454BFeO\/mSgZSSCgUmqOrAfrL4eA+6Avh1014+l+03rk\/uBPxwaLzjN30wFFczUCKkKCerasBBmq9g29VZ4t8GENvW2UFgvvOBD1NOyyC+5D3LxIAqRDcuhpgoNY59jZ1OdOfmJpztG3Wp+4QCO7\/k6CnSf\/lcLtFeM\/jigZSQHl5+SxdDdBf8rG1jr3NLYEA\/q7lcQMCxz2ZwKdqtUVw6yJVuVzVQPL3uGfqolKBcmmKmU6LeyUQwKstjx0XOO43CXyq2krdZBHeG7mqgRQIbullX+Yv6XGvdugtHgiEr87fbm157OLAsa8k+OmabhHcOo7fjysbSGKhUGiGLioVqFWOvL025h8P2lTXTbH8Xgoc++sEP1061r\/XIrxLTHgNFwDJHtzS296sJT3ulY68va2B4K3yhj9sPRA49t+S4JQNNnbTA8dzdQNJSgJ7uq4G6K+SkhJXgvupCEMdsfQkfxY4\/p+T5LRdbRHcx4z9kBKARAtuXVQqUCsceGtDI\/S2747h+HZSHwSO\/3ySnLY8E94JJ1p4L+YKB5JQWVnZNF1Uyl+OBPeRCMG9KIbjZ0Y4vjyJTt0yi+A+I3UOVzmQZEpKSi6U2uCvUCh0iQNv7VeB0H3bhKfE2doXIbgvSqJTp0+F3mgR3mz8DCRjcOvaJP6SHndL7ySeHyF0vxbj13g8wtfonGSnb7Kxu1E5iCsdSCLFxcVTdW0Sf0mPe1kLv62dEUK3sfVyEp4+vVFbahHcFSY8lRBAkvS4p+jaJIG6uIXf1pebIbgfTNJTqI\/122xzNoWrHUii4JZa6y\/pcRe28Nv6QyB0dcOEzBiOr4gQ3CuS+DReZhHcJ0xs9wgAuKqsrOwCXZvEXxLeS1vwLfWKELpPxPg1ngwc\/66pe3uzZNDRhBeYihbey7nigSRQUVExWdcm8ZeE+ZIWfEtzIgT30RhDLDh\/+9EUOJWLLIJbl4btylUPJDjpXU\/WtUn8JR9ryQc3ro4Q3LH8C2B1hOM3p8Cp1E0UjliE9\/YUu8R1+7c2\/KQjaYNb1yjRauHgPhEheLvEcPznAsf+1aTO2O5YYzc98Nwk+74Xev8q+4zU1014qOzX3rnXa+DvJjzvHUgOZWVlk3RtkkC1ZHB\/JhC8L8RwrN7A\/Evg+BtT7JRebxHclVLpSfL96jTHN039M4p+x086kkpFRcVEfcTdXxLmi1rwLT0c+KF7OIZjlwSO1T0q+6bYKe1t7KYHzkyyX1a6B+n9JrxZRjC4P8tPOpJKKBSaqI+4+0t63Atb8C19I\/BDd6gRof+VFD2tl1oE9ymp9kn4vetDSb8PXAeb+ElHsg2VTNBH3P0lH1vQgm\/pi4EfOtutuHTFvL\/7jtOZJcNS9LTq1MebLcJ7TRJ+7zpc9l7gGurPTzqSbahkvAT1Mn+Vl5fPb8G39E+BHzrb8faSwHGnU\/zUzrUI7jtMeN58MpkYuA5e4qccyThUMl4fcQ\/UvBZ8SzcEfvBmWByjN6he9B3zmmE5U50Gd8AivHcn2fcd3K7uPn7KkXQkpMdJL7vQX9LjbsnlT1cFfvCmWhyzLnDMNZzZs0Yau+mBo5Poe37MML6NFBgqGauPuPtLwnxuC76l4TEOleiY5m99r\/+uYSU8vx0Wwa03gFslyb8y\/jdw\/fTjEkBSBrc+4u4v6XHPacG3pKHrnxWwIcrrd\/leqzvC9+as1tDNhB91jxbe85Lge51kGN9GigyVjNEHbvwVCoXmtPDbOmnspgPqE4DveK\/TmQTTOKMRrbIIbl2kKjfBv88yw\/g2UoH0rs\/XB278JWE+u4Xflg6XVC8U9VQdr9HNgJ83\/3jQZh1ns076yP9NFuG9McG\/z28ZxreRasEt\/71QS3rcsxx4a9VrlnwkNSrwOV0B8Ae+nvYlnMmoplsEtz5xmahznhnfRuooLi4+X5+U9Jcjwa096p97P4A65q2r\/ukYpm5r9rL3cV1IaAxn0YreO9hrEd46H\/5TCfj9Mb6N1FFaWjpan5T0l3zMlXUs9GlI3cbsY1N7\/8hiw44usRps7KYHTkjA7y04vn0vpxvJPFQySnrZ8\/0lPe4Zjr1NfbpPpwXqJsYjvH8Wo2GusgjuY1KtE+z7Co5vb+RUI6mDW5+UDNR0WiZp6b9ibrMI7yUJ9D1FGt\/uy6lG0pIe9nlSF\/mruLiYaXXJ7WKL4D5jEmfZgOD49oucYiR7j3ukPinpLwnvC2mZpKa7wdxoEd5XJMj3w\/g2Ui+49UlJLX3wRkt63FNpmaQ32djdqByUAN8L49tILdK7HqEP3PiL4E4JOuWv1CK49xi3135hfBsp2eM+V2qWvyTMp9AyKWGAsdvmzOVf5IxvIzWDW+dt+6usrOwCWiZlbLEIbn2K1dU584xvI\/Xs3bt3uIT3DH9VVFRMpmVSRgcTXmAqWni7uqzA44bxbaSakpKS4frAjZbO39aSHvckWialLLIIbl0atqtj75vxbaQmCelh1YFNcKcs3UThsEV4b3fsfU82jG8jVYNbapo+dFNd0vueSMuknLHGbnrguQ6953LD+DZSkYT0UH3gxl8S5BNomZR0vUVwV0qlO\/J+g+PbGziFSJUe9xCpqf6qqKgYT8ukJN327Q6L8HZh2V\/Gt5Hawa3ztv2lO7\/TMilrvUVwn5LKbuH3GRzf\/i2nDiljz549g3Xetr8I7pSmgXyzRXivbek+h4k+vq3\/cizklCIZe9yDpJc92V+hUGgsLZPS5loEtw6p9GrB92gzvq37lb7K6URSBrdO\/\/OX7vxOy6Q0HT8+YBHeu1vo\/en0xbdM\/ePbumO9biJ9P6cTSae4uHigTv\/zl+5DScukvJHGbnrg6BZ4b8MCof1ChNcs9T63jlOJpCO96wKd\/ucv3YeSloG41iK4D3k94HiaGQju+yK8Rj\/2kVRnTiOSMrh1+p+\/dDszWgaimwk\/6h4tvOfH+X2NCQT3icDndb\/M16V+zClE0gZ3KBQar6WzSbR0OzNaBp6VFsGti1TlxvE9ZUq94QvuWwKfX+99fDWnD0lpz549+dWBTXAjAl3O9SaL8N4U5\/dV4Qvun5p\/PM2pM11elnrCuPOEJ9DkPe4BOv3PX0VFRSNpGfhMtwhu3ZChfxzfk+7Kc58vvHXq34NeT\/wVqX6cNiR1cOv0P3\/pdma0DAIhudcivEtMeEu0eFoo9YjUb7y6x7Ts\/HKg+Unvur9O\/\/PX7t27CW4EDTZ20wNZoAyIQ4+7n07\/85eE+bm0DCK4yiK4j5nwrA4AzRncOv3PX7orDi2DCPKkzliE9xKaCmhGFRUVfXUWib90cwVaBnUotAjuM17IA2gOlZWVfaSXPdJfe\/bsGUrLoA46DHKjRXhvpamAZiI97D46i8RfukY3LYN6TDZ2NyrpAADNoaKiorf0ss\/1l67RTcugHjrlr9QiuPeZ8FRCAE0pFAr10puR\/tKlXmkZRDHAhB+6iRbeU2kqoJmC29vt\/WxJj3sgLQMLWyyC+6RUO5oKaOLg9oc2wY0YdDDhBaaihfcKmgpoQhUVFT0lvIf6S1cMpGVgaaGx2+asB00FNGFw6ywSfxHciIFuonDYIrx30lRAE5Eedg+pwf4qLi7Op2UQg7HGbnogSykATaG8vLy7t2HwJ6UrBtIyiNF1FsF90IQ3IgbQGLt27equGwb7S1cMpGUQo94mPJYdLbxn0VRAI0lQd9Mx7UD1o2XQAOstglu3GcuhqYBGKC8v76rbl\/lLF56iZdAA2VI3W4T3OpoKaGRwe7vgfFK6fgktgwaaY+y2OeMaAxqqsrKyi\/Sy+\/tL1y+hZdBAevPxgEV4F5n4b3MGJIeysrLO3i44n5Q+TUnLoBFGGrvpgaNpKqARwa3j2tVFcKMJXGsR3EekMmkqINafrmuv7Xz99df39Zd8jOBGY3WTut0ivOfTVECMJKjzvM0UPqndu3f3pGXQBFZaBPdpqU40FRCDsrKyc\/RmpL\/0MXhaBk2grdRNFuG9maYCYgxuHdP2lz4GT8ugiUwzdtMDWdgMsFVZWdlJVwj0l3ysGy2DJqJbl+21CO9yw\/RAwE5paWlHb4XAT0ofyqFl0IQGG7vpgRNoKsAyuHVoxF\/6UA4tgyZ2lUVwH5fKoqmAKHbt2tVBF5ryl87tpmXQxPKkzliE91KaCoiipKQkV4dG\/CU97jxaBs2g0CK4b5Oi4wBEC24dGtEqKio6Wzq3m5ZBM2gtdcwivK+kqYB6rFixIl1COyNYtAyaySRjd6NyKE0FAG7QKX+lFsG9z4SnEgIAHKBb491pEd4X0lQA4I4tFsF9UqodTQUAbuggdatFeK+gqQDAHQstglt3jmfRMwBwRCupwxbhvZOmAgB3jDF20wPPpakAwB3XWQT3QRPeiBgA4IDeJjyWHS28Z9NUAOCO9RbBfYtUDk0FAG7IljplEd7raCoAcMccY7fNWR+aCgDcoDcfD1iEd7FhmzMAcMYIYzc98HyaCgDccY1FcB+VyqSpAMAN3aRutwjvBTQVALhjpUVwn5bqRFMBgBvaSt1kEd6baSoAcMc0Yzc9sICmAgA36NZley3Cu9wwPRAAnDHY2E0PnEhTAYA7rrQI7uNSWTQVALghT+qMRXgvpakAwB2FFsF9m1RnmgoA3NBa6phFeF9JUwGAOyYZuxuVQ2kqAHCDTvkrtQjufSY8lRAA4ID+JvzQTbTwvpCmAgB3bLYI7pNS7WgqAHBDB6lbLcJ7BU0FAO5YaBHcunN8D5oKANzQSuqwRXjvpKkAwB1jjN30wBE0FQC44zqL4D5owhsRAwAc0NuEx7KjhfdsmgoA3LHOIrhvkcqhqQDADdlSpyzCex1NBQDumGPstjnrQ1MBgBvSpQ5YhHexYZszAHDGCGM3PXAMTQUA7rjGIriPSmXSVADghm5St1uE9wKaCgDcscIiuE9LdaKpAMANbaVusgjvzTQVALhjmrGbHlhAUwGAG3Trsj0W4V1umB4IAM4YbOymB06iqQDAHVdaBPdxqSyaCgDckCd1xiK8C2kqAHDHUovgvk2qC00FAG5oLXXMIryvpKkAwB0Tjd2NyqE0FQC4Qaf8lVgE9z4TnkoIAHBAfxN+6CZaeE+jqQDAHZstgvukVDuaCgDc0EHqVovwXklTAYA7FlgEt+4c34OmAgA3tJI6ZBHeO2kqAHDH+cZueuAImgoA3HGdRXAflMqgqQDADb1MeCw7WnjPoakAwB3rLIL7FqkcmgoA3JAtdcoivNfTVADgjtnGbpuzvjQVALghXeqARXgXG7Y5AwBnnGvspgeOoakAwB3XWAT3UalMmgoA3NBN6naL8F5IUwGAO1ZYBLfuYdmJpgIAN7SVOmER3ltoKgBwx4XGbnpgAU0FAG7Qrcv2WIR3uWF6IAA4Y5Cxmx44iaYCAHdcaRHcx6WyaCoAcIPOHDltEd6FNBUAuGOpRXDfJtWFpgIAN+hTkkctwvsqmgoA3DHR2N2oHEZTAYAbdMpfsUVw7zfhqYQAAAf0MeGHbqKF9zSaCgDcsdkiuE9KtaOpAMANuu\/kLRbhvZKmAgB3zLcIbt05vgdNBQBuyJA6aBHeu2gqAHDH+cZueuAImgoA3LHTIrgPej10AIADdAz7DovwnkNTAYA71lkEt85CyaGpAMANOl\/7pEV4r6epAMAds4zdNmd9aSoAcIOuTbLPIrx1rRO2OQMARww1dtMDx9BUAOCOayyCW9f1zqSpAMANnU14J5xo4b2QpgIAd6ywCO4zJryXJQDAAbrb+3GL8N5CUwGAO6Yau+mBBTQVALhBp\/yVW4R3uWF6IAA4o8DYbXM2iaYCAHdstQhuHQ\/PoqkAwA0dpU5bhHchTQUA7lhqEdw697sLTQUAbtCnJI9YhPdVNBUAuGOCsVvHZBhNBQBu0Cl\/xRbBvd+EVxoEADigj7GbHjiNpgIAd2yyCG7dTacdTQUAbtB9J2+xCO+VNBUAuGO+RXDrzvE9aCoAcEOG1EGL8N5FUwGAO0Ybu+mBI2kqAHDHTovgPuj10AEADtAx7DsswnsOTQUA7lhrEdw6CyWXpgIAN+h87ZMW4b2epgIAd8wydtuc9aOpAMANujbJPovw1rVO2OYMABwx1NhNDxxLUwGAO66xCO6jUq1pKgBwQ2cT3gknWngvpKkAwB2XWAT3GalONBUAuEF3ez9uEd5baCoAcMdUYzc9sICmAgA36JS\/covwrjBMDwQAZ+Qbu23OJtNUAOCOrRbBrePhbWgqAHBDR6nTFuF9MU0FAO5YYhHcOve7C00FAG7IlDpiEd5X0VQA4I4Jxm4dk2E0FQC4Qaf8FVkE934TXmkwVh2kBkqNkhpvwvPIp0iNkTpXqrdhfRQAiFkfYzc9cHqUr6MzUHQD4hVSpSa8u85dlqULXG2Xmu2FOXPIASCKTRbhesqEd9Xxy\/DC+gqp22MI6mh1o9RK75cKACCCHMse8irv9Rrgi4zd1miNrRKpEfTCAaC2+RYhercJL0J1q23wZqanfaZTu\/QHu3fIeKTPOZlf79Up46tdc9If7tAm\/YG0tLNfzzbA9xhukgJArWGPG+oJzi9L\/VTqR3W9plW6uad\/XuajE\/LbPjNvRPs\/FI7JeWvVhNyqumrF+NwPF43K\/uvMYe1fGNk764m89ukPWQS4joWz9CwAeEZHCMp7pH4g9bxX+t\/\/VP35NOmF9++c+eiMoe1+s2J8zvv1BbVNLRmd89rY\/m1+oj3yesJbh3XGcLoAIGynLyA\/L\/W0F9g\/kXrIH9hDurf+tgZtY8M6Uq2ckPvxrOHtf9s5J\/3hegJ8jfcvBQBIaT2k7pDSwPyF1LNSX\/cHpvSwv7l0dM7rsQTxmom5VRundKjacEGHmAN82pB2v2qXmfbZOsJ7twlvEgEAKa3CC+3veEMlZ0OybWbafToeHS2gr5+fV3Xbpd2rvrqjT9UPy\/tX\/d8jBVW\/OjawRj1zQ37V48X9qh64qlfV4Uu6Vl0+rWO9Ab58bM67w3tmfc\/UvX54DqcNQKoa7YV1jR5uzw4Zjywdk\/O3uoJ1x5xzqu67vGfV0wfya4W0bWmQn1jdrd5e+Yyh7X+jM1UihPc+qbacPgCpZpAJbxhcIxSH9Wz93ZXjcz+KFKTXzcur+vquPlW\/PDqwwYEdrJ9Kb\/zOjT3qDPDFo7P\/kp2Vfn+E8NbH91u1YPu1N+H57etM+NF+m\/eSbsJLAuhmzhuklkr1jeHvbOf9XTrHfr3UXBNeagBACugsdXMwDEf3zfqRjjMHw3Pz1I5VX7i6V5MGdrCeqsyvOnRJ14jhXTgm5387RZ4+eHkLtZ8G5p+kqnz13yb8VGokPbz2\/nPgmOp6Rqqwnr9vnNQjUu9GOPZDqS\/F+AsAQILRmRm19qI8r3fWE5FCs2Rh3tlQba7ADtbXdvQ5e2Mz+D6Wjcl5q45pgxfGuf2GSL1twlMlL5A63wve6iA9EHj9Wqk3vGP0Xw7LTXh6o27SvMX7XPWxpwPHai\/+JqmPpf7LhBcAm+69h2He56qPfU3qPC5vIDmtCoafTvWL1NO+ZV33quePDoxbaFfXj\/YOqNo2q1OEYZOc1\/SmaeD963BPzzi1nT6K\/5TUi6bmGPtyX4B+ZML3DnSFxXu8j+m\/FurapGJboAe91vu4vv5JL\/C3ecMskTzuO\/Y\/W3j4CEAz6G8CqwPqI+krxud+EAzJT1\/WM+6B7S+98bn7onNqhffcc9u\/ZCKvcRKP9U1mewF5beDj4wPhe9iEHxzSEL86ytfM9l5XfewTJjyW\/ZQ3HDM2yvEbAn\/3Mi5zIHloD7DCH3it09M+Hemhmrs392jR0K6uZw8WnJ3BEnx\/5\/dr8+MI4T0lDm2oQzUfROg9zw6E51+8P213FHrFd+xfTXgu\/ZveMEw0UwJ\/9y1c6kDymBIMuwsGtX0uGIo6Rc+F0K6un+zPr7rswprzvnXWS4SnLHW8tzkfztFffH\/0hiaCtpvaNw3vjeFrvxrh+PWWx04PHPcQlzqQPL3tg4Ehki8Fp\/3tuuiciA\/QtHQ9VtT37MM+\/vc6b0T7VyL0uuc2Yxue7wXjdRE+d18gPH9vaq9nXhcdk\/4wcPxjMbyvNYFj7+FyB5JDrf0mdUU\/fxCum9zh7E1B10K7us5c2r3WkMnAbq2\/Ffi+jpvmuzlX6gXjyAif+3+B8FzVgF8I1fWWVL8Yji8KHF\/J5Q4khzJ\/wOk62cEQvGtTD2dDW+vnhwuqts6oOdNk0ajsP0fodU9qpjbUXYGeM7VvgvYLBOf\/mNhulF4dOP7BGN\/XVwLHX8rlDiS+7sFwmzM8+3f+ALxieseqXxwucDq4tb58Te9ave4BnTP\/2dReiCqeNgeC84sxHv9g4PjtMRyrvyD+GDieB3GAJFDoD7acNumfXzm+5pzt+67o6Xxoa+mc8uD87tnD2\/82ENw63bFjHNv3c4HgvDrG4\/87cPzwGI4dETj2BS53IDlU+oNtTL82\/+4Pvg1TOpwdhkiE4NZ64MpetWaYtK29DOz0OLbvS4HwjGXLtUGBY\/8Y4zDL\/sDxt3O5A4kvNzhMsnBU9p\/8wXd8VbeECW2tnx0qOHsj1f89nNsr6\/uB7\/PKOLVvfiODd2vg+Idj\/PufDxw\/hUseSHzj\/YGmj4sHH23XqXaJFNxalRd3qbX8ayC4T5r4PEl5WSA4vxTj8V8IHL8thmODs1FeitP3DKCZ1ViXZGDX1o\/7A+\/SCzo4OW871uESXYDK1J5d0jUO7ft50\/Abi+oPjRhmORE49giXO5AcdvjDbGJ+22f8gVe+uHPChbbWk3sG1Jpdkp2V9rlAcI+MQ\/u+bBp+Y3FgI4ZZ9HW\/Cxx\/Lpc7kBwO+8NMN+T1h92t67snZHDruuDrA+Pcfc7J\/HoguNc3c9sGg\/fPMQ5VXG4aPr49NXDsc3W8Tud4v8iPAZA4NERqrAS4eFT2X\/xhp3tAJmJwa+2cW3PxqRG9sn5g4jufO3hj8SsxHv+Aafg0wjsDx4YivEZXHfy71Df4UQASR1YgyO4qHJPzlj\/svnld34QN7r1LO9cIbp3mGOfgDt5YvLaRwyxDLY\/TjTD8u+\/oJgt9Irxulff5TfwoAImjQzC4LxmX854\/7HTD3kQN7kPLa25zpuP3cQ7u4IMzsYypFwSOfTWGYZbgMMm\/1\/G6H0q9buwXuwLggC7B4A6uBvj9sv4JG9w3rupWI7inDGr78zgG92BTe\/3ttBiOD04jjOUx+eDGCXsivGaW97n9\/BgAiaVjtB73t0MJ3OMObCw8saDtT+MY3FcGwvNrMR5\/f+D4q2I4dlHg2BURhlJ09xydapjNjwGQWNoEg3tZEo1x71ta8yGcsf3jOsb9xUB47orx+N+bho1vGy+M\/RsML\/J9Tnv9d5jwuPdifgSAxKM\/xDVmlSwalf1Xf9g9eHXvhA3uXYH9KEf2zvphHIP7N6bmzcEhMRybFwjt35nYn3j0D7V8x4SXsl1pwjvP68dKufyBxHXUH2azh7d70R92ujlBos7j3nBBzXnc\/fIyvxEI7subsV39KwKeiPFY3a39196x70ld3MD3sNH8Y2\/L6tKZKqu57IHEtssfZpMK2j7rD7s9SxLzyckf76395KQuVxsI7vOasV11HHmB1LgGHq\/3H3S53X5NMBymNyIvkZro\/VIAkODW+MNsSI\/W36mxpKv0WnWN60QLbh3iqbFWydjcd0zttUq6cfoBJKLJ\/jDT9TxWBnqqiTiXOziHe+aw9i8EQvtmE9v0PABwRqdgT3Tx6JqPvZ9am1jrcT93qODsqoY1HnevfWNyG6ceQCI76A+18QPa\/Ic\/9DZP7ZhQS7s+vD2w7+T43I8irAw4i9MOIJGt8Idax3bpXwgOl+j61okym2RHYHEp3fjY1N5zsjOnHUAi6x0cLpk3ov0f\/OF31cxO0ut2P7i\/trNPrdkkA7u1\/lbg+yvmlANIBnv94dY\/L\/PRYAB+5jK3d3rX4Zzts2vu8L5kdM5racbcHQjuqZxuAMlgarDXvWBk9qvBqYE\/2Z\/vbHDfvblHrd720B6t\/8XU3msyi9MNIBnogxlH\/CHXs0PGI8GNg0ML85yc1\/0vJf2q1k6qOZNEd6uP0NteyKkGkExm9uzZ86Hs7Ox7q4Nu2uB2vwz2Yl17DP6ZG\/KrrpxRc4hk5fjcj7t3yPiKqT13uy2nGUBSqKio6FtaWnqP1EdLly59tjrssjLT7i0ck\/O\/wfC+7wo3xrt\/frigqmh+Xq0hkgm1N03QmsmZBpAMgd27rKzsVql3paq0SkpKPujSpcsDNYZMAhssrJb6wtUtO0XwZ4cKqkoXda4V2vNGtH8lLa3WEIluJsCTkgASV1FRUZfy8vJjEtR\/rw5sf61ateqX\/uDTjXaDc7s1vPWG4C9bYMz7qcr8Wsu2aum\/DrKz0u4PhLauP92fsw4gYQO7tLT0lITzO5EC26s3ly1bFnxE\/K5xA9o8FQxKrX2FXaqePRi\/JysfK+pbddm0jrXex\/KxOX\/Pa5\/+xQhDJHM58wASTmVlZSfpYVdKKP+tnsB+V15zd3Fxsa6a11PqdDAEdew4UnhvndGp6ms7+jRrYOsvB103ZXWEv3\/Z2Ny3u3XI+HKE0N5uYt+EAABaTigUypYedomE8uv1BPZ7Gtjy2h6Bw0d6www1wvC8Pln\/GpwmWF0VSzpXfaeJ96n8xeGCqs9t7VV12YW1e9nVwyPS034oQmhXGOZsA0ikIREJ5INSr9UT2O9L3aU3KOv5Urrs653BUNQnK7WXGylItfSmoS72pLM+GhrYT+4ZUHXHxh51Bnb1OiRtM9M+GyG0D0nlcCUAcJ70rvt5s0TeriewP5Ie9pfktQWWX3ZapPDWHWUuGtH+5bpCVUuXV927tHPVvZf3PLuu99MH8ut4XD0c1DrccvO67rUWigrWivG5H4zum\/XjCIGtpasd5nE1AHBaSUnJeRLI90t9EC2w5c9BDfgrxkjdFikoC7plPnbxmJw36wvaYJjrzcWrZ3U6u3jVpqkdq9ZMtDu2upetKxjWEdrlJrzLOQC4SYJ4lgTx4\/WEtT+whzXyr9Me+rFIgZmebu7RXdQLx+S8ZRvAsdaCke3\/R4do6gjs6s1\/GdMG4J7Kysq0ioqKxaWlpf8WJbDf93rhw5rwr28vdU1d4akBrgs7zT23\/UurAg\/tNKR0HP2CQW2f65YbccZIdem\/BHgqEoCTgZ0pPecNEsS\/ihLYb+o4d5Sbjo2h0+ummPBKe3WF6V3tMtM+q5sPXzik3fO6HdqK8bkfWgT1O7oWuM4Z731OxtciPAEZLN2lnk1\/ATg3HNJdetf7JYxfjRLYr8rryiTgO8TprbWTWmvqGPsOlq7Up2PTvTplfLV\/58xHh3Rv\/W0dH++Xl\/kN7VFntUq71+brmH\/MGhnL1QHAKRLCY3R+dV2PpfvqRXndzt27d7dpobeqGw6vlDoTQ\/A2tDSwde3wdK4QAE649tprW3vDIc9GCWutZ\/W10sPOcOTt65KpE6V2mgjTBxtR+gvhChN+IIiFogA407se4C369BeLwH5Sb046\/i1pL3yS1GapwzEGuQZ1iVSh1FCpVlwhAJygs0MksOdJfVOn7EUJ67d02ERqZIJ+uxq+vaRGmfCNzVlSC6QuMuEHfCZ6Ia2Bz9oiAJzrXXeUAN4tf\/6nRe\/6BX1tHG84AgCqe9clJSVTvJuNb0d7YEbqOxLsKwQ34QAgnioqKnp6q\/P91qJ3\/Tdvlb6htBwAxJHODNHesgTxo1IfWgT2r3Q6X1FRUTtaDwDiyJt3fXuUpVQ\/2bRA6iGpqbQcAMTR9ddfn6e9ZQng5yzCusqbn71D6hxaDwDiRJ9Q9A2FvGcR1m\/o2LXenKT1AKQ0nXERr1kXOm6tD714q+29aRHWOjPkSQn4rZWVlW05WwBSnvZedaaGrjPdnL8YfFP43rAcCnlZn4DUJyE5SwBgzs6HzpJQvEnqYy8ob27ir18931pvMv7JMqx1XvYDuqmBHs9ZAgBPRUXFeAnHXwdCs9GzMryNCSbL1zoh9XvLsNax7UflF8g6Ob49ZwcAagarbiBwSELyQ\/+8aPn\/Nxraw60eBvE21v2DZVifHbf25lx34cwAQAQSriOqlzj1DY9ofSz\/\/6NYvpbOBvHdYHzdMqy1ntenH0OhUA\/OCADU3cvOkLDc6+2b+FEdvd97Lb5OJ12z2tss981YwlqOqWzgjugAkFp0c1upp6t71nWFq96kjHT8nj178iV0r5XXfFfqgxjD+pD28jkLAGDXy9b1qbd6W3V9ZBG0J73jdKbJbG8jgqdjCOpPetYs7AQAMZJe8kAJ0R9H62X7x7ilvu8NgfwthqD+sPoGo67cR8sDQOw+5fWy37bsZTek3vGm7m1lNggANIL0ePtKz\/d7vpuNTRnWr0pQ3yd\/FvLIOQA0XS\/7rSYMbP06T+s4t87P5glGAGgixcXF3SS0v9GEvexf6C8B\/bq0LgA0MZ1P7c2l\/ripetn6CDy9awBoYnpDUAL2q800lq3zuVfRygDQdL3slVJ\/DTyu3pSh\/ZHUf+p6JrQ2ADSSBOsdzTS9z\/opSgBAbMGtK++9JKH6fj0zQZpq6ORj6dkvpNUBoGl8SkK1uwT4OJ1X7a0jcqNuPiD1hHz8JfnYe3X0pD+0vJmpvwDekddPp7kBIE68qYJjJICXaLh7W4B9Xv78oW5TVtfGvBruvjF0fUpyEq0JAI6QEO8qdb6uqy1\/bpc64q2v\/QOpFzW45WPFtBRg7\/8Dy613NL4Mb5MAAAAASUVORK5CYII=","width":118}
%---
%[control:checkbox:9986]
%   data: {"defaultValue":false,"label":"plotSoln","run":"Section"}
%---
%[text:image:04d7]
%   data: {"align":"baseline","height":53,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAukAAAB2CAYAAAB1aw20AAARjUlEQVR42u3dCbQkVXkH8MsiwzKAGtmJIGEJRgYFjhONIkiMIChgAhqFQASUNUwiQmRzRERRBFQQETEDCTFEJBE5RHTAgxIMW6JhCyKIUUjcCCowYNb6Tt86706n9+W9fu\/9fud8h8N0bX1fVfW\/q2\/dSgmYq46t6n+VUvOybqlqHadBABDSlVKTVXs6DQLAZIf0FVU9ppSa8\/VMcdy\/3mkQACY7pH9Ac8C88JdCOgAI6YCQDgAI6YCQDgBCOiCkAwBCOiCkA4CQDgjpAICQDgjpACCkA0I6ACCkA0I6ACCkg5AupAOAkA4I6QCAkA4I6QAgpANCOgAgpANCOgAI6YCQDgAI6YCQDgBCOiCkAwBCOiCkAwBCOgjpQjoACOmAkA4ACOmAkA4AQjogpAMAQjogpAOAkA4I6QCAkA4I6QAgpANCOgAgpANCOgAgpIOQLqQDgJAOCOkAgJAOCOkAIKQDQjoAIKQDQjoACOmAkA4ACOmAkA4AQjogpAP0avWqLqjq4BEv9+Sq3lfVKpoYIR0Q0oEerVnVsjEcSx+q6oTZ0ghrV3VtVbdVtXDEy96sqofziWt1+xtCOiCkA108u6qbqrqxqgUjXva2Vf0oNS5OT\/RF5GdVtbyq+6vaYEzr2K6qn1Z1eXJFHSEdENKB9uLi8e1V3VnVumNaxy5VPVnVeZPcEBdW9XRVO455Pfvnk9bp9j2EdEBIB1pYJR9HT1S19ZjXdVQ+Vo+exIY4JG\/cSdO0vmVV\/XdVe9gHEdIBIR1o8s58\/Bw2TV8Iorv3M1XtPEmNsGFqdEG5t6rVBlzGW6u6tKrte5w+utP8LDX6qC+0HyKkA0I6kG2VGl1Q\/n6IZRxZ1SVVbdHHOiOkfys1uoBPhCvySeSAAeffrTgRfaqP+U7P85xqX0RIB4R0ILs+Hzu7Dzj\/7xXH31l9zPexPM+Rk9AIO1T1P1XdnQa\/kfMjRUMs6WO+uFs3+hnFVfx17Y8I6cxhG+WgdnxqDG\/7K5pESAda2j0fNzcNsYzLiuPvoD7m+9Wq\/quq71W1xqScRJYMsYw7iobo96bTS\/N877ZPIqQzB22bz7O\/rOqhqq6s6taqfpEaV3pC3LAUw39trrmEdCB9ZYBw3ezh4vh7fp\/zXpPnO2ImG6H+thD9bwYdcnG9vIx4M3FFfNU+5395nvfHk\/CNBYR0Rujw1Pi18D9T4wao8vx4aA7uS4t940xNJqTDPLdjPmbivsW1h8i39bH37QHm3zfP+500g8OFn5g34oYhlrFX0RBXDzB\/fGj9MM+\/l30TIZ054oT8947uhIe0mWZZsV9EvUWzCekwz30oHzNXDrGMg9Ng90rW1qrqqTz\/LjPVEHfmDfjTIZbxwaIhjhtwGZcN0ZAgpDNpDsrhvNt5bXFTSN9U0wnpMI\/FVevv5mPm8CGW8+ni2Pv9AZdxXZ7\/\/TPREJsXb+ClQyznG8VydhhwGYenqS4vq9lHmTCvTMMPxSSkzx\/xM+vjaern2ud2mHaLYr+4X9MJ6TCEGAJ7k1n+Hl5SHDNbDbGcB9LwFz\/e3e7cHN8k3pEaI65Ef8a7UqP\/Yi\/fQOIKTvzMuqDLtG\/OK4\/+5Gv1sOzolnJaalw5L+uXeTnxYKKzm17bp8eG2KlozJ0cZ0yYq1KjT9sBQyxDSJ8\/ri7+1hd0mfaQYtqLNZ2QDkM4KGfGpVWtOQ3ri24gX6rq56kxEkqc79brYb7FeRu3bPHacfl4eTz11hc83ucZTdmzHHHwyRa5tdchHV+b2tx4en5qPFhor\/xN4v7U26NKjysWeHCXaT+ep\/uXHjc2vp1F3\/HHinqyWN+Kptei3tXjsuOG0Wfycv7QccYEhvR6P4+fv7YT0mnjhWmqm0svFx2WpeF\/kkVIhzqk1\/vbg1XtP8Z17Z6D9JKcUz+a13tj6jyAyHZF3mvV5\/yz+bWb+zjn\/qQpez5VtMNTLbLp23pc9gatjt9I7j9IK4+2Um\/0o10W+LViga\/qMu3X83RfGOKPdFaxvmOH\/IM\/mJdznuOMCQ7pUTFSx7mpMc6\/kE7pE8Xf+fup+5Wgh4vpN9F8QjqMKKTXtbyqF414PQtzTt2v+Lf9i3Xu2mHeE4vpPtzi9fvya5cOsX2fKtbx5iHf68\/yck6J\/1kjb2Dz1eRbixW2e+hPdFl5Ok1d1e72U8ejedoLh9j4UfRHr91UfAuDSQ7p9ZXS+EYeD6bp5T4KIX1++F7qfUSBrYpp79N0QjqMIaTX3ZEvr2rDEa0nPsP+runfTijW1+mGz2uL6Zq7RK+a82u89t4htm8U\/dFr9+Tl\/HX8z4GpcUW5\/NB\/Xpoahzy6m7S7MrN7sVHdgu7aRdA4dYhvUnV\/9EHGR293MnvIccaEh\/Tmiq5prxXS570XNO0X3bocvq2Y9iLNJ6TDmEJ6nff+o6qT0nDPpInsF\/3eFzf9+5eL9b26zbyRbeub6iPXrt\/0ejm2+ZEDbt+mabQ349fv67b4n3jC0VlNExzd44l8aTHd6V1WumUx7TEDbviexTI+P4KG+GQR+GE2hfS6vpiDmpA+P+3atD9s02X6vyimPVDzCekwppDeHNbjXsTXDbiOuPjwnaZ\/2zg1uoHGsv+9qtXbzLtzsS13tHh9l+L1N42gDUZxM\/5VZeCPpL6oaYLbihUu7rCgr6be+gOF30i9\/SzRSTk++h+NoCHOK75d9fp0pxjwfrlSY64f9hjSo+LXpbiBZl0hfd7ZO618s1K389j3iw\/OjTTfnA\/p33QuVWOuu\/v4rIr6SmoM29iPGEnlxKZ\/K7u6fKTDvH9cTHdOi9dfVby+34DHXDk++igeDvfnaaonS8cw3anPYvQ\/X1F8OHQbfvGlxXIPGnDD\/6FYxo4jaIj3F8tb2OM8N\/S5Qyo17qqvVPwgnyBWEdLnjfIq0INdpt2mmPYeTTcvQrpSk1jP5Iuu6w6xn9\/dYx7829T5l6XXFa\/vOeC2PFgsY7MRHMMX52U93erF9xUrO63DQspvH8t7WGkZ0g8eYKNH3R+9OaSv1+M8QroS0pkUca\/PE6m3vpAXFPvDhZpOSFdqlob0RWnl+7PaiZz4kzTVY+LZXUL6XgNsS9mn\/YERHcMXF+30\/9yTeuvf+J4ew3yrK\/RHDLDRexXz\/82IGuK8Ypm9PnVUdxc1ad1dVrQ54Qnp8yuUxS+a7UbYOqxpnzlAs82LkK67i5oL3V065c+TO0y3Y+rcH735gvMgY7z\/QTH\/JSM6huvuLo81v7BdsbJv9XFF+ZU9rHTLNFx\/8rOL+ZeMqCEuKkIOTBI3jtKrrdJU18NDW7y+JJ\/s619c4r8barZ5EdLdOMq4TceNo83+qVh+p8BfPmyzXb\/1ssvgIP3JP5OG78rd7HNp6rkXKzmmWFmnB\/wsSFNPV+qlP3pYKw03BGN5M+tLRnwy+67jjFkW0uMk1e1mbSF9\/tg7B\/XoCvjW1LiCFCMVxAPkohvMAcW+cLfmEtJhzCF9lEMwlsoncj7Sx+dou2NhszTcEIwPFfM\/f0TvsR6C8fbmFy5Ovf0c+orUvj\/6x1Ljp4hWHsnzfLLPDY7+4vVQO3FFqFV\/9BenxkM9FvSx3PoJqDc4zpjwkO5hRnTza\/ncGl\/g4sFxN+d9Zc384VPvCx\/XVEI6jDmk1w8z2mDE69ujWMdVHaaLe7PqbqPt+qPX09UXnc\/sc1u2SN1v3N8tNX5F6Ef9BNQrm1+4uljhyzos4JRiuuar4v9a1RvbzFc\/4fPaPje47Nh\/TZtp\/ir13x+o\/gb0accZEx7S40vquR1ONEI6nXy22Bd+V3MI6TDGkB4Xb180pvW9qVjP+R2me2Ex3Z1dllnfi7msz205pFjHZ9pMs3yAz9+f52V+sFXQrVe4bYdvHTcX0+1dvBZ9g2IElvXbzHt+Guxx1O8s1re0xesxWH3cBbtNH8tckKZGiznaccYEh\/TrUuN+kX4J6dTqXzHjF5nnaQ4hHcYQ0uNq8v5jXt\/rU\/uLxKU\/KaY7t8sy64e8fb3PbSmf3XNsi9dfU9WTqb97gDZMHR44d2rq\/nCiJU3fmH69eG1p6jwcY90vMn4G6WfonbLzf3PH\/ujrHkPwvKfPxi1vFljkOGMCQ\/q3q9pniGUI6aR8ju51QACEdOg3pD+R89+a07C+8nkP7YaSjavovyime0OXZR6Vp4t5+hne+5xiHa9pei1+9Y4bP\/u9CLxnsczNm1+MTu8rOrz5GDoxxpws+65vnV+LP070Cd+3w8o3TVN9a1\/Rx0aXY6yXfeXXyGEm+pSv1mdDvD0v7\/EB5oVxixGTnjXkMoT0uS2GDos+6Md0me6M1NtwZQjp0K\/oQbHJNK+z7jodzwZpvg9xUf73sm\/8c7osb4fU+sJzN\/sW8+1W\/Ps6qTHU5OcGeG8npy4DmhyYg3qE6bPzt4P4pvTlPFNcgY6r17fmBf1Znua61LkTf62e75Q+N3xZnu9rqXHjQHxhuKuqr6b++unW6p83LneMMUcJ6XPXrvnDp\/77\/mab6bbKFyJimkd7+LBCSIdJFzds1vcULs9heb\/UuLgcV8PLe3D+scdlPpCnf0cf2xFX3a9JU\/da7p4aF03iV\/AvpMbD5vr1pdRDF534OeG8HKgfyEE4+veUT+WM7irRPeYbqTGaQDyptJchdk7IG3BLnxsefeEPzm8g+rRfnxpjAg\/y5NG4cl4\/hWpv+ztCOrPMJWnlboetbtKK83X9oJEnU\/chOxHSYbaIDBr3K8YV6+jy\/M0c0uP+rfLXww\/3uLwPpM6Dk3QK6kfl7bgvh\/UD09STv\/uxsKqn83YsnqmGjS41MVJFDImz0Qxtw665EX6URjd2JwjpTJePpqkbQc9p8XrcTH9XnuahmTzhI6TDNLu3OAZe3OM8i9LUBY11Zmi735i34YEBQ\/7IXJE35KQZWv\/lef2n2ZcR0pmF4v6eGIkgLnbEzaCfT40ufJelxi+gEd7jIUbxC+hamktIhzkgenlEd5KXd5hm12L\/v73P5V+f5ztsht7fdXn9R810Qy\/KHyIPp+m\/aTOGH1uRvy0Zigwhndkshuv67fyhcnwO5XEP0faaRkgX0plD4knzT+T9OobPfkGb6b6Ypn5l\/K0+1\/HqNPVE7+kW9w\/FfUbxAKaJuLBS37j5lmle75l5vWfY5xHSASEdJt4VaeX7cLbvELKjPjHgeuobN39nmt\/fRXm9x01Kg0d\/9HjEeYwYs2Ca1rlp\/iYW\/X3WtM8jpANCOky8G4v9+ooWr2+cGr0z6pFWBh3CeMucE6Mb4arT9N7iZte4V\/OONGFDgh+aprdvePxhow\/nHvZ3hHRASIdZ4ewcnmOfbr6pcoOqbsv7fNyfs\/aQ66pHIZyOvuHxXuLqfYzqsvMkNvwF+RvEy8a8nvppp++yryOkA0I6zBrPTY0Rq2L47hgTPa4+75Qz3b9V9dOqDh9hcI7jKO5f3GHM7+v4fKweMakNv3pqjC8Zw4RtPKZ1xCNi44Eey+znCOmAkA6zTgyNGKMCxlXzH1f1SGo8aDMC7tojXtdaeT3\/XNX6Y3o\/i\/MXgXMmveGjT\/pVuTFG\/US8zVKjn9Ky\/IUAhHRASAc6WZi\/BNwyhi8BW6fGSC7xzItVZkNjRICOri8HjXi5p1e1dLY0AgjpgJAOEyEGGVlW1T4jXu65VS3RvCCkC+kgpAMAQjogpAMAQjogpAOAkA4I6QCAkA4I6QAgpANCOgAgpANCOgAI6YCQDgAI6YCQDgBCupAOQjoAIKQDQjoAIKQDQjoACOmAkA4ACOmAkA4AQjogpAMAQjogpAOAkA4I6QCAkA4I6QAgpANCOgAgpANCOgAgpIOQLqQDgJAOCOkAgJAOCOkAIKQDQjoAIKQDQjoACOmAkA4ACOmAkA4AQjogpAMAQjogpAMAQjoI6UI6AAjpgJAOAAjpgJAOAEI6IKQDAEI6IKQDgJAOCOkAwDSG9BVVPaaUmvP1jJAOAJPt7cWHtVJq\/tWeToMAMHk2repeQUWpeVm3VLWO0yDMXv8HRX2DEloor3AAAAAASUVORK5CYII=","width":327}
%---
%[text:image:417c]
%   data: {"align":"baseline","height":20,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADUAAAAxCAYAAAB6d+FmAAAC0ElEQVR42u2aO4gTURSGs6Lugo1WW2ghgiyCr1VWbRSR9YEgKoKohcQmEDAviYhBIaVbbKEWYi22YidoobUItoqwjSui6wt119Wsj+\/onXAcJslMZpI7AxP4Sbh37pnz3TP3zJ2TyWQS9imVStvRK1G5XL5ZqVRWZpL8MUCf0G+lz+hYIoGIyDYPIEc\/i8ViLmkRGkMfWwA5WkD7EwHEutmCs+87ADl6zfHLm4MLhcIqGs7RcV0WoA1xCa3vIkL\/CTsX\/w7G2Bka5oIMjlo4M6GBmOTRABHSeirh3S0LzSYQugHHgAPEJG+l7UOXtr6LgQeqYQZdRVf6Jc5frdfriyKIkOgHQToi1+0XpxGD+ywnhc348a5bICboqLMYmx02784hgRYAOqEzjHWoSIHiABU5kG2osECMP9lqC2IFiqS0qSdAtqAM0Ey3QOhUp81iX6F6DtRvKM6xsedA\/YQKCdQgyx0PcrKeQ4WNkE4K+LhGb6usQOHQOnnOCb31+WdrNW1TQC22BoW9Ddh9i6bRfNDdNkCH1c59LW0vpc8qFDYfo\/tkvMFqtbqM3xdkffgAmseXQ44dM3ba6bcGlc1mh9yzbaK3k\/Y37YAYc9Dl47A+xhoU0dlh7A579I3qRx6lbwAd8PAxHlA4V5BF3ea8Z11Ac62e52IDhb1bZuZL+lFdRWtQpflZzj3exlZsIvVc2b7jdW8xiWSWVL2ng4\/2ofL5\/Ars\/XJdXudN9wC\/R4Ce5PurFH58RN0+FLb2et130D1VVJlCu3zasw9FFC67dwboialUnZadQcBJsg+F09ewd9tkwLFcLrckZOTjkSgi3pmkUClUCpVCpVApVAqVQqVQ0UDp6s5IHKFMeaz5doufYuYz9bf\/XXmXQaqgcZH4I34pqBd+Qluz\/LpBUF3qCEUol3LgwyQAEbFHUrDxW6OTyk7NFEsaMYNpGL9qfoH+AOOEPfJuI6OmAAAAAElFTkSuQmCC","width":22}
%---
%[control:dropdown:0856]
%   data: {"defaultValue":"\"g\"","itemLabels":["g","h","i","j"],"items":["\"g\"","\"h\"","\"i\"","\"j\""],"label":"system","run":"Section"}
%---
%[control:dropdown:9d75]
%   data: {"defaultValue":"t^2\/6","itemLabels":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"items":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"label":"f","run":"Section"}
%---
%[control:slider:6699]
%   data: {"defaultValue":1,"label":"a","max":5,"min":-5,"run":"Section","runOn":"ValueChanged","step":1}
%---
%[control:dropdown:4a14]
%   data: {"defaultValue":"\"g\"","itemLabels":["g","h","i","j"],"items":["\"g\"","\"h\"","\"i\"","\"j\""],"label":"system","run":"Section"}
%---
%[control:dropdown:4286]
%   data: {"defaultValue":"t^2\/6","itemLabels":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"items":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"label":"f","run":"Section"}
%---
%[control:slider:955c]
%   data: {"defaultValue":2.5,"label":"a","max":3,"min":-3,"run":"Section","runOn":"ValueChanged","step":0.5}
%---
%[control:dropdown:0ad0]
%   data: {"defaultValue":"\"g\"","itemLabels":["g","h","i","j"],"items":["\"g\"","\"h\"","\"i\"","\"j\""],"label":"system","run":"Section"}
%---
%[control:dropdown:00b6]
%   data: {"defaultValue":"t^2\/6","itemLabels":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"items":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"label":"f","run":"Section"}
%---
%[control:dropdown:39c8]
%   data: {"defaultValue":"t^3\/10","itemLabels":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"items":["t^2\/6","t^3\/10","sin(t)","cos(t)"],"label":"f","run":"Section"}
%---
%[text:image:51bc]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
