%% DECISION VARIABLES
syms Corn ...
     Cotton ...
     Apples ...
     Oranges ...
     Melons ...
     Almonds ...
     Pecans ...
     Hazelnuts ...
     Pistachios ...
     Rice ...
     Soybeans ...
     Flax ...
     Sugarcane ...
     Beans ...
     Peas ...
     % Variables represent acres of crop to plant
%% Equations

totalAreaAvailable = 10000; % total area in hectares
budget = 1000000; % budget in USD of farmer
maxManDays = 250 * 15 * 50; % amount of labor available to farmer


vars = [Corn, Cotton, Apples, Oranges, Melons, Almonds, Pecans, Hazelnuts,...
        Pistachios, Rice, Soybeans, Flax, Sugarcane, Beans, Peas];

    
clear eqns
eqns = [sum(vars) == totalAreaAvailable]; % total area available

for i = 1:size(vars,2)
    eqns(end+1) = (-vars(i) == 0); %nonnegativity restraint
end

manDayArray = [10;20;15;15;20;5;7;8;8;15;15;12;20;14;15]; % this holds man-days/hectare needed for each
costArray = [300; 340; 280; 270; 200; 125; 130; 130; 120; 359; 370; 280; 400; 340; 350]; % price / hectare

eqns(end+1) = (vars * manDayArray == maxManDays);
eqns(end+1) = (vars * costArray == budget);

for i = 1:size(vars,2)
    eqns(end+1) = (vars(i) == 800);
end

[A, b] = equationsToMatrix(eqns, vars);


profitArray = [500 580 320 310 400 130 140 180 100 430 400 290 600 350 300];
             %[300 340 280 270 200 125 130 130 120 359 370 280 400 340 350]

[x, fval, exitflag, output] = linprog(-profitArray, double(A), double(b))