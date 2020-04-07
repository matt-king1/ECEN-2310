function approx = getIncompleteSVD(A, So, Vo, n)
    % Approximate A using n columns for U * S * V'
    %
    % A     :   Matrix of depth values for each lat and lon pair
    % So    :   Diagonal matrix of eigenvalue square roots in descending
    %           order
    % Vo    :   Matrix of eigenvectors of A' * A

    V = Vo(:,1:n);
    S = So(1:n,1:n);
    U = zeros(1320,n); 

    for i = 1:n
        U(:,i) = (A * V(:,i)) / S(i,i);
    end

    approx = U * S * V';
end
