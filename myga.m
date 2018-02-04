tic
Crowdness=30;                                                               % Crowdedness*
crossover_rate=1;
crossover_fraction=(22/Crowdness); % Choose where to crossover genes. numerator should be integer and less than crowdness.
mutation_rate=1;
tmsize = 5;
popsize = 150;  
maxgen = 200;
%preferenceMatrix = simulator(Crowdness,Popularity) % preference matrix can be generated according to any given 1x4 popularity matrix
bestfitness=zeros(1,maxgen);                  
bestfitnessaverage=zeros(1,maxgen);            % initializations of best fitness matrix for the plots                 
load('preferenceMatrices.mat');
for k=1:10
preferenceMatrix=preferenceMatrices(((k-1)*Crowdness+1):(k*Crowdness),:);
Population = god(preferenceMatrix,Crowdness,popsize); % creation of initial population
FitnessMatrix = siyar(Crowdness,preferenceMatrix,Population); %To observe fitnesses of individual population
for j=1:maxgen
parents = tournamentselection(Population,tmsize,popsize,FitnessMatrix);
Offsprings=crossover(popsize,Crowdness,parents,crossover_rate,Population,crossover_fraction);
Offsprings=mutation(Crowdness,mutation_rate,Offsprings);
Population =[Population Offsprings];
[FitnessMatrix, popsizenow] = siyar(Crowdness,preferenceMatrix,Population);  %popsizenow can be used to observe how population is changing. When c_rate=1, popsizenow=2*popsize
%popsizenow
Population=roulettewheel(Population,FitnessMatrix,Crowdness,popsize);
FitnessMatrix = siyar(Crowdness,preferenceMatrix,Population);
% Info of the generation ; %
%disp('generation number, max fitness, cost');
j;
bestfitness(j)=max(FitnessMatrix);
bestcost=60-max(FitnessMatrix);
%------------------------%
end
% Info of the best solution for each preference matrix %
indexbest=find(FitnessMatrix==max(FitnessMatrix));
bestIndividual= Population(((indexbest(1)-1)*Crowdness+1):Crowdness*indexbest(1));
bestIndividualfenotip=zeros(Crowdness,4);
for i=1:Crowdness
    bestIndividualfenotip(i,bestIndividual(i))=1;
end
sprintf('Results for preference matrix %d',k)
FitnessMatrix= siyar(Crowdness,preferenceMatrix,Population);
preferenceMatrix
bestIndividualfenotip
courseregistered =[sum(bestIndividual==1) sum(bestIndividual==2) sum(bestIndividual==3) sum(bestIndividual==4)]
disp('fitness and cost:')
[bestfitness(j), 60-bestfitness(j)]
%-----------------------------------------------%
solutionfitnesses(k)=bestfitness(j);   
bestfitnessaverage=bestfitnessaverage+bestfitness;
end
bestfitnessaverage=bestfitnessaverage/10;
stem(1:maxgen,bestfitnessaverage)
xlabel('# Generation');
ylabel('Average Fitness of the best individual for 10 preference matrix');
title('Fitness versus Generation');
axis([0 maxgen 0 60]);

load handel % alarm
sound(y,Fs)
toc


