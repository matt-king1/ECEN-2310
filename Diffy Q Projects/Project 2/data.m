%% 2.1
clear
clc

%plot of trench
A = importdata('mariana_depth.csv');
lon = importdata('mariana_longitude.csv');
lat = importdata('mariana_latitude.csv');
s = surf(lat,lon,A);
s.EdgeColor = "none";
c = colorbar;
c.Label.String = "Depth";
view(3);
title("3D Model of Mariana Trench","FontSize",36);
xlabel("Latitude (degrees North)","FontSize",36);ylabel("Longitude (degrees East)","FontSize",36);
ax = gca;
ax.FontSize = 24;
%tracking depth

minMatrix = min(A(:))
[row, col] = find(A==minMatrix)

longitudeOfMin = lon(row)
latitudeOfMin = lat(col)

smalls = mean(A(A < -6000))

%% 2.2
%computing the first eigenvector
ui1=1+zeros(1440,1);
ui2=(A'*A*ui1)/norm(A'*A*ui1);
ui3=(A'*A*ui2)/norm(A'*A*ui2);
ui4=(A'*A*ui3)/norm(A'*A*ui3);
ui5=(A'*A*ui4)/norm(A'*A*ui4);
ui6=(A'*A*ui5)/norm(A'*A*ui5);
ui7=(A'*A*ui6)/norm(A'*A*ui6);
ui8=(A'*A*ui7)/norm(A'*A*ui7);
ui9=(A'*A*ui8)/norm(A'*A*ui8);
ui10=(A'*A*ui9)/norm(A'*A*ui9);

plot([1:1:1440],ui10,"LineWidth",3)
title("Visual of First Eigenvector of A' * A","FontSize",36);
xlabel("Element of Eigenvector (N)","FontSize",36);ylabel("Magnitude of Element","FontSize",36);
axis([0 1440 .02 .04]);
ax = gca;
ax.FontSize = 24;

%% 2.2
%computing the first 50 eigenvectors
clear
clc
v=zeros(1440,50);
A = importdata('mariana_depth.csv');
for i = 1:50
    u=ones(1440,1);
    uold=zeros(1440,1);
    status = 1;
    while norm(status) > 0.001
        uold = u;
        u = A' * A * u;
        jv=zeros(1440,1);
        for j = 1:(i-1)
            jv = jv + ((transpose(u) * v(:,j)) * v(:,j));
        end
        u = u - jv;
        u = u / norm(u);
        status = u - uold;
    end
    v(:,i) = u;
end

%computing the corresponding eigenvalues
ev = zeros(1,50);
ev1 = zeros(1440,50);
for i = 1:50
ev1(:,i) = A' * A * v(:,i) ./ v(1,i);
ev(1,i) = ev1(1,i);
end
evr = ev .^ 0.5;

% plot of eigenvalues
semilogy([1:1:50],ev,"LineWidth",3)
ax = gca;
ax.FontSize = 24;
title("Visual of Largest 50 Eigenvalues of A' * A","FontSize",36);
xlabel("Eigenvalue Designation (n)","FontSize",36);ylabel("Magnitude of Eigenvalue","FontSize",36);

%% 2.3
%clc
%clear i u jv uold j 

lon = importdata('mariana_longitude.csv');
lat = importdata('mariana_latitude.csv');

[Uo,So,Vo] = svd(A);

subplot(2,2,1)
s = surf(lat, lon, getIncompleteSVD(A, So, Vo, 1000))
title("n=1000")
view(2)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
ylim([140 150])
xlim([10 20])

subplot(2,2,2)
s = surf(lat, lon, getIncompleteSVD(A, So, Vo, 500))
title("n=500")
view(2)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
ylim([140 150])
xlim([10 20])

subplot(2,2,3)
s = surf(lat, lon, getIncompleteSVD(A, evr, v, 50))
title("n=50")
view(2)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
ylim([140 150])
xlim([10 20])

subplot(2,2,4)
s = surf(lat, lon, getIncompleteSVD(A, evr, v, 5))
title("n=5")
view(2)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
ylim([140 150])
xlim([10 20])

sgtitle("Visualiations of Approximations of A using n Columns")