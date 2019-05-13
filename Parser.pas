program Parser;
var
    masukan:String;
     f : text;
     cekToken, cekKate : String;
     i,k,j    : Integer;
     hasilKategori : array[0..100] of String;
     hasilToken    : array[0..100] of String;
     akhir, terima     : boolean;

procedure cekKat(kategori:String);
begin
  
end;

procedure label_();
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

procedure unsigned_number();
begin
  
end;

procedure constant_identifier();
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
  while (hasilToken[j] = ',') and (terima = true)  do
    begin
      identifier;
    end;
  cek(':');
  type_;
end;

procedure variable_declaration_part();
begin
  if (cekToken <> '') then
    begin
      cek('var');
      variable_declaration();
      while (hasilToken[j] = ';') and  (terima = true) do
        begin
          variable_declaration();
        end;
      cek(';');  
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
  if hasilToken[k] = 'var' then
    begin
      cek('var');
      parameter_group();
    end else 
    if hasilToken[k] = 'function' then
      begin
        cek('function');
        parameter_group();
      end else
        if(hasilToken[j]='procedure') then
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

  if hasilToken[j] = '('  then
    begin
      cek('(');
      formal_parameter_section();
      while (hasilToken[j]=';') and (terima = true) do
        begin
          cek(';');
          formal_parameter_section();     
        end;
          cek(')');
          cek(':');
          result_type();
          cek(';');
        
    end else if(hasilToken[j] = ':') then
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
  if hasilToken[j] = ';' then
    cek(';')
  else if (hasilToken[j] = '(') then
  begin
    cek('(');
    formal_parameter_section();
    while cekToken=';' do
    begin
      cek(';');
      formal_parameter_section();
    end;
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

procedure variable();
begin
  
end;

procedure unsigned_constant();
var i:Integer;
begin
  for i:= 0 to 3 do
    begin
      case i of
        0: unsigned_number;
        1: cek('string');
        2: begin
          constant_identifier;
          cek('nil');
        end;
        3: cek('salah');
        end;
    end;
end;

procedure actual_parameter();
begin
  
end;

procedure function_identifier();forward;
procedure function_designator();
var i:Integer;
begin
  function_identifier();
  if hasilToken[j]='(' then
    begin
      cek('(');
      actual_parameter();
      while hasilToken[j] = ',' do
        begin
          cek(',');
          actual_parameter;
        end;
      cek(')');  
    end;
end;

procedure element_list();
begin
end;

procedure set_();
begin
  cek('[');
  element_list();
  cek(']');
end;

procedure expression();forward;
procedure factor();
var i: Integer;
begin
  for i:=0 to 5 do
    begin
     case i of
      0: variable;
      1: unsigned_constant;
      2: begin
        cek('(');
        expression();
        cek(')');
         end;
      3: function_designator;
      4: set_();
      5: begin 
          cek('not');
          end;
     end;  
    end;
end;

procedure multiplying_operator();
begin
  case cekToken of 
    '*': cek('*');
    '/': cek('/');
    'div': cek('div');
    'mod': cek('mod');
    'and': cek('and');
    else 
      cek('salah');
  end;
end;

procedure term();
var i:Integer;
begin
  for i:=0 to 2 do
    begin
      case i of
        0: factor;
        1: begin
          term;
          multiplying_operator();
          factor();
        end;
        2: cek('salah');
      end;  
    end;
end;

procedure sign();
begin
  
end;

procedure sign_term();
begin
  
end;

procedure adding_operator();
begin
  case cekToken of
    '+': cek('+');
    '-': cek('-');
    'or': cek('or');
    else
      cek('salah');
  end;
end;

procedure simple_expression();
var i: Integer;
begin
  for i:=0 to 3 do
    begin
      case i of 
        0: term;
        1: begin
          sign_term;
          term;
        end;  
        2: begin 
          simple_expression;
          adding_operator;
          term;
        end;
        3: cek('salah');
      end;
    end;
end;

procedure relational_operator();
begin
  case cekToken of
    '=': cek('=');
    '<>': cek('<>');
    '<': cek('<');
    '<=': cek('<=');
    '>=': cek('>=');
    '>': cek('>');
    'in': cek('in');
    else
      cek('salah');
  end;
end;

procedure expression();
var i:Integer;
begin
  simple_expression();
  relational_operator();
  if (terima = true) then
    simple_expression();

end;

procedure function_identifier();
begin
  identifier;
end;

procedure assignment_statement();
var i:Integer;
begin
  for i:=0 to 2 do
    begin
      case i of
        0: begin
            variable;
            cek(':=');
            expression();             
           end;
        1: begin
            function_identifier();
            cek(':=');
            expression();
          end;
        2: cek('salah');
      end;
    end;
end;

procedure procedure_statement();
begin
  
end;

procedure go_to_statement();
begin
  
end;

procedure empty_statement();
begin
  
end;

procedure simple_statement();
var i:Integer;
begin
  for i:=0 to 4 do
    begin
    case i of
        0: assignment_statement();
        1: procedure_statement();
        2: go_to_statement();
        3: empty_statement();
        4: cek('salah');
      end;
    end;
end;

procedure structured_statement();
begin
  
end;

procedure unlabelled_statement();
var i:Integer;
begin
  for i:=0 to 2 do
    begin
      case i of
        0: simple_statement();
        1: structured_statement();
        2: cek('salah');
      end;
    end;
end;

procedure statement();
var i:Integer;
begin
  for i:=0 to 4 do
    begin
      case i of
        0: unlabelled_statement();
        1: begin
          label_();
          cek(':');
          unlabelled_statement();
        end;
      end;
    end;
end;

procedure compound_statement();
begin
  cek('begin');
  statement();
  while (hasilToken[j] = ';') and (terima = true) do
    begin
      cek(';');
      statement();
    end;
  cek('end');
  cek(';');
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