
function Rxyz = RotationMatrix(axis,angle)
    
   % Rx = [1 0 0; 0 cos(angle) -sin(angle); 0 sin(angle) cos(angle)]
   % Ry = [cos(angle) 0 sin(angle); 0 1 0; -sin(angle) 0 cos(angle)]
   % Rz = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0; 0 0 1]
    
   % Rxyz = Rx*Ry*Rz

  %rodriguez formula
M = [axis(1)^2+(1-axis(1)^2)*cos(angle)                axis(1)*axis(2)*(1-cos(angle))-axis(3)*sin(angle)    axis(1)*axis(3)*(1-cos(angle))+axis(2)*sin(angle);
     axis(1)*axis(2)*(1-cos(angle))+axis(3)*sin(angle) axis(2)^2+(1-axis(2)^2)*cos(angle)                   axis(2)*axis(3)*(1-cos(angle))-axis(1)*sin(angle);
     axis(1)*axis(3)*(1-cos(angle))-axis(2)*sin(angle) axis(2)*axis(3)*(1-cos(angle))+axis(1)*sin(angle)    axis(3)^2+(1-axis(3)^2)*cos(angle)];
    Rxyz = M
    %if the determinant is different from one
    % we know it is not a rotation matrix
    det(Rxyz) 
    if(det(Rxyz) ~= 1)
        return;
    end
    %calculate the inverse
    Y = inv(Rxyz)
    
    % Y*Rxyz should return the identity matrix
    ans = Y*Rxyz

    %this is a identity matrix to compare with
    I = eye(3)

    if(ans ~= I )
       return;
    end
    %if we are here is because the matrix is a rottation matrix
    Rxyz;
end