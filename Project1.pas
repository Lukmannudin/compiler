
//Nama Saya Zafir
Program program331;

Uses crt, wincrt;

type
    stack_pointer = ^stack;
    stack = Record
        info: string;
        prev,next: stack_pointer;
    end;

Var
   f        : text;
   ch       : char;
   token    : String;
   kategori : String;
   tokenPost: String;
   i,k,j    : Integer;
   y,x,u    : Integer; // uniq
   z        : integer; // type
   incPost  : integer;
   kutip    : boolean;
   cekToken, cekKate : String;
   akhir, terima     : boolean;
   note     : string;

   FOCC : integer;
   uniq : boolean;
   typeSts : boolean;

   error : boolean;

//      FOCC ==> Flow of Control check
//      uniq ==> uniqueness_check variable

    awal,terakhir: stack_pointer;

    hasilToken    : array[0..500] of String;
    hasilKategori : array[0..500] of String;
    uniqCek       : array[0..300] of String;  // kumpulan semua data
    uniqData      : array[0..300] of String;  // kumpulan data yg sama
    uniqType      : array[0..300] of String;  // kumpulan tipe data

    typeCek       : array[0..50] of String;

    hasilPost     : array[0..500] of String;
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
                            // thensy
                            token := 'file';
                            kategori := 'filesy';
                        end
                        else
                        begin
                             while (ch in[#33..#127]) do
                             addToken;
                        end;
                    end;
                end;
            end;
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
                        if ch = 'o' then
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
                                        // programsy
                                        token := 'goto';
                                        kategori := 'gotosy';
                                    end
                                    else
                                    begin
                                        while (ch in[#33..#127]) do
                                            addToken;
                                    end;
                                end;
                            end;
                        end;
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
            if ch = 'e' then
            begin
                addToken;
                if ch = 't' then
                begin
                    addToken;
                    if not (ch in[#33..#127]) then
                    begin
                        // setsy
                        token := 'set';
                        kategori := 'setsy';
                    end
                    else
                    begin
                        while (ch in[#33..#127]) do
                            addToken;
                    end;
                end;
            end;
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
            if ch = 'r' then
            begin
                addToken;
                if ch = 'i' then
                begin
                    addToken;
                    if ch = 't' then
                    begin
                        addToken;
                        if ch = 'e' then
                        begin
                            addToken;
                            if not (ch in[#33..#127]) then
                            begin
                                // whilesy
                                token := 'write';
                                kategori := 'writesy';
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
                                kategori := 'untilsy';
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

        // U
        else if ch = '/' then
        begin
            addToken;
            if not (ch in[#33..#127]) then
            begin
                // plus
                token := '/';
                kategori := 'garing';
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

        // Eb
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

            if i = 22 then begin //untuk halaman baru
                // GotoXY(35,7+i); Write('tekan enter untuk lanjutkan');
                i := 1;
                // readln;
                clrscr;
            end;

            begin
                while (ch in[#33..#127]) do
                    addToken;
            end;

            hasilToken[k]       := token;
            hasilKategori[k]    := kategori;

            //  gotoxy(30,7+i); write('|    |                  |                      |');
            //  GotoXY(32,7+i); Write(k);
            //  GotoXY(37,7+i); Write(hasilToken[k]);
            //  GotoXY(62,7+i); Write(hasilKategori[k]);

            token := '';
            kategori := '';
        end;
        // gotoxy(30,7); write('------------------------------------------------');
    end;
    Close(f);
end;

procedure bacaToken;
begin
    if j <= k then
    begin
        i := i + 1;

        if i = 22 then begin
                // GotoXY(35,7+i); Write('tekan enter untuk lanjutkan');
                i := 1;
                // readln;
                clrscr;
            end;

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

function postfix(rumus:String):String; forward;
procedure postExpresion(tanda : string); forward;
procedure postStatment; forward;
procedure postOneChar; forward;


procedure flow_of_control_check(input : string);
begin
    if ((input = 'begin') or
        (input = 'case') or
        (input = 'record') ) then
        FOCC :=  FOCC + 1;
    if input = 'end' then
        FOCC := FOCC - 1;
end;

procedure uniqueness_check(data : string);
var
    i : integer;
begin
    i := 0;
    while i <= x do
    begin
        if data = uniqCek[i] then
        begin
            
            uniq := true;
            uniqData[u] := data;
        end;
        i := i + 1;
    end;
    uniqCek[x] := data;
    x := x + 1;
end;

procedure type_conversion;forward;

procedure type_checking(token, kate, opr : string);
var
    i : integer;
begin
    i := 0;
    if ((kate = 'typeint') or (kate = 'typereal')) then
        typeCek[z] := kate;
    
    if ((kate = 'identifier')) then
    begin
        
        while token <> uniqCek[i] do
        begin
            i := i + 1; 
        end;
        typeCek[z] := uniqType[i];
        kate := typeCek[i];
        
    end;
    if typeSts = true then
    begin
        if z > 0 then
        begin
            // write(typeCek[z-1]);
            if ((typeCek[z-1] = 'typeint') or (typeCek[z-1] = 'typereal') or 
            (typeCek[z-1] = 'Integer') or (typeCek[z-1] = 'Real') or (typeCek[z-1] = 'Double')) then
            begin
                if ((typeCek[z] = 'typeint') or (typeCek[z] = 'typereal') or 
                (typeCek[z] = 'Integer') or (typeCek[z] = 'Real') or (typeCek[z] = 'Double')) then
                begin
                    if opr = '/' then
                    begin
                        type_conversion;
                    end
                    // write('check type');
                end
                else
                    typeSts := false;
                    note := 'tipe data salah';
            end

            else if ((typeCek[z-1] = 'typechar') or (typeCek[z-1] = 'String') or (typeCek[z-1] = 'Char')) then
            begin
                if ((typeCek[z] = 'typechar') or (typeCek[z] = 'String') or (typeCek[z] = 'Char')) then
                begin
                    if ((opr = '+') or (opr = ';')) then
                    else
                        typeSts := false;
                        note := 'opertor tidak didukung untuk pengolahan string';
                end
                else
                    typeSts := false;
                    note := 'tipe data salah';
            end
            else
            begin
                typeSts := false;
                note := 'tipe data salah';
            end;
        end;
        z := z +1;
    end;
    
    if opr = ';' then
        z := 0;
end;

procedure type_conversion;
begin
    if ((typeCek[0] = 'Real')) then
    begin
        //ok
    end
    else
    begin
        typeSts := false;
        note := 'tipe data salah tdak bolehh integer';
    end;
end;

procedure type_coercion;
begin
    
end;

procedure cek(terminal : String);
begin

     if terminal = cekToken then
     begin
        terima := true;
        gotoxy(30,7+i); write('|    |                  |                      |');
        GotoXY(32,7+i); Write('ok');
        GotoXY(37,7+i); Write(hasilToken[j]);
        GotoXY(62,7+i); Write(hasilKategori[j]);

        flow_of_control_check(hasilToken[j]);
        //writeln('ok ' + hasilToken[j] + ' (' +hasilKategori[j] + ')');
        akhir := false;
        bacaToken;
     end
     else
        terima := false;
        if akhir = true then
        begin

            // if FOCC <> 0 then
            // begin
            //     GotoXY(25,8+i); writeln('terjadi kesalahan pada flow of control check');
            //     readln;
            // end;
                

            error := true;
            GotoXY(25,8+i); writeln('Tidak Diterima terminal ' + terminal + ' dengan token masukan ' + cekToken);
            readln;
            j := k + 1;
        end;
end;

procedure empty;
begin
    // writeln('ok empty');
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
     akhir := true;
     cek(';');
     akhir := false;
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
    uniqueness_check(hasilToken[j]);
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
                    cek(';');
                end;
    else
        empty;
    end;
end;

//-----------------Label-----------------
procedure label_;
begin
    uniqueness_check(hasilToken[j]);
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
                    akhir := true;
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
    field_list;
    akhir := true;
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

procedure base_type;
begin
    simple_type;
end;

procedure set_type;
begin
    cek('set');
    cek('of');
    base_type;
end;

procedure file_type;
begin
    cek('file');
    cek('of');
    type_;
end;


procedure structured_type;
var
   c  : integer;
   d  : char;
begin
    c := 1;
    while c <= 3 do
    begin
        d := hasilToken[j][1];
        case (d) of
            'r'   : begin
                    record_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            'a'   : begin
                    array_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            's'   : begin
                    set_type;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            'f'   : begin
                    file_type;
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
    uniqueness_check(hasilToken[j]);
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
var 
    i : integer;
begin
    i := j;
    uniqueness_check(hasilToken[j]);
    identifier;
    while (hasilToken[j] <> ':') do
        begin
            cek(',');
            uniqueness_check(hasilToken[j]);
            identifier;
        end;
    cek(':');
    while y < x do
    begin
        uniqType[y] := hasilToken[j];
        y := y + 1;
    end;
    
    type_;
end;

procedure variable_declaration_part();
begin
  if (cekToken = 'var') then
    begin
        cek('var');
        variable_declaration();
        while (hasilKategori[j+1] = 'identifier') and (terima = true) do
            begin
                cek(';');
                variable_declaration;
            end;
        akhir := true;
        cek(';');
    end 
    else 
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
  if hasilToken[j] = 'var' then
    begin
      cek('var');
      parameter_group();
    end else 
    if hasilToken[j] = 'function' then
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
    uniqueness_check(hasilToken[j]);
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
        akhir := true;
        cek(';');

        end else if(hasilToken[j] = ':') then
        begin
            cek(':');
            result_type();
            akhir := true;
            cek(';');
        end else
            cek('salah');
end;

procedure procedure_heading();
var i:Integer;
begin
    cek('procedure');
    uniqueness_check(hasilToken[j]);
    identifier();
    if hasilToken[j] = ';' then
    begin
        akhir := true;
        cek(';')
    end 
        
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
        akhir:= true;
        cek(';')
    end else
        cek('salah');
end;

procedure block_(); forward;
procedure function_declaration();
begin
  function_heading();
  block_;
end;

procedure procedure_declaration();
begin
  procedure_heading();
  block_;
end;

procedure procedure_or_function_declaration();
var i: Integer;
begin
  for i:=0 to 2 do
    begin
      case i of 
        0: procedure_declaration();
        1: function_declaration();
      end;
    end;
end;

procedure procedure_and_function_declaration_part();
begin
    while (hasilToken[j] = 'procedure') or (hasilToken[j] = 'function') do
    begin
        procedure_or_function_declaration();
    end;
end;

//----------------------------------------------------------------------------------------------------
//--------------------------------------delimiter statement part--------------------------------------
//----------------------------------------------------------------------------------------------------
procedure variable_identifier;
begin
    identifier;
end;

procedure entire_variable;
begin
    variable_identifier;
end;

// procedure component_variable;
// begin
    
// end;

procedure variable();
var
    i : integer;
begin
    for i:=0 to 2 do
    begin
        case i of 
            0: entire_variable();
            // 1: component_variable();
        end;
    end;
end;

procedure unsigned_constant();
var i:Integer;
begin
for i:= 0 to 3 do
    begin
        case i of
            0: begin
                unsigned_number;
                if terima = true then
                begin
                    break;
                end;
            end;
            1: begin
                constant_identifier;
                if terima = true then
                begin
                    break;
                end;
            end;
            2: begin
            constant_identifier;
            cek('nil');
            if terima = true then
                begin
                    break;
                end;
            end;
        end;
    end;
    akhir := false;
end;

procedure expression();forward;
procedure procedure_identifier();forward;
procedure function_identifier();forward;

procedure actual_parameter();
var
    c : integer;
begin
    c := 1;
    while c <= 4 do
    begin
        case (c) of
            1   : begin
                    expression;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    variable;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            3   : begin
                    procedure_identifier;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            4   : begin
                    function_identifier;
                    if terima = true then
                    begin
                         break;
                    end;
                end;

        end;
        c := c + 1;
    end;
end;

procedure function_designator();
var i:Integer;
begin
    function_identifier();
    if hasilToken[j]='(' then
    begin
        cek('(');
        actual_parameter();
        while ((hasilToken[j] = ',')) do
        begin
            cek(',');
            actual_parameter;
        end;
        akhir := true;
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
  akhir := true;
  cek(']');
end;

procedure factor();
var i: Integer;
begin
    i := 0;
    while i <= 5 do
    begin
        if (hasilToken[j] = ')') then
            i := 3;

        if ((hasilToken[j] = '=') or
            (hasilToken[j] = '<>') or
            (hasilToken[j] = '<') or
            (hasilToken[j] = '<=') or
            (hasilToken[j] = '>=') or
            (hasilToken[j] = '>') or 
            (hasilToken[j] = ',') or 
            (hasilToken[j] = ';') or 
            (hasilToken[j] = 'then') or 
            (hasilToken[j] = 'end') or 
            (hasilToken[j] = 'of') or 
            (hasilToken[j] = 'end') or 
            (hasilToken[j] = 'do') or 
            (hasilToken[j] = 'until') or 
            (hasilToken[j] = 'to') or 
            (hasilToken[j] = 'downto')
            
        ) then
            i := 5;

        case i of
            0:  begin
                    variable;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
            1: begin 
                    unsigned_constant;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
            2: begin
                    cek('(');
                    expression();
                    if terima = true then
                    begin
                        break;
                    end;
                end;
            
            3: begin
                    cek(')');
                    
                    if terima = true then
                    begin
                        break;
                    end;
            end;
            //   3: function_designator;
            // 4: set_();
            4: begin 
                cek('not');
                factor;
            end;

            5:  begin
                break;
            end;
             
        end;
        i := i + 1;
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
    end;
end;

procedure term();
var i:Integer;
begin
    factor;
    type_checking(hasilToken[j-1],hasilKategori[j-1],hasilToken[j]);
    if ((hasilToken[j] <> ';') and
        (hasilToken[j] <> '+') and
        (hasilToken[j] <> '-') and
        (hasilToken[j] <> 'or') and
        (hasilToken[j] <> ',') and
        (hasilToken[j] <> ')') and
        (hasilToken[j] <> 'end') and
        (hasilToken[j] <> 'until')
    ) then
    begin
        multiplying_operator();
        factor;
        type_checking(hasilToken[j-1],hasilKategori[j-1],hasilToken[j]);
    end;
end;

procedure adding_operator();
begin
    case cekToken of
        '+': cek('+');
        '-': cek('-');
        'or': cek('or');
    end;
end;

procedure simple_expression();
var i: Integer;
begin
    i := 0;
    while i <= 1 do
    begin
        if ((hasilToken[j] = '+') or (hasilToken[j] = '-')) then
            i := 1;
        
        begin
        case i of 
            0:  begin
                    term;
                    type_checking(hasilToken[j-1],hasilKategori[j-1],hasilToken[j]);
                    if ((hasilToken[j] <> ';') and
                        (hasilToken[j] <> ',')and
                        (hasilToken[j] <> ')')) then
                    begin
                        if ((hasilToken[j] <> '+') or
                            (hasilToken[j] <> '-') or
                            (hasilToken[j] <> 'or')) then
                        begin
                            adding_operator;
                            term;
                            type_checking(hasilToken[j-1],hasilKategori[j-1],hasilToken[j]);
                        end;
                    end;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
            1:  begin
                    sign;
                    term;
                    if terima = true then
                    begin
                        break;
                    end;
                end;  
            end;
            i := i+1;
        end;
    end;
end;

procedure relational_operator();
begin
    akhir := true;
    case cekToken of
        '=' : cek('=');
        '<>': cek('<>');
        '<' : cek('<');
        '<=': cek('<=');
        '>=': cek('>=');
        '>' : cek('>');
        // 'in': cek('in');
        else
        cek('salah');
    end;
end;

procedure expression();
var 
    c : Integer;
begin
    c := 1;
    while c <= 5 do
    begin
        case (c) of
            1   : begin
                    simple_expression();
                    if ((hasilToken[j] <> ';') and
                        (hasilToken[j] <> ',') and
                        (hasilToken[j] <> ')')) then
                    begin
                        if ((hasilToken[j] = '=') or
                            (hasilToken[j] = '<>') or
                            (hasilToken[j] = '<') or
                            (hasilToken[j] = '<=') or
                            (hasilToken[j] = '>=') or
                            (hasilToken[j] = '>')
                        ) then
                        begin
                            relational_operator();
                            simple_expression();
                        end;
                    end;
                    if terima = true then
                    begin
                        break;
                    end;
                end;
        end;
    end;
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
                type_checking(hasilToken[j],hasilKategori[j],hasilToken[j+1]);
                // postOneChar;
                variable;
                // postOneChar;
                cek(':=');
                expression();  
                if terima = true then
                begin
                    break;
                end;           
            end;

            1: begin
                function_identifier();
                cek(':=');
                expression();
                if terima = true then
                begin
                    break;
                end;
            end;
        end;
    end;
end;
procedure procedure_identifier;
begin
    identifier;
    if (hasilToken[j] <> ';') then
    begin
        cek('(');
        actual_parameter;
        while hasilToken[j] = ',' do
        begin
            cek(',');
            actual_parameter; 
        end;
        cek(')');
        term;
    end;
    akhir := false;
end;

procedure procedure_statement();
begin
    procedure_identifier;
end;

procedure go_to_statement();
begin
    cek('goto');
    label_;
end;

procedure empty_statement();
begin
    empty;
end;

procedure simple_statement();
var i:Integer;
begin
    i := 0;
    while i <= 3 do
    begin
    // readln;


    if ((hasilToken[j+1] = '(')) then
        i := 1;
    case i of
        0:  begin
                assignment_statement();
                break;
            end;
        1:  begin
                procedure_statement();
                break;
            end;
        
        2:  begin
                go_to_statement();
                break;
            end;
        3:  begin
                empty_statement();
                break;
            end;
        // 4: cek('salah');
      end;
    end;
end;

procedure statement;forward;

procedure case_list_element;
begin
    case_label_list;
    cek(':');
    statement;
end;

procedure if_statement;
var
    inc : integer;
begin
    cek('if');
    postExpresion('then');
    expression;
    cek('then');

    postStatment;
    statement;
    if hasilToken[j] = 'else' then
    begin
        cek('else');
        statement;
    end;
end;

procedure case_statement;
var
    inc : integer;
begin
    cek('case');
    inc := j;
    while (hasilToken[inc] <> 'of') do
    begin
        tokenPost := concat(tokenPost,hasilToken[inc]);
        inc := inc + 1;
    end;
    postfix(tokenPost);
    expression;
    cek('of');
    case_list_element;
    cek(';');
    while (hasilToken[j] <> 'end') do
    begin
        case_list_element;
        cek(';');
    end; 
    akhir := true;
    cek('end');
    akhir := true;
    cek(';');
end;

procedure conditional_statement;
begin
    case hasilToken[j] of
        'if'    : begin
                    if_statement;
                end;
        
        'case'  : begin
                    case_statement;
                end;
    end;
end;

procedure while_statement;
begin
    cek('while');
    expression;
    cek('do');
    statement;
    akhir := true;
end;

procedure repeat_statement;
var 
    inc : integer;
begin
    cek('repeat');
    postStatment;
    statement;
    cek(';');
    while hasilToken[j] <> 'until' do
    begin
        postStatment;
        statement;
        cek(';');
    end;
    cek('until');
    postExpresion(';');
    expression;
end;

procedure initial_value;
begin
    postExpresion(';');
    expression;
end;

procedure final_value;
begin
    postExpresion(';');
    expression;
end;

procedure for_list;
begin
    initial_value;
    if hasilToken[j] = 'to' then
    begin
        cek('to')
    end
    else
        begin
            cek('downto');
        end;
    final_value;
end;

procedure control_variable;
begin
    identifier;
end;

procedure for_statement;
begin
    cek('for');
    control_variable;
    cek(':=');
    for_list;
    cek('do');
    postStatment;
    statement;
end;

procedure repetitive_statement;
begin
    case hasilToken[j] of
        'while' : while_statement;
        'repeat' : repeat_statement;
        'for' : for_statement;
    end;
end;

procedure compound_statement;forward;

procedure structured_statement();
var
    c : integer;
begin
    c := 1;
    while c <= 5 do
    begin
        
        if ((hasilToken[j] = 'if') or
            (hasilToken[j] = 'case') ) then
            c := 2;

        if ((hasilToken[j] = 'while') or
            (hasilToken[j] = 'repeat') or
            (hasilToken[j] = 'for') ) then
            c := 3;

        case (c) of
            1   : begin
                    compound_statement;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            2   : begin
                    conditional_statement;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            3   : begin
                    repetitive_statement;
                    akhir := true;
                    if terima = true then
                    begin
                        break;
                    end;
                end;

            4   : begin
                    // with_statement;
                    if terima = true then
                    begin
                         break;
                    end;
                end;
            
            5   : begin
                    break;
                end;
        end;
        c := c + 1;
    end;
    akhir := false;
end;

procedure unlabelled_statement();
var c:Integer;
begin
    c := 0;
    if ((hasilKategori[j] = 'identifier' ) or
        (hasilToken[j] = '+') or
        (hasilToken[j] = '-') or
        (hasilToken[j] = ')') or
        (hasilToken[j] = 'end') or
        (hasilToken[j] = ';')) then
        c := 0
    else 
        c := 1;

    case c of
        0:  begin
                simple_statement();
            end;
        1:  begin
                structured_statement();
            end;
    end;
end;

procedure statement();
var i:Integer;
begin
    i := 0;
    while i <= 1 do
    begin
        if ((hasilToken[j] = 'end') or
            (hasilToken[j] = ''   ) ) then
            i := 1 ;
            begin
            case i of
                0:  begin
                        unlabelled_statement();
                        if terima = true then
                        begin
                            break;
                        end;
                    end;
                1: begin
                    empty_statement;
                    break;
                end;
            end;
        end;
    end;
end;

procedure compound_statement();
begin
    cek('begin');
    statement();
    // akhir := true;
    cek(';');
    while ((hasilToken[j] <> 'end')) do
    begin
        write('masuk');
        statement();
        // akhir := true;
        cek(';');
    end;
    // akhir := true;
    cek('end');
    if hasilToken[j] <> 'else' then
    begin
        akhir := true;
        cek(';');
    end;
    
end;

procedure statement_part();
begin 
    if hasilToken[j] = 'begin' then
        compound_statement()
    else
        empty_statement;
end;

procedure block_;
begin
    label_declaration_part;
    constant_definition_part;
    type_definition_part;
    variable_declaration_part;
    statement_part;
end;

procedure block;
begin
    label_declaration_part;
    constant_definition_part;
    type_definition_part;
    variable_declaration_part;
    procedure_and_function_declaration_part;
    statement_part;
end;

procedure parser;
begin

    bacaToken;
    program_;

    block;
end;

procedure semantik;
var
    i : integer;
begin
    i := 0;
    //jika tidak lulus FOCC
    if FOCC <> 0 then
    begin
        GotoXY(25+3,9+i); writeln('terjadi kesalahan pada flow of control check');
        if FOCC > 0 then
            GotoXY(25+3,10+i); writeln('Ditemukan kurangnya "end" ');
        if FOCC < 0 then
            GotoXY(25+3,10+i); writeln('Ditemukan berlebihnya "end" ');
        error := true;
        readln;
    end;
        
    //jika tidak lulus uniqueness check
    if uniq = true then
    begin
        GotoXY(25+3,9+i); writeln('terjadi kesalahan pada uniqueness check di element ');
        error := true;
        while i <= u do
        begin
            GotoXY(25+3,11+i);writeln(uniqData[i]);
            i := i + 1;
        end;
        readln;
    end;
        
    if typeSts = false then
    begin
        GotoXY(25+3,9+i); writeln('terjadi kesalahan pada type chacking');
        GotoXY(25+3,10+i); writeln(note);
        error := true;
        readln;
    end;

    // uniqueness_check;
    // type_checking;
    // type_conversion;
    // type_coercion;
end;

procedure push_stack(data:string;var awal,terakhir:stack_pointer);
var
   baru:stack_pointer;
begin
     new(baru);
     baru^.info:=data;
     baru^.prev:=nil;
     baru^.next:=nil;
     if awal=nil then
     begin
          awal:=baru;
          terakhir:=baru;
     end
     else
     begin
          terakhir^.next:=baru;
          baru^.prev:=terakhir;
          terakhir:=baru;
     end;
end;

procedure pop_stack(var awal,terakhir:stack_pointer);
var
   phapus:stack_pointer;
begin
     if awal=nil then
        // writeln('Penghapusan dibatalkan karena data kosong')
     else
     if awal=terakhir then
     begin
          dispose(awal);
          awal:=nil;
          terakhir:=nil;
     end
     else
     begin
          phapus:=terakhir;
          terakhir:=terakhir^.prev;
          terakhir^.next:=nil;
          dispose(phapus);
     end;
end;

procedure show_stack(awal:stack_pointer);
var
   bantu:stack_pointer;
begin
     if awal=nil then
        // writeln('Data kosong')
     else
     begin
          bantu:=awal;
          while bantu<>nil do
          begin
               write(bantu^.info,' ');
               bantu:=bantu^.next;
          end;
          writeln;
     end;
end;

function opr_rank(simbol:string):integer;
begin
    case simbol of
        '+': opr_rank := 1;
        '-': opr_rank := 1;
        ':': opr_rank := 1;
        '=': opr_rank := 1;
        '>': opr_rank := 1;
        '<': opr_rank := 1;
        '<=': opr_rank := 1;
        '>=': opr_rank := 1;
        ':=': opr_rank := 1;
        '<>': opr_rank := 1;
        '*': opr_rank := 2;
        '/': opr_rank := 2;
        '^': opr_rank := 3;
    else
        opr_rank := -1;
    end;    
end;//end opr_rank

function postfix(rumus:String):String;
var 
    i:integer;
    p:String;
    sts, tampil : boolean;
begin
    
    //Initialize
    push_stack('(',awal,terakhir);
    rumus := concat(rumus,')');

    p:='';
    i := 1;
    while i <= Length(rumus) do
    begin
        sts := false;
        tampil := true;
        if (opr_rank(rumus[i]) = -1) then
        begin
            // write(rumus[i]);
            case rumus[i] of 
                '(': push_stack(rumus[i],awal,terakhir);
                ')': begin
                    while terakhir^.info <> '(' do
                    begin
                      hasilPost[incPost] := terakhir^.info;
                      incPost := incPost + 1;
                      pop_stack(awal,terakhir);
                    end;
                    pop_stack(awal,terakhir);
                end;
            else
                p := concat(p,rumus[i]);
                i := i + 1;
                while ((opr_rank(rumus[i]) = -1) and
                        (rumus[i] <> ')')) do
                begin
                    p := concat(p,rumus[i]);
                    i := i + 1;
                    
                end;
                hasilPost[incPost] := p;
                incPost := incPost + 1;
                sts := true;
            end;    
        end  
        else
            begin
                tampil := false;
                while ((opr_rank(rumus[i]) <> -1) and
                        (rumus[i] <> ')')) do
                begin
                    p := concat(p,rumus[i]);
                    i := i + 1;
                    sts := true;
                end;
                
                if (opr_rank(p)<opr_rank(terakhir^.info)) then
                    begin
                    hasilPost[incPost] := terakhir^.info;
                    incPost := incPost + 1;
                    pop_stack(awal,terakhir);
                    push_stack(p,awal,terakhir);  
                    p := '';  
                    end
                else
                    begin
                    // tampil := false;
                    push_stack(p,awal,terakhir);
                    end;
            end;
              
    //  if tampil = true then
    //  begin
    //      gotoxy(47,4+incPost); write('|    |                  |');
    //      gotoxy(50,4+incPost);WriteLn(incPost);
    //      gotoxy(60,4+incPost);WriteLn(hasilPost[incPost - 1]);
    //  end;
    
        if sts = false then
            i := i + 1;
        p := '';
    end;//endfor
    readln;
    rumus := '';


end;

procedure tampilPost;
var
    i, j : integer;
begin
    j := 1;
    i := 1;
    while j <= incPost do
    begin
        gotoxy(47,4+i); write('|    |                  |');
        gotoxy(50,4+i);WriteLn(j);
        gotoxy(60,4+i);WriteLn(hasilPost[j - 1]);
        i := i + 1;
        j := j + 1;


        if i = 22 then begin //untuk halaman baru
                // GotoXY(35,7+i); Write('tekan enter untuk lanjutkan');
                i := 1;
                readln;
                clrscr;
            end;
    end;
end;

procedure postOneChar;
var
    inc : integer;
begin
    inc := j;
    tokenPost := concat(tokenPost,hasilToken[inc]);
end;

procedure postExpresion(tanda : string);
var
    inc : integer;
begin
    inc := j;
    while (hasilToken[inc] <> tanda) do
    begin
        tokenPost := concat(tokenPost,hasilToken[inc]);
        inc := inc + 1;
    end;
    postfix(tokenPost);
    tokenPost := '';
end;

procedure postStatment;
var
    inc : integer;
begin
    inc := j;
    while ((hasilToken[inc] <> ';')) do
    begin
        if ((hasilToken[inc] <> 'begin') and
            (hasilToken[inc] <> ';')) then
        begin
            tokenPost := concat(tokenPost,hasilToken[inc]);
            
        end;
        inc := inc + 1;
        write(inc);
    end;
    postfix(tokenPost);
    tokenPost := '';
end;

procedure borderScanner;
begin
    gotoxy(30,4); write('---------------S C A N N E R--------------------');
    gotoxy(30,5); write('------------------------------------------------');
    gotoxy(30,6); write('| No |     Token        |        Kategori      |');
    gotoxy(30,7); write('------------------------------------------------');
end;

procedure borderParser;
begin
    gotoxy(30,4+i); write('-----------------P A R S E R--------------------');
    gotoxy(30,5+i); write('------------------------------------------------');
    gotoxy(30,6+i); write('| No |     Token        |        Kategori      |');
    gotoxy(30,7+i); write('------------------------------------------------');
end;


procedure borderPostfix;
begin
    gotoxy(47, 4+i); write('-----------------NOTASI POSTFIX-----------------');
end;

procedure init;
begin
    j := 0;
    x := 0;
    y := 0;
    u := 0;
    z := 0;

    FOCC := 0;
    uniq := false;
    typeSts := true;

    awal := nil;
    terakhir := nil;
    incPost := 0; 
end;

Begin
    init;
    borderScanner;
    scanCode;
    write('Lanutkan ke proses Parser');
    readln;
    borderParser;
    parser;
    write('Lanutkan ke proses Semantik');
    readln;
    clrscr;
    semantik;
    clrscr;
    if error = false then
    begin
        GotoXY(55,9+i);writeln('D I T E R I M A');
    end
    else
    begin
        GotoXY(55,9+i);writeln
        ('D I T O L A K');
    end;
    write('Lanutkan ke proses Pembentukan kode');
    readln; 
     
    borderPostfix;
    tampilPost;

readln;
End.
