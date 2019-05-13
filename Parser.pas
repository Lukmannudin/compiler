program Parser;
var
    masukan:String;
     f : text;
     cekToken, cekKate : String;
     i,k,j    : Integer;
     hasilKategori : array[0..100] of String;
     hasilToken    : array[0..100] of String;

procedure cekKat(kategori:String);
begin
  
end;

procedure identifier;
begin
    writeln('identifier');
    cekKat('identifier');
end;

procedure cek(terminal:String);
begin
   if (terminal = masukan) then
    //  read(masukan,f)
   else 
     writeln('Tidak Diterima');
end;
// end 

procedure empty();
begin
     writeln('ok empty');
end;

procedure constant();
begin
  
end;


//delimiter type definition part

procedure subrange_type();
begin
  constant();
  cek('.');
  cek('.');
  constant();
end;

procedure type_identifier();
begin
  identifier();
end;

procedure variant_part();
begin
  WriteLn('variant part');
  cekKat('variant part');
end;

procedure field_identifier();
begin
  identifier();
end;

procedure scalar_type();
begin
  cek('(');
  identifier();
  cek(')');
end;

procedure pointer_type();
var 
  i:Integer;
begin
for i:=0 to 3 do
  begin
    case i of 
      0: scalar_type;
      1: subrange_type;
      2: type_identifier();
      3: cek('salah');
    end;  
  end;
end;

procedure simple_type();
var
i:Integer;
begin
for i:=0 to 3 do
  begin
    case i of 
      0: scalar_type();
      1: subrange_type();
      2: type_identifier();
      3: cek('salah');
    end;  
  end;
end;

procedure index_type();
begin
  simple_type();
end;

procedure component_type();
begin
  // type_();
end;

procedure array_tipe();
begin
  cek('array');
  cek('[');
  index_type();
  cek(']');
  cek('of');
  component_type();
end;

procedure record_type();
begin
  cek('record');
  // field_list(); //notbabi
  cek('end');
end;

procedure base_type();
begin
  simple_type();
end;

procedure set_type();
begin
  cek('set');
  cek('of');
  base_type();
end;

procedure file_type();
begin
  cek('file');
  cek('of');
  // type_();// notbabi
end;

procedure structured_type();
var
  i:Integer;
begin
  for i:=0 to 4 do
    case i of 
      0: array_tipe();
      1: record_type();
      2: set_type();
      3: file_type();
      4: cek('salah');
  end;
end;

procedure type_();
var
  i: Integer;
begin
  for i:=0 to 3 do 
  begin
    case i of 
    0: simple_type();
    1: structured_type();
    2: pointer_type();
    3: cek('salah');
    end;
  end;
end;

procedure record_section();
begin
  if cekToken <> '' then
   begin
    field_identifier();
    cek(':');
    type_();
   end else
   empty();
end;

procedure fixed_part();
begin
  record_section();
end;

procedure fixed_part_();
begin
  if hasilToken[j] = ';' then
    begin
      fixed_part();
      cek(';');
      variant_part();
    end else 
      fixed_part();
end;

procedure field_list();
var i:Integer;
begin
  for i:=0 to 2 do
    begin
      case i of
        0: fixed_part_;
        1: variant_part();
        2: cek('salah');
      end;
    end;
end;

procedure type_definition();
begin
  identifier();
  cek('=');
  type_();
end;

procedure type_definition_part();
begin
    case cekToken of
      'type': begin
          cek('type');
          type_definition();
      end;
    end;
end;

//delimiter variable declaration part
procedure variable_declaration();
begin
  identifier;
  type_;
end;

procedure variable_declaration_part();
begin
  if (cekToken <> '') then
    begin
      cek('var');
      variable_declaration();
    end else 
      empty;
end;

// delimiter procedure and function declaration part
procedure result_type();
begin
  type_identifier();
end;

procedure parameter_group();
begin
  identifier();
  cek(':');
  type_identifier();
end;

procedure formal_parameter_section();
begin
  if cekToken[k] = 'var' then
    begin
      cek('var');
      parameter_group();
    end else 
    if cekToken[k] = 'function' then
      begin
        cek('function');
        parameter_group();
      end else
        if(cekToken[j]='procedure') then
          begin
            cek('procedure');
            identifier;    
          end else 
          parameter_group();
end;

procedure function_heading();
begin
  cek('function');
  identifier;

  if cekToken[j] = '('  then
    begin
      cek('(');
      formal_parameter_section();
      cek(')');
      cek(':');
      result_type();
      cek(';');
    end else if(cekToken[j] = ':') then
      begin
        cek(':');
        result_type();
        cek(';');
      end else
        cek('salah');
end;

procedure procedure_heading();
var i:Integer;
begin
  cek('procedure');
  identifier();
  if cekToken[j] = ';' then
    cek(';')
  else if (cekToken[j] = '(') then
  begin
    cek('(');
    formal_parameter_section();
    cek(')');
  end else
    cek('salah');
end;


procedure function_declaration();
begin
  function_heading();
  // block;//notbabi  
end;

procedure procedure_declaration();
begin
  procedure_heading();
  // block();//not babi
end;

procedure procedure_or_function_declaration();
var i: Integer;
begin
  for i:=0 to 2 do
    begin
      case i of 
        0: procedure_declaration();
        1: function_declaration();
        2: cek('salah');
      end;
    end;
end;

procedure procedure_and_function_declaration_part();
begin
  procedure_or_function_declaration();
end;

// delimiter statement part
procedure compound_statement();
begin
  cek('compound statement');
end;

procedure statement_part();
begin
  compound_statement();
end;

begin
    masukan:= 'a';
    cek('a');
    readln;
end.