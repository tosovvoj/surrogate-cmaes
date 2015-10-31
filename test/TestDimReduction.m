% baze se zapisuje do sloupecku
%body se 
bd=[1 1; 1 -1]';
pointInStandardB=[0 1];
expected=[0.5 -0.5];
pointInBd = reduceDimensionality(bd,(1:2),pointInStandardB);
result=isequal(expected,pointInBd);
assert(result,'ChangeBaseDoesNotWork');
disp('test one poitn 2d OK');

bd=[2 0 0; 3 2 0; 1 5 4]';
pointInStandardB=[12 41 28];
expected=[-2 3 7];
pointInBd = reduceDimensionality(bd,(1:3),pointInStandardB);
result=isequal(expected,pointInBd);
assert(result,'ChangeBaseDoesNotWork');
disp('test one poitn 3d OK');

bd=[2 0 0; 3 2 0; 1 5 4]';
pointInStandardB=[6 7 4];
expected=[1 1 1 ];
pointInBd = reduceDimensionality(bd,(1:3),pointInStandardB);
result=isequal(expected,pointInBd);
assert(result,'ChangeBaseDoesNotWork');
disp('test another one poitn 3d OK');


bd=[2 0 0; 3 2 0; 1 5 4]';
pointInStandardB=[6 7 4];
pointInStandardB2=[12 41 28];
expected=[1 1 1 ];
expected2=[-2 3 7];
points=[pointInStandardB;pointInStandardB2];
exp=[expected;expected2];
pointInBd = reduceDimensionality(bd,(1:3),points);
result=isequal(exp,pointInBd);
assert(result,'ChangeBaseDoesNotWork');
disp('test two point in 3d OK');



bd=[2 0 0; 3 2 0; 1 5 4]';
pointInStandardB=[6 7 4];
pointInStandardB2=[12 41 28];
expected=[1 1 ];
expected2=[ 3 7];
points=[pointInStandardB;pointInStandardB2];
exp=[expected;expected2];
pointInBd = reduceDimensionality(bd,(2:3),points);
result=isequal(exp,pointInBd);
assert(result,'ChangeBaseDoesNotWork');
disp('test two point in 3d and reduction 1 OK');

