minMatrix = min(A(:))
[row, col] = find(A==minMatrix)

longitudeOfMin = lon(row)
latitudeOfMin = lat(col)

smalls = mean(A(A < -6000))

hold on
s = surf(lat, lon, A)
s.EdgeColor = 'none'
xlabel("Latitude ({\circ}north)")
ylabel("Longitude ({\circ}east)")
zlabel("Depth below sea level (m)")
colorbar