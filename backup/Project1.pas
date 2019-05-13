Program program331;

Uses crt, wincrt;

Var
   f        : text;
   ch       : char;
   token    : String;
   kategori : String;
   i,k,j    : Integer;
   kutip    : boolean;
   cekToken, cekKate : String;
   akhir, terima     : boolean;

   hasilToken    : array[0..100] of String;
   hasilKategori : array[0..100] of String;

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
                                        token := 'integer';
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
                                        token := 'program';
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
                        token := 'end';
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
                                    token := 'string';
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
                token := ']';
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
        end

        // P
        else if ch = 'l' then
        begin
            addToken;
            if ch = 'a' then
            begin
                addToken;
                if ch = 'b' then
                begin
                    addToken;
                    if ch = 'e' then
                    begin
                        addToken;
                        if ch = 'l' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // whilesy
                                token := 'label';
                                kategori := 'labelsy';
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

        if token <> '' then begin
            i := i + 1;
            k := k + 1;

            if i = 22 then begin
                GotoXY(35,7+i); Write('tekan enter untuk lanjutkan');
                i := 1;
                 //readln;
                clrscr;
            end;

            hasilToken[k]       := token;
            hasilKategori[k]    := kategori;

             gotoxy(30,7+i); write('|    |                  |                      |');
             GotoXY(32,7+i); Write(k);
             GotoXY(37,7+i); Write(hasilToken[k]);
             GotoXY(62,7+i); Write(hasilKategori[k]);




            token := '';
            kategori := '';
        end;
        gotoxy(30,7); write('------------------------------------------------');
    end;
    Close(f);
end;

procedure bacaToken;
begin
    if j <= k then
    begin

        if ((hasilKategori[j+1] = 'identifier') or
        (hasilKategori[j+1] = 'typeint') or
        (hasilKategori[j+1] = 'typereal') or
        (hasilKategori[j+1] = 'typechar')) then
        begin
            j := j + 1;
            cekToken := hasilKategori[j];
             
             //writeln(j);
        end
        else
        begin
            j := j + 1;
            cekToken := hasilToken[j];
            
             //writeln(cekToken);
        end;
    end;
end;

procedure cek(terminal : String);
begin

     if terminal = cekToken then
     begin
        terima := true;
        writeln('ok ' + cekToken);
        akhir := false;
        bacaToken;
     end
     else
        terima := false;
        if akhir = true then
        begin
            writeln('Tidak Diterima ' + terminal + ' dengan ' + cekToken);
            j := k + 1;
        end;
end;

procedure empty;
begin
    writeln('ok empty');
end;

procedure identifier;
begin
    //writeln('identifier');
    cek('identifier');

end;

procedure program_;
begin
     writeln('');
     cek('program');
     identifier;
     cek(';');
end;

procedure unsigned_integer;
begin
     cek('typeint');
end;

procedure unsigned_real;
begin
     cek('typereal');
end;

procedure sign;
begin
    case (cekToken) of
        '+'     : begin
                    cek('+');
                end;
        '-'     : begin
                    cek('-');
                end;
    
    end;
end;

procedure unsigned_number;
var
   c  : integer;
begin
    c := 1;
    while c <= 2 do
    begin
        case (c) of
            1   : begin
                    unsigned_integer;
                    if terima = true then
                    begin
                         break;
                    end;
                end;

            2   : begin
                    unsigned_real;
                    akhir := true;
                    if terima = true then
                    begin
                         break;
                    end;
                end;
        end;
        c := c + 1;
    end;
    akhir := false;
end;

procedure constant_identifier;
begin
    identifier;
end;

procedure string_;
begin
    cek('typechar');
end;

procedure constant;
var
   c  : integer;
begin
    c := 1;
    while c <= 5 do
    begin
        case (c) of
            1   : begin
                    unsigned_number;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    sign;
                    unsigned_number;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            3   : begin
                    constant_identifier;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            4   : begin
                    sign;
                    constant_identifier;
                    if terima = true then
                    begin
                         break;
                    end;
                end;
            
            5   : begin
                    string_;
                    akhir := true;
                    if terima = true then
                    begin
                         break;
                    end;
                end;
        end;
        c := c + 1;
    end;
    akhir := false;
end;

procedure constant_definition;
begin
     identifier;
     cek('=');
     constant;
end;

procedure constant_definition_part;
begin
    case (cekToken) of
        'const' : begin
                    cek('const');
                    constant_definition;
                    while (hasilKategori[j+1] = 'identifier') and (terima = true) do
                    begin
                        cek(';');
                        constant_definition;
                    end;
                    akhir := true;
                    write('keluar');
                    cek(';');
                end;
    else
        empty;
    end;
end;

//-----------------Label-----------------
procedure label_;
begin
    unsigned_integer;
end;

procedure label_declaration_part;
begin
    case (cekToken) of
        'label'    : begin
                    cek('label');
                    label_;
                    
                    while hasilToken[j] = ',' do
                    begin
                        cek(',');
                        
                        label_;
                    end;
                    akhir := true;
                    cek(';');  
                end;
    else
        empty;
    end;
end;

