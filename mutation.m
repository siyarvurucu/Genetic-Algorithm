function Offsprings = mutation(Crowdness,mutation_rate,Offsprings)
a=length(Offsprings)/Crowdness;
for i=1:a
    x=rand;
    if x<mutation_rate
        b=randi(Crowdness);
        Offsprings(Crowdness*(i-1)+b)=randi(4);
    end
end


