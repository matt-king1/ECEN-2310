function testProjectile
  % TESTPROJECTILE test harness for projectile function
  %
  % Tests that function projectile correctly predicts the
  % landing point for several combinations of angle and
  % initial velocity.
  g = 9.81;
  pause on
  for v0 = 5:5:15
    for phi = [pi/6 pi/4 pi/3 2*pi/5]
      landing = projectile(phi,v0);
      predicted = v0.^2 * sin(2*phi) / g;
      deviation = abs(landing - predicted);
      if deviation > 1e-6
        msg = strcat('result off by ', num2str(deviation));
        disp(msg)
      end
      pause(2)
    end
  end
end
