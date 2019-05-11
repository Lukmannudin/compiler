program test;
var
    masukan:String;
     f : text;
 
 procedure cek(terminal:String);
 begin
   if (terminal = masukan) then
    //  read(masukan,f)
   else 
     writeln('Tidak Diterima');
 end;

procedure statement_part();
begin
  
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

procedure constant_definition_part();
begin
  
end;

procedure label_declaration_part();
begin
  
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

 procedure parser();
 begin
    cek('program');
    identifier();
    cek(';');
    block();
    cek('.');
 end;
 
begin
  
end.