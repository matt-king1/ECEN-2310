function xdot = freefall(x, g)
    % Differential equations of free fall.
    %   x(1) : position
    %   x(2) : velocity
    %      g : acceleration of gravity
    xdot = [
            x(2);
            -g
           ];
end
