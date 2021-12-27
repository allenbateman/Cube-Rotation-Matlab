    
function vr =  VectorRotationByQuaternion(q,v)
   qc = Conjugate(q)   

   vr(1) = q(2)*v(1)*qc(2)
   vr(2) = q(3)*v(2)*qc(3)
   vr(3) = q(4)*v(3)*qc(4)
end

