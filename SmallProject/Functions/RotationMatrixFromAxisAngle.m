function rm = RotationMatrixFromAxisAngle(axis, angle)
    %rodriguez formula
    M = [axis(1)^2+(1-axis(1)^2)*cosd(angle)                  axis(1)*axis(2)*(1-cosd(angle))-axis(3)*sind(angle)    axis(1)*axis(3)*(1-cosd(angle))+axis(2)*sind(angle);
         axis(1)*axis(2)*(1-cosd(angle))+axis(3)*sind(angle)  axis(2)^2+(1-axis(2)^2)*cosd(angle)                    axis(2)*axis(3)*(1-cosd(angle))-axis(1)*sind(angle);
         axis(1)*axis(3)*(1-cosd(angle))-axis(2)*sind(angle)  axis(2)*axis(3)*(1-cosd(angle))+axis(1)*sind(angle)    axis(3)^2+(1-axis(3)^2)*cosd(angle)];
         
    rm = M;

    %if the determinant is different from one
    % we know it is not a rotation matrix
    det(rm) 
    if(det(rm) ~= 1)
        return;
    end
    %calculate the inverse
    Y = inv(rm);
    
    % Y*Rxyz should return the identity matrix
    ans = Y*rm;

    %this is a identity matrix to compare with
    I = eye(3);

    if(ans ~= I )
       return;
    end
    %if we are here is because the matrix is a rottation matrix
end

