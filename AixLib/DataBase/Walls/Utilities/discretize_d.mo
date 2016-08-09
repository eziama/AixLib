within AixLib.DataBase.Walls.Utilities;
function discretize_d
  "discretizes the structural-physical layers of the wall (only for layer thickness)"
    input Integer n1;
  input Real d1[n1];
  input Integer nL[n1];
//  input Boolean bo;
 parameter Boolean bo=true;
  output Real d[sum(nL)];
protected
 Real t[:];
 // Real u[:];
  Integer c;
  Integer c0;
algorithm
// d==true --> thickness of wall layers is divided by the number of discretisation layers -->

  t:=zeros(sum(nL));
 if bo then
if nL[1]> 1 then
  t[1:nL[1]]:=d1[1]/nL[1]*ones(nL[1]);
else
  t[1]:=d1[1];
end if;
// -----------------------------------
if n1>1 then
  for i in 2:(n1) loop
  c0:=sum(nL[1:(i-1)]);
  c:=sum(nL[1:i]);
  t[c0+1:c]:=d1[i]/nL[i]*ones(nL[i]);
  end for;
end if;

 else
  t:=zeros(sum(nL));
if nL[1]> 1 then
  t[1:nL[1]]:=d1[1]*ones(nL[1]);
else
  t[1]:=d1[1];
end if;
// -----------------------------------
if n1>1 then
  for i in 2:(n1) loop
  c0:=sum(nL[1:(i-1)]);
  c:=sum(nL[1:i]);
  t[c0+1:c]:=d1[i]*ones(nL[i]);
  end for;
end if;
 end if;
 d:=t;

end discretize_d;
