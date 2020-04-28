function Q2_King()

% inequality matrix for contraints
 A = [-1 0 0;   % x > 2
      0 -1 0;   % y > 2
      0 0 -1;   % z > 2
      1 0 0;   % x < 12
      0 1 0;   % y < 12
      0 0 1;   % z < 12
      1.5 1 0.5 % 1.5x + 1y + 0.5z < 24
     ];
% solution vector of inequality matrix
 b = [-2 -2 -2 12 12 12 24];
 
% negative objective function to minimize
 f = -[5 3 1];
 
 [x, fval, exitflag] = linprog(f,A,b);
 
 if exitflag ~= 1
     fprintf("Error encountered with exitflag %i", exitflag);
 else
     fprintf("Optimal solution with profit of $%3.1f found at x = %3.1f, y = %3.1f, z = %3.1f\n", -fval, x(1), x(2), x(3));
 end

end
