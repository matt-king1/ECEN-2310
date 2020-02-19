function [P]= generateP(n,p_school, p_home)
% GENERATEP generate an nxn proability transition matrix with transition
% probabilities of p_school and p_home (part 1).
    P = zeros(n); %Preallocating memory for P is imperative when n is large 
    for i = 2:n-1
        P(i-1,i) = p_home;
        P(i+1,i) = p_school;
    end 
    P(1,1) = 1;    %Student stays at home with probability 1 
    P(n,n) = 1;    %Student stays at school with probability 1
end 