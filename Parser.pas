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

procedure empty();
begin
     writeln('ok empty');
end;

procedure constant();
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


procedure field_list();
begin
  
end;

procedure record_type();
begin
  cek('record');
  field_list();
  cek('end');
end;



procedure scalar_type();
begin
  cek('(');
  identifier();
  cek(')');
end;

procedure pointer_type();
begin
  case cekToken of 
    'scalar type': scalar_type;
    'subrange_type': subrange_type;
    'type_identifier': type_identifier();
  end;  
end;

procedure simple_type();
var
i:Integer;
begin
for i:=0 to 3 do
  begin
    case cekToken of 
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

procedure structured_type();
begin
  case cekToken of 
    'array_type': array_tipe();
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
  if hasilToken[j+1] = ';' then
    begin
      fixed_part();
      cek(';');
      variant_part();
    end else 
      fixed_part();
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

begin
    masukan:= 'a';
    cek('a');
    readln;
end.