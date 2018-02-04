function y = siyar(x)
p=zeros(20,4);
for i=1:20
p(i,x(i))=1;
end
preferenceMatrix = evalin('base','preferenceMatrix');
cost=0;
allidx=1:4;
for i=1:20
    a=allidx(p(i,:)~=0);
    b=preferenceMatrix(i,:)==a;
    c=allidx(b~=0);
    cost= cost + c -1;
end
