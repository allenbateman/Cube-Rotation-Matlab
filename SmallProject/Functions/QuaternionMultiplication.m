function mult = QuaternionMultiplication(q,p)
    %Hamilton product
    mult(1) = q(1)*p(1) - q(2)*p(2) - q(3)*p(3) - q(4)*p(4);
    mult(2) = q(1)*p(2) + q(2)*p(1) - q(3)*p(4) + q(4)*p(3);
    mult(3) = q(1)*p(3) + q(2)*p(4) + q(3)*p(1) - q(4)*p(2);
    mult(4) = q(1)*p(4) - q(2)*p(3) + q(3)*p(2) + q(4)*p(1);
end
