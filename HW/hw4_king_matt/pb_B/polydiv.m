P = [1, -3, 5, -3, 0, 5]
D = [1 -3 3]
[Q,R] = deconv(P,D)

assert(all(all(conv(D,Q) + R == P)))
degreeD = length(D)

for i = degreeD+1 : -1 : 1
    if(R(i) ~= 0)
        assert(false)
    end
end

disp("If you see this, the deconvolution was verified")