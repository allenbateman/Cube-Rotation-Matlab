function quaternion = QuaternionFromAngleAndUnitVector(angle,unitVector)
        quaternion(1) = cos(angle/2);
        quaternion(2) = unitVector(1) * sin(angle/2);
        quaternion(3) = unitVector(2) * sin(angle/2);
        quaternion(4) = unitVector(3) * sin(angle/2);
        quaternion;
end

