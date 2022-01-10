function [axis,angle] = GetAxisAngleFromQuaternion(quaternion)
   %if w|1 acos and sqrt can produce erros, this cant happend if the
   %quaternion is normalised
   %components of the quaternion array
   % quaternion 1->w , 2 -> x, 3-> y, 4->z
    
   if(quaternion(1) > 1 ) norm(quaternion);end

    angle = 2 * acosd(quaternion(1));
    
    % assuming quaternion normalized then w is less than 1, so term always positive
    s = sqrt(1-quaternion(1) * quaternion(1));
    

    % test to avoid divide by zero, s is always positive due to sqrt
    if(s < 0.001)
       axis(1) = quaternion(2);
       axis(2) = quaternion(3);
       axis(3) = quaternion(4);
    else
       axis(1) = quaternion(2) / s;
       axis(2) = quaternion(3) / s;
       axis(3) = quaternion(4) / s;
    end
    
end

