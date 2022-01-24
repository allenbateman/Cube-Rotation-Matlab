function quaternion = QuaternionFromAngleAndUnitVector(angle,axis)
        quaternion(1) = cosd(angle/2);
        quaternion(2) = axis(1)/VectorModule(axis) * sind(angle/2);
        quaternion(3) = axis(2)/VectorModule(axis) * sind(angle/2);
        quaternion(4) = axis(3)/VectorModule(axis) * sind(angle/2);
end

