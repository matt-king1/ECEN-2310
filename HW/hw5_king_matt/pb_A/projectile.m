function landing = projectile(phi, v0)
  %PROJECTILE Compute and display trajectory of projectile
  % PROJECTILE(phi, v0)
  %   phi: angle of departure (rad)
  %   v0:  magnitude of initial velocity (m/s)
  % Constant gravity and no air drag are assumed.
  % The angle should be between 0 (excluded) and pi/2 (included)
  % Demonstrates use of events

  % Set default values for missing inputs.
  if nargin < 2
    v0 = 10;
    if nargin < 1
      phi = pi/4;
    end
  end
  
  if phi <= 0 || phi > pi/2
    error('angle should be between 0 (excluded) and pi/2 (included) rad')
  end
  
  if v0 <= 0
    error('initial velocity should be positive')
  end
  
  g = 9.81; % m/s^2
  
  % Assemble initial conditions.
  x0 = [0; 0; v0*cos(phi); v0*sin(phi)];
  tstart = 0;
  tfinal = 100;
  
  % Set options for ODE solver.
  options = odeset('MaxStep', 0.01, 'Events', @events);
  
  % Solve ODEs.
  sol = ode45(@(t,x) f(t, x, g), [tstart tfinal], x0, options);
  fvals = deval(sol,sol.x(end));
  landing = fvals(1);
  
  % Widen the figure window.
  figpos = get(gcf,'Position');
  figpos(3) = 1000;
  set(gcf, 'Position', figpos)
  % Use figure window for two plots.
  subplot(1,2,1)
  % Plot vertical position vs. horizontal position.
  plot(sol.y(1,:),sol.y(2,:))
  axis equal
  xlabel('x (m)')
  ylabel('y (m)')
  title('Projectile Trajectory')
  msg = strcat('landing at x = ', num2str(landing));
  text(landing/2, 0, msg, 'HorizontalAlignment', 'center')
  % Plot state vector's components vs. time
  subplot(1,2,2)
  plot(sol.x,sol.y)
  xlabel('time (s)')
  title('State Variables')
  legend('horizontal position', 'vertical position',...
    'horizontal velocity', 'vertical velocity',...
    'Location','southwest')
end

function xdot = f(~, x, g)
  %F ODE for projectile
  %  x(1): horizontal position
  %  x(2): vertical position
  %  x(3): horizontal velocity
  %  x(4): vertical velocity
  xdot = [x(3); x(4); 0; -g];
end

function [value, isterminal, direction] = events(~, x)
  %EVENTS Locate the time when the height becomes negative
  %  x(2): vertical position
  value = x(2);   % check height
  isterminal = 1; % stop integration when it changes ...
  direction = -1; % from positive to zero
end
