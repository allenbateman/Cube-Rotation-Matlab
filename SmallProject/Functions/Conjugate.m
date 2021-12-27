    
function qc = Conjugate(q)
    qc(1) = q(1)
    qc(2) = q(2)*-1
    qc(3) = q(3)*-1
    qc(4) = q(4)*-1
    qc;
end