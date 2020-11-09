# Gravity Simulator
This is the simulator to simulate the motion of bodies under gravity. Newtonian mechanics is used in this project.
## Directory structure
There are two main directories:
- [Computations](/Computations) contain all the code which performs all the computations and save data in database.
- [Visualizer](/Visualizer) Use the data stored in database and visualize it.
## Formulae used:
- Newton gravitation law $G\frac{m_1m_2}{r}$
- Newton second law of motion $F=ma$
- Elastic collusion 
  - $v_1=\frac{m_1-m_2}{m_2+m_1}u_1+\frac{2m_2}{m_2+m_1}u_2$
  - $v_2=\frac{2m_2}{m_2+m_1}u_1+\frac{m_2-m_1}{m_2+m_1}u_2$
- Combined velocity after collusion $v_f=\frac{m_1u_1+m_2u_2}{u_1+u_2}$
## Technologies
[Julia](https://julialang.org/) is chose due to its high speed and very ease to use. And [MongoDB](https://www.mongodb.com/) is used for database.
