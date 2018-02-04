function Offsprings = crossover(popsize,Crowdness,parents,crossover_rate,Population,crossover_fraction)
k=1;
for i=1:(popsize/2)
    a=randi(Crowdness);
    crossover_fraction=((Crowdness-a)/Crowdness);  % fraction is randomed here
    x=rand;
    couple=[parents(2*i-1) parents(2*i)];
    if x<crossover_rate
        parent1=Population(((couple(1)-1)*Crowdness+1):(couple(1)*Crowdness));
        parent2=Population(((couple(2)-1)*Crowdness+1):(couple(2)*Crowdness));
        offspring1=[parent1(1:(crossover_fraction*Crowdness)) parent2((Crowdness*crossover_fraction+1):Crowdness)];
        offspring2=[parent2(1:(crossover_fraction*Crowdness)) parent1((Crowdness*crossover_fraction+1):Crowdness)];
        Offsprings((2*Crowdness*(k-1)+1):((2*k-1)*Crowdness))=offspring1;
        Offsprings((((2*k-1)*Crowdness)+1):(2*k*Crowdness))=offspring2;
        k=k+1;
    end
  
end
end
