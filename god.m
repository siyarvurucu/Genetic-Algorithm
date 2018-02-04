function Population = god(preferenceMatrix,Crowdness,popsize)
b=zeros(1,Crowdness*popsize);

for j=1:popsize
     courseCapacity=[8 8 8 8];
for i=1:Crowdness
   
    X = randi(4);
    selectedCourse = preferenceMatrix(i,X);

    while courseCapacity(selectedCourse) == 0
        X = randi(4);
        selectedCourse = preferenceMatrix(i,X);
    end
        individual(i)= selectedCourse;
        resultMatrix(i,selectedCourse) = 1;
        courseCapacity(selectedCourse) = courseCapacity(selectedCourse) - 1;
    
end
%resultMatrix=resultMatrix'
b(((j-1)*Crowdness+1):(j*Crowdness))= individual;
end
Population = b;
end