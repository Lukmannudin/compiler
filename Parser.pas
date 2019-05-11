program Parser;
var
    masukan:String;
     f : text;
 
 procedure cek(terminal:String);
 begin
   if (terminal = masukan) then
     read(masukan,f)
   else 
     writeln('Tidak Diterima');
 end;

 procedure parser();
 begin
    cek('program');
 end;

begin
    masukan:= 'a';
    cek('a');
    readln;
end.