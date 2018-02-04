function TournamentWinners = tournamentselection(Population,tmsize,popsize,FitnessMatrix)
for i=1:popsize
perm=randperm(popsize);
z=perm(1:tmsize);
[M,I]=max(FitnessMatrix(z));
TournamentWinner(i)=z(I);
end
TournamentWinners=TournamentWinner;
end

