%Using Matrices for a Random Walk
%ECEN 2310
%Spring Term 2020
%Matt Bossart
%% Part 2
tic
fprintf('Part 2\n');
n = 6;                %number of intersections
position = 2;         %starting position

%generate a transition matrix for a weekday and a weekend
P_weekday = generateP(n,2/3,1/3);
P_weekend = generateP(n,1/3,2/3);

%Define a single matrix that encompasses a week of transitions.
%Note that Pweek1 is not equivalent to Pweek2. 
%Pweek1 represents a week of transitions starting on Monday
%Pweek2 represents a week of transitions starting on Saturady
Pweek1 = P_weekend^(2*24) * P_weekday^(5*24);
Pweek2 = P_weekday^(5*24) * P_weekend^(2*24);

%set initial position 
X = zeros(1,n)';
X(position) = 1;        

Xend =  Pweek1 * X;
p_school = Xend(n);
p_home = Xend(1);
fprintf('Week starting Monday:\n');
fprintf('Probability at school:%d\n',p_school);
fprintf('Probability at home:%d\n',p_home);

Xend = Pweek2 * X;
p_school = Xend(n);
p_home = Xend(1);
fprintf('Week starting Saturday:\n');
fprintf('Probability at school:%d\n',p_school);
fprintf('Probability at home:%d\n',p_home);

%% Part 3 
%It is possible to solve this problem by defining a 3000x3000 probability
%transition matrix, however, with only 24 time steps, the max distance from 
%the starting location will be 24. A smaller matrix can be used in step, 
%which results in more efficient code. 

fprintf('Part 3\n');
n = 50;     
position = 25;  %Let position 25 of 50x50 matrix be position 500 from problem statement

P_weekday = generateP(n,2/3,1/3);
P_weekend = generateP(n,1/3,2/3);

X = zeros(1,n)';
X(position) = 1;

Xendweekday =  P_weekday^(24)*X;
Xendweekend =  P_weekend^(24)*X;

fprintf('Probability after a single weekday: %d\n', Xendweekday(position+2));
fprintf('Probability after a single weekend day: %d\n', Xendweekend(position+2));
toc







