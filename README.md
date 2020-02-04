# NSGA2_MATLAB
 NSGA2 MATLAB Code for https://www.omegaxyz.com/2018/01/22/new_nsga2/
 
# parameter

![](https://gitee.com/omegaxyz/img/raw/master/upload/NSGA2NEW202002041806.jpg)

The process of NSGA2 is as follows:

1. Randomly generate an initial parent Po, and on this basis, use binary championship selection, crossover and mutation to generate the offspring Qo, and the Po and Qo population size are both N

2. Integrate Pt and Qt into Rt (t=0 at the initial stage), sort Rt by fast non-dominated solutions, and construct all the non-dominated solution sets F1, F2... .

3. Calculate the crowding distance of all individuals in Fi as required, and construct Pt+1 according to the crowding comparison operator until the size of Pt+1 is N, and Fi in the figure is F3

More Details [NSGA2 introduction](https://www.omegaxyz.com/2017/04/14/nsga-iiintro/)
