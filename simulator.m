function preferenceMatrix = simulator(Crowdness,Popularity)
preferenceMatrix = zeros (Crowdness,4);
for i = 1:Crowdness
    allidx=1:4;
    x = rand;
    if x < Popularity(1)/sum(Popularity)
        a=1;
    elseif x < (Popularity(1)+Popularity(2))/sum(Popularity)
        a=2;
    elseif x < (Popularity(1)+Popularity(2)+Popularity(3))/sum(Popularity)
        a=3;
    elseif x < 1
        a=4;
    end
    preferenceMatrix(i,1) = a;
    k = allidx([1 2 3 4]~=a);
    pop2=[Popularity(k(1)) Popularity(k(2)) Popularity(k(3))];
    x=rand;
    if x < pop2(1)/sum(pop2)
        a=k(1);
    elseif x < (pop2(1)+pop2(2))/sum(pop2)
        a=k(2);
    elseif x < 1
        a=k(3);
    end
    preferenceMatrix(i,2)=a;
    allidx=k;
    k=allidx(k~=a);
    pop3=[Popularity(k(1)) Popularity(k(2))];
    x=rand;
    if x < pop3(1)/sum(pop3)
        a=k(1);
        a1=k(2);
    else a=k(2);
        a1=k(1); 
    end
        preferenceMatrix(i,3)=a;
        preferenceMatrix(i,4)=a1;      
end
preferenceMatrix
% initializing Result Matrix
resultMatrix = zeros (Crowdness,4);

% creating Course Capacity Matrix
courseCapacity = [8,8,8,8];

for i=1:Crowdness
    % LABEL selectNewNumber
    
    % generate random number ( choose a course for i'th student
    X = randi(4);
    selectedCourse = preferenceMatrix(i,X);
    
    % if the selected course's capacity is full choose new course
    while courseCapacity(selectedCourse) == 0
        X = randi(4);
        selectedCourse = preferenceMatrix(i,X);
    end
        
    % if the selected course's capacity is not full, assign this student to
    % selected course and the selected course's capacity decremented by one
        resultMatrix(i,selectedCourse) = 1;
        courseCapacity(selectedCourse) = courseCapacity(selectedCourse) - 1;
    
end

disp('PREFERENCE MATRIX');
preferenceMatrix(:,:)
size(preferenceMatrix)

disp('RESULT MATRIX');
size(resultMatrix)
resultMatrix(:,:)
resultMatrix

disp('COURSE CAPACITY');
courseCapacity(:)