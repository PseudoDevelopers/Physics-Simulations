# Gravity Simulator
This is the simulator to simulate the motion of bodies under gravity. Newtonian mechanics is used in this project.
## Directory structure
There are two main directories:
- [Computations](/Computations) contain all the code which performs all the computations and save data in database.
- [Visualizer](/Visualizer) Use the data stored in database and visualize it.
## Formulae used:
- Newton gravitation law ![](Images/Formulae/gravitational-law.svg)<!-- https://render.githubusercontent.com/render/math?math=G\frac{m_1m_2}{r} -->
- Newton second law of motion ![](Images/Formulae/newton-second-law.svg) <!-- https://render.githubusercontent.com/render/math?math=F=ma -->
- Elastic collusion 
  - ![](Images/Formulae/ellastic-collusion-v1.svg)<!-- https://render.githubusercontent.com/render/math?math=v_1=\frac{m_1-m_2}{m_2%2Bm_1}u_1%2B\frac{2m_2}{m_2%2Bm_1}u_2 -->
  - ![](Images/Formulae/ellastic-collusion-v2.svg)<!-- https://render.githubusercontent.com/render/math?math=v_2=\frac{2m_2}{m_2%2Bm_1}u_1%2B\frac{m_2-m_1}{m_2%2Bm_1}u_2 -->
- Combined velocity after collusion ![](Images/Formulae/combined-velocity-after-collusion.svg)<!-- https://render.githubusercontent.com/render/math?math=v_f=\frac{m_1u_1%2Bm_2u_2}{u_1%2Bu_2} -->
## Technologies
[Julia](https://julialang.org/) is chose due to its high speed and very ease to use. And [MongoDB](https://www.mongodb.com/) is used for database.
