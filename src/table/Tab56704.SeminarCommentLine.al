table 56704 "Seminar Comment Line"
{
    // CSD1.00 - 2013-03-01 - D. E. Veloper
    //   Chapter 3 - Lab 1
    //     - Created new table

    Caption = 'Seminar Comment Line';
    DrillDownPageID = 56707;
    LookupPageID = 56707;

    fields
    {
        field(1; "Document Type"; enum SeminarCommentLineOption)
        {
            Caption = 'Document Type';
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Date; Date)
        {
            Caption = 'Date';
        }
        field(5; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(6; Comment; Text[80])
        {
            Caption = 'Comment';
        }
        field(7; "Document Line No."; Integer)
        {
            Caption = 'Document Line No.';
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Document Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    internal procedure SetUpNewLine()
    var
        SeminarSalesCommentLine: Record "Sales Comment Line";
    begin
        SeminarSalesCommentLine.SETRANGE("Document Type", "Document Type");
        SeminarSalesCommentLine.SETRANGE("No.", "No.");
        SeminarSalesCommentLine.SETRANGE("Document Line No.", "Document Line No.");
        SeminarSalesCommentLine.SETRANGE(Date, WORKDATE());
        IF NOT SeminarSalesCommentLine.IsEmpty() THEN
            Date := WORKDATE();
    end;
}

