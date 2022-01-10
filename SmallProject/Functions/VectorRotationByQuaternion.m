    
function vr =  VectorRotationByQuaternion(q,pureQuaternion)
   qc = Conjugate(q)   
   
   v1 = QuaternionMultiplication(q,pureQuaternion);

   vr = QuaternionMultiplication(v1,qc); 
end

