# EMTAT
Electrical Modeling and Thermal Analysis Toolbox<br>

<b>Introduction</b> <br>
The Electrical Modeling and Thermal Analysis Toolbox 
is a Simulink toolbox intended for use in the modeling and simulation of electrical 
systems at time scales consistant with the simualtion of mechanical systems such as turbomachinery. EMTAT contains generic electrical 
components used to create complex systems to meet the needs of a developer. Development of this tool
was initiated on behalf of the NASA Transformative Aeronautics Concepts Program (TACP)/
Transformational Tools and Technologies (TTT) projects.
<br><br>
<b>Description</b> <br>
This simulation toolbox has been developed to model the electrical portions of Electrified Aircraft Propulsion (EAP) systems, including self-
heating   of   electrical   systems. Dynamic models of EAP systems  often  include turbomachinery, an electrical  power  system, and a thermal 
management system. These portions of the propulsion system can operate on timescales   covering   six   orders   of   magnitude,   which   poses   a   
challenging   modeling   task. Assumptions and approximations are made in an effort to capture the dynamics relevant to engine,   electrical   
system,   and   thermal   system   interactions,   while   still   allowing   for   fast simulations. These assumptions and approximations enable the electrical 
component models to run at the time scale of the turbomachinery, neglecting the very high frequency electrical dynamics, while demonstrating 
representative behavior of the end-to-end system. Thus the models execute in an acceptable time frame for what would otherwise be an 
extremely stiff simulation.   The   resulting   simulations   of   EAP   systems   are   appropriate   for   system-level control  design and analysis. 
<br><br>
EMTAT is written in MATLAB/Simulink (The Mathworks, Inc.), is open source, 
and is intended for use by industry, government, and academia. All EMTAT equations 
were developed from public sources and all default maps and constants provided in the 
EMTAT software package are nonproprietary and available to the public. The software 
is released under the Apache V2.0 license agreement. 
<br><br>
<b>Getting Started</b> <br>
Stable releases of EMTAT are located under the <a href= "https://github.com/nasa/EMTAT/releases" >releases tab</a>. It is encouraged that a user
download the most up to date version using the appropriate software download button (green button). 
Installation instructions are detailed in the user's guide which is included within the package (Documentation/TM-20205008125.pdf). 
<br><br>
EMTAT encourages open collaboration and if a user wishes to become a developer the software 
may be forked at any time via the main page link.
