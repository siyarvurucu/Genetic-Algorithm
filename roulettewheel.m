function Population = roulettewheel(Population,FitnessMatrix,Crowdness,popsize)
PopulationNew=zeros(1,popsize*Crowdness);
Choosen=zeros(1,popsize);
k=1;
while k<(popsize+1)
    a=round(sum(FitnessMatrix));
    x=randi(a);
for i=1:(length(FitnessMatrix))
    b=sum(FitnessMatrix(1:i));
    if (x<b)
        FitnessMatrix(i)=0;
        PopulationNew(((k-1)*Crowdness+1):(k*Crowdness))=Population((((i-1)*Crowdness)+1):(i*Crowdness));
        Choosen(k)=i;
        k=k+1;  
    end
end
end
Choosen;
Population=PopulationNew;
end