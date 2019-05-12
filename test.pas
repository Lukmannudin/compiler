program test;
var
    masukan:String;
     f : text;
     i,n : Integer;
 
 procedure cek(terminal:String);
 begin
   if (terminal = masukan) then
    //  read(masukan,f)
   else 
     writeln('Tidak Diterima');
 end;

procedure empty();
begin
  
end;

procedure constant_identifier();
begin
  
end;

procedure _const();
begin
  
end;

procedure sign();
begin
  case masukan of 
    '+':cek('+');
    '-':cek('-');
  end;  
end;


procedure letter_digit();
begin
  case masukan of 
    'letter' : cek('letter');
    'digit'  : cek('digit');   
  end;  
end;

procedure identifier();
 begin
   letter_digit();
 end;


procedure unsigned_real();
begin
  
end;

procedure unsigned_integer();
begin
  
end;

procedure unsigned_number();
begin
  
end;

procedure statement_part();
begin
  
end;

procedure constant();
var
    i,n:Integer;
begin
i:=0;
n:=4; // Jumlah OR
  while i<>n do
    begin
        case i of
          0: begin
            unsigned_number();
          end;
          1: begin
            sign();
            unsigned_number();
          end;
          2: begin
            constant_identifier();
          end;
          3: begin
            sign();
            constant_identifier();
          end;
          4: begin
            // _string();
          end;
        end;
        i:=i+1;  
    end;
end;

procedure constant_definition();
begin
  identifier();
  cek('=');
  constant();
end;

procedure constant_definition_part();
begin
  if (masukan = '') then
    empty()
  else
    begin
        cek('const');
        constant_definition();
    end;
    
end;


procedure procedure_and_function_declaration_part();
begin
  
end;

procedure variable_declaration_part();
begin
  
end;

procedure type_definition_part();
begin
  
end;



procedure _label();
begin
  unsigned_integer();
end;

procedure label_declaration_part();
begin
  if masukan = '' then
   begin
    empty()
   end 
  else 
   begin
    cek('label');
    _label();
   end; 
end;

procedure block();
begin
   label_declaration_part();
   constant_definition_part();
   type_definition_part();
   variable_declaration_part();
   procedure_and_function_declaration_part();
   statement_part();
end;

 procedure parser();
 begin
    cek('program');
    identifier();
    cek(';');
    block();
    cek('.');
 end;
 
begin

  readln();
end.