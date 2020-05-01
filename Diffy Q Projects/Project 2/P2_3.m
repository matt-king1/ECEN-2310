A = importdata('mariana_depth.csv')
lon = importdata('mariana_longitude.csv')
lat = importdata('mariana_latitude.csv')

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
s = surf(lat, lon, getIncompleteSVD(A, So, Vo, 50))
title("n=50")
view(2)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
ylim([140 150])
xlim([10 20])

subplot(2,2,4)
s = surf(lat, lon, getIncompleteSVD(A, So, Vo, 5))
title("n=5")
view(2)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
ylim([140 150])
xlim([10 20])

sgtitle("Visualizations of Approximations of A using n Columns during SVD")
