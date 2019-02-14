tic
Crowdedness=30;                                                               % Crowdedness*
crossover_rate=1;
crossover_fraction=(22/Crowdedness); % Choose where to crossover genes. numerator should be integer and less than crowdedness.
mutation_rate=1;
tmsize = 5;
popsize = 150;  
maxgen = 200;
%preferenceMatrix = simulator(Crowdedness,Popularity) % preference matrix can be generated according to any given 1x4 popularity matrix
bestfitness=zeros(1,maxgen);                  
bestfitnessaverage=zeros(1,maxgen);            % initializations of best fitness matrix for the plots                 
load('preferenceMatrices.mat');
for k=1:10
preferenceMatrix=preferenceMatrices(((k-1)*Crowdedness+1):(k*Crowdedness),:);
Population = god(preferenceMatrix,Crowdedness,popsize); % creation of initial population
FitnessMatrix = fitness(Crowdedness,preferenceMatrix,Population); %To observe fitnesses of individual population
for j=1:maxgen
parents = tournamentselection(Population,tmsize,popsize,FitnessMatrix);
Offsprings=crossover(popsize,Crowdedness,parents,crossover_rate,Population,crossover_fraction);
Offsprings=mutation(Crowdedness,mutation_rate,Offsprings);
Population =[Population Offsprings];
[FitnessMatrix, popsizenow] = fitness(Crowdedness,preferenceMatrix,Population);  %popsizenow can be used to observe how population is changing. When c_rate=1, popsizenow=2*popsize
%popsizenow
Population=roulettewheel(Population,FitnessMatrix,Crowdedness,popsize);
FitnessMatrix = fitness(Crowdedness,preferenceMatrix,Population);
% Info of the generation ; %
%disp('generation number, max fitness, cost');
j;
bestfitness(j)=max(FitnessMatrix);
bestcost=60-max(FitnessMatrix);
%------------------------%
end
% Info of the best solution for each preference matrix %
indexbest=find(FitnessMatrix==max(FitnessMatrix));
bestIndividual= Population(((indexbest(1)-1)*Crowdedness+1):Crowdedness*indexbest(1));
bestIndividualfenotip=zeros(Crowdedness,4);
for i=1:Crowdedness
    bestIndividualfenotip(i,bestIndividual(i))=1;
end
sprintf('Results for preference matrix %d',k)
FitnessMatrix= fitness(Crowdedness,preferenceMatrix,Population);
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


