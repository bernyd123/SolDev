table 56733 "Seminar Register"
{
    // CSD1.00 - 2013-04-01 - D. E. Veloper
    //   Chapter 4 - Lab 1
    //     - Created new table

    Caption = 'Seminar Register';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            TableRelation = "Seminar Ledger Entry";
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            TableRelation = "Seminar Ledger Entry";
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup()
            var
                UserMgt: Codeunit "User Management";
            begin
                //THe lookup User ID procedure called below is no longer in the User Management CodeUnit
                //INvestigate to find an alternative solution...x
                //UserMgt.LookupUserID("User ID");
            end;
        }
        field(7; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
        }
        field(8; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date")
        {
        }
        key(Key3; "Source Code", "Journal Template Name", "Creation Date")
        {
        }
    }

    fieldgroups
    {
    }
}

