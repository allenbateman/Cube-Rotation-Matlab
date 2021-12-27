
matrices = 109;
axis;
angle
stored;

for m = 1:matrices
   
     axis = rand(1,3)


    angle = deg2rad(10 * m)
    if(angle < 0.001 && angle > -0.001)
        angle = 0
    end

    rm = RotaionMatrix(axis,angle)
    trace =  GetTrace(rm)
    stored(m,1) = m
    stored(m,2) = trace
    csvwrite('trace.csv',stored)
end