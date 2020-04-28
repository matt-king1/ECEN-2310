clc
clear

v=zeros(1440,50);
A = importdata('mariana_depth.csv');
u=zeros(1440,50);
u(:,1) = 0;
u(:,2) = 1;
us=zeros(1440,50);
jv=zeros(1440,50);
for i = 1:50
    n = 2;
    while (norm(u(:,n)) - norm(u(:,(n-1))) > .001)
        n = n + 1;
        ust=us';
        us(:,n) = A'*A*u(:,n-1);
        for j = 0:(i-1)
            jv(:,n) = (ust(n,:)*v(:,j+1))*v(:,j+1);
        end
        u(:,n) = us(:,n)-jv(:,n);
        u(:,n) = u(:,n) / norm(u(:,n));
    end
    v(:,i) = u(:,n);
end