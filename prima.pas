program prima;
Var S : String;
    C : Char;
    F : File of char;
  
begin
  Assign (F,'prima.pas');
  Reset (F);
  C:='A';
  Writeln ('its the first character: ');
  While not Eof(f) do
    Begin
    Read(F,C);
    Write (C);
    end;
 Writeln;
 Close (F);
 Writeln ('Type some words. An empty line ends.');
 repeat
   Readln (S);
 until S='';
end.