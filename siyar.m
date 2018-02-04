function [FitnessMatrix,popsizenow] = siyar(Crowdness,preferenceMatrix,Population)
popsizenow=length(Population)/Crowdness;
for j=1:popsizenow
    individual=Population(((j-1)*Crowdness+1):(j*Crowdness));
    p=zeros(Crowdness,4); % p is physical appearance of the individual
    for i=1:Crowdness
        p(i,individual(i))=1;
    end
    cost=0;
    allidx=1:4;
    for i=1:Crowdness
        a=allidx(p(i,:)~=0);
        b=preferenceMatrix(i,:)==a;
        c=allidx(b~=0);
        cost= cost + c -1;
    end
    kost(j)=cost;
    if Crowdness==30
        Fitness(j)= (2/3)*(Crowdness*3)-cost;   %(2/3) term comes when crowdness=30 to fix max fitness to 60 and punish cost more.
    else
        Fitness(j)=(Crowdness*3)-cost;
    end
    if (8<sum(individual==1))||(8<sum(individual==2))||(8<sum(individual==3))||(8<sum(individual==4))
        Fitness(j)=Fitness(j)/5;
    end 
    end
    FitnessMatrix = Fitness;
    CostMatrix=kost;
end
