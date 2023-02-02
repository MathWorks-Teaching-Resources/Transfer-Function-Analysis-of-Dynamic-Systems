# Transfer Function Analysis of Dynamic Systems [![View Transfer Function Analysis of Dynamic Systems on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/94635-transfer-function-analysis-of-dynamic-systems)
**Curriculum Module**  
_Created with R2020b. Compatible with R2020b and later releases._  

## Description ##
This curriculum module contains interactive [live scripts](https://www.mathworks.com/products/matlab/live-editor.html) and a [MATLAB&reg; app](https://www.mathworks.com/products/matlab/app-designer.html) that teach transfer function analysis of dynamic systems. In the first script, students learn to derive transfer functions from ODEs and compute impulse, step, and forced responses. In subsequent scripts, students perform pole-zero and frequency domain analyses. Throughout the module, students apply transfer functions to analyze the dynamics of physical and electrical systems. In the final lesson, students perform a frequency domain analysis of an LC filter in a buck converter. A review of Laplace transforms is also included for students seeking a refresher. These lessons can be used as part of a lecture, as activities in an instructional setting, or as interactive assignments to be completed outside of class.

The instructions inside the live scripts will guide you through the exercises and activities. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the Stop button in the RUN section of the Live Editor tab in the MATLAB Toolstrip.

## Suggested Prework ##
[MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) – a free two-hour introductory tutorial that teaches the essentials of MATLAB.<br>
[Introduction to Symbolic Math with MATLAB](https://matlabacademy.mathworks.com/details/introduction-to-symbolic-math-with-matlab/symbolic) – a two-hour self-paced introductory course that teaches the basics of symbolic mathematics in MATLAB. Note that this course is only available to users with access to the Online Training Suite.

## Details ##
**`Part0_ConceptReview.mlx, Part0_ConceptReviewSoln.mlx`**  
An interactive lesson that reviews Laplace transforms.

<img src="https://user-images.githubusercontent.com/81383420/122928267-b055b100-d337-11eb-962d-80c290c1e6a6.gif" width="500">

**Learning Goals:**
- Compute Laplace transforms by hand and using symbolic math
- Describe the properties of the Laplace transform
- Apply Laplace transforms to solve initial value problems
- Recall the definition of a linear time-invariant (LTI) operator

## ##
**`Part1_TransferFunctionBasics.mlx, Part1_TransferFunctionBasicsSoln.mlx`**  
An interactive lesson that teaches how to derive transfer functions and compute time responses analytically and in MATLAB.

<img src="https://user-images.githubusercontent.com/81383420/122928938-573a4d00-d338-11eb-80ef-2c979eb17236.png" width="550">

**Learning Goals:**
- Derive transfer functions by hand
- Derive transfer functions using symbolic math
- Numerically evaluate and plot the impulse, step, and forced responses of a system
- Analytically derive the step and forced responses of a system
- Explain the physical significance of time responses

## ##
**`Part2_PoleZeroAnalysis.mlx, Part2_PoleZeroAnalysisSoln.mlx`**  
A live script lesson that teaches pole-zero analysis.

<img src="https://user-images.githubusercontent.com/81383420/122929255-bb5d1100-d338-11eb-8d05-7aa7b6666f71.png" width="550">

**Learning Goals:**
- Describe how the transfer function of a DC motor is derived
- Identify the poles and zeros of a transfer function
- Assess the stability of an LTI system based on the transfer function poles
- Relate the position of poles in the s-plane to the damping and natural frequency of a system
- Explain how poles of a second-order system relate to its dynamics
- Examine how transfer function zeros affect the dynamics of a system

## ##
**`Part3_FrequencyDomainAnalysis.mlx, Part3_FrequencyDomainAnalysisSoln.mlx`**  
An interactive lesson that teaches frequency domain analysis using transfer functions.

<img src="https://user-images.githubusercontent.com/81383420/122929840-65d53400-d339-11eb-8a8a-2c1522bbfcf0.gif" width="550">
  
**Learning Goals:**
- Explain how a Bode plot is generated
- Use MATLAB to numerically calculate the frequency response of a transfer function
- Discuss how features of the Bode plot relate to characteristics of physical systems
- Describe how to derive a differential equation model for a buck converter with an LC filter
- Apply the Bode plot to analyze an LC filter in a buck converter

## ##
**`polesApp.mlapp`**  
A MATLAB app that lets you construct a transfer function by graphically positioning the poles and zeros. You can also compute and plot the impulse and step responses.

## Products ##
MATLAB, Symbolic Math Toolbox&trade;, Control System Toolbox&trade;

## License ##
The license for this module is available in the [LICENSE.TXT](license.txt) file in this GitHub repository.

## Educator Resources ##
* [Featured Courseware](https://www.mathworks.com/academia/courseware/course-materials.html)
* [Teach with MATLAB and Simulink](https://www.mathworks.com/academia/educators.html)
* [MATLAB Grader](https://www.mathworks.com/products/matlab-grader.html)

Have any questions or feedback? Contact the <a href="mailto:onlineteaching@mathworks.com">MathWorks online teaching team.</a>

# #

_Copyright 2021 The MathWorks, Inc._