procedure scalar_type;
begin
    identifier;
    // write(hasilToken[j-1]);
    while hasilToken[j] = ',' do
    begin
        cek(',');
        identifier;
    end;
end;

procedure subrange_type;
begin
    constant;
    cek('.');
    cek('.');
    constant;
end;

procedure type_identifier;
begin
    identifier;    
end;

procedure simple_type;
var
   c  : integer;
begin
    c := 1;
    while c <= 3 do
    begin
        case (c) of
            1   : begin
                    scalar_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    subrange_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            3   : begin
                    type_identifier;
                    akhir := true;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
        end;
        c := c + 1;
    end;
    akhir := false; 

end;

procedure type_; forward;
procedure component_type;
begin
    type_;
end;

procedure index_type;
begin
    simple_type;
end;


procedure field_identifier;
begin
    identifier;
end;

procedure record_section;
var
   c : integer;
begin
    c := 0;
    while c <= 1 do
    begin
        c := c + 1;
        case (c) of
            1  : begin
                    field_identifier;
                    while hasilToken[j] = ',' do
                    begin
                        cek(',');
                        field_identifier;
                    end;
                    cek(':');
                    type_;
                    akhir := true;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
        else
            empty;
        end;

    end;
end;

procedure fixed_part;
begin
    record_section;
    //while hasilToken[j] = ';' do
    //begin
    //    cek(';');
    //    record_section;
    //end;

end;

procedure variant_part; forward;
procedure fixed_part_turunan;
var
   c : integer;
begin
    case (cekToken) of
        ';'   : begin
                cek(';');
                variant_part;
            end;
    else
        empty;
    end;
end;

procedure case_label;
begin
    constant;
end;

procedure case_label_list;
begin
    case_label;
    while hasilToken[j] = ',' do
    begin
        cek(',');
        case_label;
    end;
end;

procedure field_list; forward;
procedure variant_;
var
   c : integer;
begin
    c := 0;
    while c <= 1 do
    begin
        c := c + 1;
        case (c) of
            1  : begin
                    case_label_list;
                    cek(':');
                    cek('(');
                    field_list;
                    cek(')');
                end;
        else
            empty;
        end;
    end;
end;

procedure tag_field;
var
   c : integer;
begin
    c := 0;
    while c <= 1 do
    begin
        c := c + 1;
        case (c) of
            1  : begin
                    field_identifier;
                    cek(':');
                    akhir := true;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
        else
            empty;
        end;
    end;
end;

procedure variant_type;
begin
    cek('case');
    tag_field;
    type_identifier;
    cek('of');
    variant_;
    while hasilToken[j] = ';' do
    begin
        cek(';');
        variant_;
    end;

end;

procedure variant_part;
begin
    variant_type;
end;

procedure field_list;
var
   c  : integer;
begin
    c := 1;
    while c <= 1 do
    begin
        case (c) of
            1   : begin
                    fixed_part;
                    //fixed_part_turunan;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    //variant_part;
                    akhir := true;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
        end;
        c := c + 1;
    end;
end;

procedure record_type;
begin
    cek('record');
    //field_list;
    cek('end');
end;

procedure array_type;
begin
    cek('array');
    cek('[');
    index_type;
    while hasilToken[j] = ',' do
    begin
        cek(',');
        index_type;
    end;
    cek(']');
    cek('of');
    component_type;
end;


procedure structured_type;
var
   c  : integer;
begin
    c := 1;
    while c <= 3 do
    begin
        case (c) of
            1   : begin
                    record_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    array_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            3   : begin
                    // set_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            4   : begin
                    // file_type;
                    akhir := true;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
        end;
        c := c + 1;
    end;
end;

procedure type_;
var
   c  : integer;
begin
    c := 1;
    while c <= 5 do
    begin
        case (c) of
            1   : begin
                    simple_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    structured_type;
                    write('ada');
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            3   : begin
                    constant_identifier;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            4   : begin
                    sign;
                    constant_identifier;
                    if terima = true then
                    begin
                         break;
                    end;
                end;
            
            5   : begin
                    string_;
                    akhir := true;
                    if terima = true then
                    begin
                         break;
                    end;
                end;
        end;
        c := c + 1;
    end;
    akhir := false; 
end;

procedure type_definition;
begin
    identifier;
    cek('=');
    type_;
end;

procedure type_definition_part;
begin
    case (cekToken) of
        'type'  : begin
                    cek('type');
                    type_definition;
                    while (hasilKategori[j+1] = 'identifier') or
                    (hasilToken[j+1] = 'record') or
                    (hasilToken[j+1] = 'array')  do
                    begin
                        cek(';');
                        type_definition;
                    end;
                    akhir := true;
                    cek(';');
                end;
    else
        empty;
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

//----------------------------------------------------------------------------------------------------
//--------------------------------------delimiter statement part--------------------------------------
//----------------------------------------------------------------------------------------------------

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

procedure block;
begin
    label_declaration_part;
    constant_definition_part;
    type_definition_part;
    variable_declaration_part;
    //procedure_and_function_declaration_part;
end;

procedure parser;
begin
    j := 0;
    bacaToken;
    program_;

    block;
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
  parser;
  readln;
End.
