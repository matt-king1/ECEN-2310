function xdot = f(~, x, m, g, k)
    % Differential equations of a sphere
    % subject to gravity and air drag
    %   x(1)   :   position
    %   x(2)   :   velocity
    
    % Air drag and gravity
    drag = -k * x(2) * abs(x(2));
    pull = -m * g;
    
    xdot = [
            x(2);
            (drag + pull) / m
           ];
end
