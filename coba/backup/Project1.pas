Program program331;

Uses crt, wincrt;

Var
   f        : text;
   ch       : char;
   token    : String;
   kategori : String;
   i        : Integer;
   kutip    : boolean;

procedure addToken;
begin
    read(f,ch);
    if (ch in[#33..#127]) then
    begin
        token := token + ch;
        kategori := 'identifier';
    end;
end;

procedure scanCode;
begin
    token := '';
    kategori := '';
    Assign(f,'Hallo.txt');
    Reset(f);

    While not eof(f) do
    Begin
        addToken;
        //A
        if ch = 'i' then
        begin
            addToken;
            if ch = 'f' then
            begin
                addToken;
                if not (ch in[#33..#127])  then
                begin
                    // ifsy
                    token := 'if';
                    kategori := 'ifsy';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end;
            if ch = 'n' then
            begin
                addToken;
                if ch = 't' then
                begin
                    addToken;
                    if ch = 'e' then
                    begin
                        addToken;
                        if ch = 'g' then
                        begin
                            addToken;
                            if ch = 'e' then
                            begin
                                addToken;
                                if ch = 'r' then
                                begin
                                    addToken;
                                    if not (ch in[#33..#127]) then
                                    begin
                                        // intcon
                                        token := 'Integer';
                                        kategori := 'intcon';
                                    end
                                    else
                                    begin
                                        while (ch in[#33..#127]) do
                                            addToken;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end

        //B
        else if ch = 'r' then
        begin
            addToken;
            if ch = 'e' then
            begin
                addToken;
                if ch = 'a' then
                begin
                    addToken;
                    if ch = 'l' then
                    begin
                        addToken;
                        if not (ch in[#33..#127]) then
                        begin
                            // realcon
                            token := 'real';
                            kategori := 'realcon';
                        end
                        else
                        begin
                            while (ch in[#33..#127]) do
                            addToken;
                        end;
                    end;
                end;
                if ch = 'c' then
                begin
                    addToken;
                    if ch = 'o' then
                    begin
                        addToken;
                        if ch = 'r' then
                        begin
                            addToken;
                            if ch = 'd' then
                            begin
                                addToken;
                                if not (ch in[#33..#127]) then
                                begin
                                    // recordsy
                                    token := 'record';
                                    kategori := 'recordsy';
                                end
                                else
                                begin
                                    while (ch in[#33..#127]) do
                                    addToken;
                                end;
                            end;
                        end;
                    end;
                end;
                if ch = 'p' then
                begin
                    addToken;
                    if ch = 'e' then
                    begin
                        addToken;
                        if ch = 'a' then
                        begin
                            addToken;
                            if ch = 't' then
                            begin
                                addToken;
                                if not (ch in[#33..#127]) then
                                begin
                                    // repeatsy
                                    token := 'repeat';
                                    kategori := 'repeatsy';
                                end
                                else
                                begin
                                    while (ch in[#33..#127]) do
                                    addToken;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end

        //C
        else if ch = 'c' then
        begin
            addToken;
            if ch = 'h' then
            begin
                addToken;
                if ch = 'a' then
                begin
                    addToken;
                    if ch = 'r' then
                    begin
                        addToken;
                        if not (ch in[#33..#127]) then
                        begin
                            // charcon
                            token := 'char';
                            kategori := 'charcon';
                        end
                        else
                        begin
                            while (ch in[#33..#127]) do
                            addToken;
                        end;
                    end;
                end;
            end;
            if ch = 'o' then
            begin
                addToken;
                if ch = 'n' then
                begin
                    addToken;
                    if ch = 's' then
                    begin
                        addToken;
                        if ch = 't' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // constsy
                                token := 'const';
                                kategori := 'constsy';
                            end
                            else
                            begin
                                while (ch in[#33..#127]) do
                                addToken;
                            end;
                        end;
                    end;
                end;
            end;
            if ch = 'a' then
            begin
                addToken;
                if ch = 's' then
                begin
                    addToken;
                    if ch = 'e' then
                    begin
                        addToken;
                        if not (ch in[#33..#127]) then
                        begin
                            // casesy
                            token := 'case';
                            kategori := 'casesy';
                        end
                        else
                        begin
                            while (ch in[#33..#127]) do
                            addToken;
                        end;
                    end;
                end;
            end;
        end

        //D
        else if ch = 'd' then
        begin
            addToken;
            if ch = 'i' then
            begin
                addToken;
                if ch = 'v' then
                begin
                    addToken;
                    if not (ch in[#33..#127])then
                    begin
                        // idiv
                        token := 'div';
                        kategori := 'idiv';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                        addToken;
                    end;
                end;
            end;
            if ch = 'o' then
            begin
                addToken;
                if ch = 'w' then
                begin
                    addToken;
                    if ch = 'n' then
                    begin
                        addToken;
                        if ch = 't' then
                        begin
                            addToken;
                            if ch = 'o' then
                            begin
                                addToken;
                                if not (ch in[#33..#127]) then
                                begin
                                    // downtosy
                                    token := 'downto';
                                    kategori := 'downtosy';
                                end
                                else
                                begin
                                    while (ch in[#33..#127]) do
                                    addToken;
                                end;
                            end;
                        end;
                    end;
                end
                else
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // dosy
                        token := 'do';
                        kategori := 'dosy';
                    end
                    else
                    begin
                         while (ch in[#33..#127]) do
                         addToken;
                    end;
                end;
            end;
        end

        //E
        else if ch = 'a' then
        begin
            addToken;
            if ch = 'n' then
            begin
                addToken;
                if ch = 'd' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // andsy
                        token := 'and';
                        kategori := 'andsy';
                    end
                    else
                    begin
                         while (ch in[#33..#127]) do
                         addToken;
                    end;
                end;
            end;
            if ch = 'r' then
            begin
                addToken;
                if ch = 'r' then
                begin
                    addToken;
                    if ch = 'a' then
                    begin
                        addToken;
                        if ch = 'y' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // arraysy
                                token := 'array';
                                kategori := 'arraysy';
                            end
                            else
                                begin
                                    while (ch in[#33..#127]) do
                                    addToken;
                                end;
                        end;
                    end;
                end;
            end;
        end

        //F
        else if ch = 'o' then
        begin
            addToken;
            if ch = 'r' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // orsy
                    token := 'or';
                    kategori := 'orsy';
                end
                else
                begin
                     while (ch in[#33..#127]) do
                     addToken;
                end;
            end;
            if ch = 'f' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // ofsy
                    token := 'of';
                    kategori := 'ofsy';
                end
                else
                begin
                     while (ch in[#33..#127]) do
                     addToken;
                end;
            end;
        end

        //G
        else if ch = 't' then
        begin
            addToken;
            if ch = 'y' then
            begin
                addToken;
                if ch = 'p' then
                begin
                    addToken;
                    if ch = 'e' then
                    begin
                        addToken;
                        if not (ch in[#33..#127]) then
                        begin
                            // typesy
                            token := 'type';
                            kategori := 'typesy';
                        end
                        else
                        begin
                             while (ch in[#33..#127]) do
                             addToken;
                        end;
                    end;
                end;
            end;
            if ch = 'o' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // tosy
                    token := 'to';
                    kategori := 'tosy';
                end
                else
                begin
                     while (ch in[#33..#127]) do
                     addToken;
                end;
            end;
            if ch = 'h' then
            begin
                addToken;
                if ch = 'e' then
                begin
                    addToken;
                    if ch = 'n' then
                    begin
                        addToken;
                        if not (ch in[#33..#127]) then
                        begin
                            // thensy
                            token := 'then';
                            kategori := 'thensy';
                        end
                        else
                        begin
                             while (ch in[#33..#127]) do
                             addToken;
                        end;
                    end;
                end;
            end;
        end

        //H
        else if ch = 'f' then
        begin
            addToken;
            if ch = 'u' then
            begin
                addToken;
                if ch = 'n' then
                begin
                    addToken;
                    if ch = 'c' then
                    begin
                        addToken;
                        if ch = 't' then
                        begin
                            addToken;
                            if ch = 'i' then
                            begin
                                addToken;
                                if ch = 'o' then
                                begin
                                    addToken;
                                    if ch = 'n' then
                                    begin
                                        addToken;
                                        if not (ch in[#33..#127]) then
                                        begin
                                            // functionsy
                                            token := 'function';
                                            kategori := 'functionsy';
                                        end
                                        else
                                        begin
                                        while (ch in[#33..#127]) do
                                            addToken;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            if ch = 'o' then
            begin
                addToken;
                if ch = 'r' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // forsy
                        token := 'for';
                        kategori := 'forsy';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                            addToken;
                    end;
                end;
            end;
        end

        //I
        else if ch = 'p' then
        begin
            addToken;
            if ch = 'r' then
            begin
                addToken;
                if ch = 'o' then
                begin
                    addToken;
                    if ch = 'c' then
                    begin
                        addToken;
                        if ch = 'e' then
                        begin
                            addToken;
                            if ch = 'd' then
                            begin
                                addToken;
                                if ch = 'u' then
                                begin
                                    addToken;
                                    if ch = 'r' then
                                    begin
                                        addToken;
                                        if ch = 'e' then
                                        begin
                                            addToken;
                                            if not (ch in[#33..#127]) then
                                            begin
                                                // proceduresy
                                                token := 'procedure';
                                                kategori := 'proceduresy';
                                            end
                                            else
                                            begin
                                            while (ch in[#33..#127]) do
                                                addToken;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    if ch = 'g' then
                    begin
                        addToken;
                        if ch = 'r' then
                        begin
                            addToken;
                            if ch = 'a' then
                            begin
                                addToken;
                                if ch = 'm' then
                                begin
                                    addToken;
                                    if not (ch in[#33..#127]) then
                                    begin
                                        // programsy
                                        token := 'Program';
                                        kategori := 'programsy';
                                    end
                                    else
                                    begin
                                        while (ch in[#33..#127]) do
                                            addToken;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end

        // J
        else if ch = 'e' then
        begin
            addToken;
            if ch = 'n' then
            begin
                addToken;
                if ch = 'd' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // endly
                        token := 'End';
                        kategori := 'endsy';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                            addToken;
                    end;
                end;
            end;
            if ch = 'l' then
            begin
                addToken;
                if ch = 's' then
                begin
                    addToken;
                    if ch = 'e' then
                    begin
                        addToken;
                        if not (ch in[#33..#127]) then
                        begin
                            // elsesy
                            token := 'else';
                            kategori := 'elsesy';
                        end
                        else
                        begin
                            while (ch in[#33..#127]) do
                                addToken;
                        end;
                    end;
                end;
            end;
        end

        // K
        else if ch = 's' then
        begin
            addToken;
            if ch = 't' then
            begin
                addToken;
                if ch = 'r' then
                begin
                    addToken;
                    if ch = 'i' then
                    begin
                        addToken;
                        if ch = 'n' then
                        begin
                            addToken;
                            if ch = 'g' then
                            begin
                                addToken;
                                if not (ch in[#33..#127]) then
                                begin
                                    // stringt
                                    token := 'String';
                                    kategori := 'stringt';
                                end
                                else
                                begin
                                    while (ch in[#33..#127]) do
                                        addToken;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end

        else if ch = 'n' then
        begin
            addToken;
            if ch = 'o' then
            begin
                addToken;
                if ch = 't' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // notsy
                        token := 'not';
                        kategori := 'notsy';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                            addToken;
                    end;
                end;
            end;
        end

        // M
        else if ch = 'm' then
        begin
            addToken;
            if ch = 'o' then
            begin
                addToken;
                if ch = 'd' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // imod
                        token := 'mod';
                        kategori := 'imod';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                            addToken;
                    end;
                end;
            end;
        end

        // N
        else if ch = 'v' then
        begin
            addToken;
            if ch = 'a' then
            begin
                addToken;
                if ch = 'r' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // varsy
                        token := 'var';
                        kategori := 'varsy';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                            addToken;
                    end;
                end;
            end;
        end

        // O
        else if ch = 'b' then
        begin
            addToken;
            if ch = 'e' then
            begin
                addToken;
                if ch = 'g' then
                begin
                    addToken;
                    if ch = 'i' then
                    begin
                        addToken;
                        if ch = 'n' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // beginly
                                token := 'begin';
                                kategori := 'beginly';
                            end
                            else
                            begin
                                while (ch in[#33..#127]) do
                                    addToken;
                            end;
                        end;
                    end;
                end;
            end;
        end

        // P
        else if ch = 'w' then
        begin
            addToken;
            if ch = 'h' then
            begin
                addToken;
                if ch = 'i' then
                begin
                    addToken;
                    if ch = 'l' then
                    begin
                        addToken;
                        if ch = 'e' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // whilesy
                                token := 'while';
                                kategori := 'whilesy';
                            end
                            else
                            begin
                                while (ch in[#33..#127]) do
                                    addToken;
                            end;
                        end;
                    end;
                end;
            end;
        end

        // Q
        else if ch = 'u' then
        begin
            addToken;
            if ch = 'n' then
            begin
                addToken;
                if ch = 't' then
                begin
                    addToken;
                    if ch = 'i' then
                    begin
                        addToken;
                        if ch = 'l' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // untisy
                                token := 'until';
                                kategori := 'untisy';
                            end
                            else
                            begin
                                while (ch in[#33..#127]) do
                                    addToken;
                            end;
                        end;
                    end;
                end;
            end;
        end

        // R
        else if ch = '<' then
        begin
            addToken;
            if ch = '>' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // neg
                    token := '<>';
                    kategori := 'neg';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end
            else if ch = '=' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // leg
                    token := '<=';
                    kategori := 'leg';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end
            else
            begin
            if not (ch in[#33..#127]) then
                begin
                    // lss
                    token := '<';
                    kategori := 'lss';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end;
        end


        // S
        else if ch = '>' then
        begin
            addToken;
            if ch = '=' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // geg
                    token := '>=';
                    kategori := 'geg';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end
            else
            begin
            if not (ch in[#33..#127]) then
                begin
                    // gtr
                    token := '>';
                    kategori := 'gtr';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end;
        end

        // T
        else if ch = ':' then
        begin
            addToken;
            if ch = '=' then
            begin
                addToken;
                if not (ch in[#33..#127]) then
                begin
                    // become
                    token := ':=';
                    kategori := 'become';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end
            else
            begin
            if not (ch in[#33..#127]) then
                begin
                    // colon
                    token := ':';
                    kategori := 'colon';
                end
                else
                begin
                    while (ch in[#33..#127]) do
                        addToken;
                end;
            end;
        end

        // U
        else if ch = '+' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // plus
                token := '+';
                kategori := 'plus';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;
            end;
        end

        // V
        else if ch = '-' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // minus
                token := '-';
                kategori := 'minus';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;
            end;
        end

        // W
        else if ch = '*' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // times
                token := '*';
                kategori := 'times';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // X
        else if ch = '=' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // egl
                token := '=';
                kategori := 'egl';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Y
        else if ch = '(' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // lparent
                token := '(';
                kategori := 'lparent';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Z
        else if ch = ')' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // rparent
                token := ')';
                kategori := 'rparent';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Aa
        else if ch = '[' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // lbrack
                token := '[';
                kategori := 'lbrack';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Ba
        else if ch = ']' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // rbrack
                token := '[';
                kategori := 'rbrack';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Ca
        else if ch = ',' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // comma
                token := ',';
                kategori := 'comma';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Da
        else if ch = ';' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // semicolon
                token := ';';
                kategori := 'semicolon';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Ea
        else if ch = '.' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // Period
                token := '.';
                kategori := 'Period';
            end
            else
            begin
                while (ch in[#33..#127]) do
                    addToken;

            end;
        end

        // Ea
        else if (ch in['0'..'9']) then
        begin
            addToken;
            while (ch in['0'..'9']) do
            begin
                 kategori := 'typeint';
                 addToken;
            end;

            if ch = '.' then
            begin
                addToken;
                while (ch in['0'..'9']) do
                      addToken;
                kategori := 'typereal';
            end
            else
            begin
                kategori := 'typeint';
            end;

            //if not ((ch in['0'..'9'])) then
            //begin
            //    // typeint
            //    kategori := 'typeint';
            //end;

        end

        // Ea
        else if ch = #39 then
        begin
            addToken;
            kutip := true;
            while not (ch = #39) do
            begin
                // typechar
                addToken;
                kategori := 'typechar';
            end;
            kutip := false;
        end;

        if token <> '' then begin
            i := i + 2;
            gotoxy(30,7+i); write('|    |                  |                      |');
            GotoXY(32,7+i); Write(i);
            GotoXY(37,7+i); Write(token);
            GotoXY(62,7+i); Write(kategori);

            token := '';
            kategori := '';
        end;
        //readln;
    end;
    Close(f);
end;

procedure border;
begin
    gotoxy(30,5); write('------------------------------------------------');
    gotoxy(30,6); write('| No |     Token        |        Kategori      |');
    gotoxy(30,7); write('------------------------------------------------');
end;

Begin
  border;
  scanCode;
  readln;
End.