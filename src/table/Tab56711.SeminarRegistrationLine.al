table 56711 "Seminar Registration Line"
{
    // CSD1.00 - 2013-03-01 - D. E. Veloper
    //   Chapter 3 - Lab 1
    //     - Created new table

    Caption = 'Seminar Registration Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = "Seminar Registration Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;

            trigger OnValidate()
            begin
                IF "Bill-to Customer No." <> xRec."Bill-to Customer No." THEN
                    IF Registered THEN
                        ERROR(Text001Err,
                          FIELDCAPTION("Bill-to Customer No."),
                          FIELDCAPTION(Registered),
                          Registered);
            end;
        }
        field(4; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            TableRelation = Contact;

            trigger OnLookup()
            begin
                ContactBusinessRelation.RESET();
                ContactBusinessRelation.SETRANGE("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
                ContactBusinessRelation.SETRANGE("No.", "Bill-to Customer No.");
                IF ContactBusinessRelation.FINDFIRST() THEN BEGIN
                    Contact.SETRANGE("Company No.", ContactBusinessRelation."Contact No.");
                    IF PAGE.RUNMODAL(PAGE::"Contact List", Contact) = ACTION::LookupOK THEN
                        "Participant Contact No." := Contact."No.";

                END;

                CALCFIELDS("Participant Name");
            end;

            trigger OnValidate()
            begin
                IF ("Bill-to Customer No." <> '') AND
                   ("Participant Contact No." <> '')
                THEN BEGIN
                    Contact.GET("Participant Contact No.");
                    ContactBusinessRelation.RESET();
                    ContactBusinessRelation.SETCURRENTKEY("Link to Table", "No.");
                    ContactBusinessRelation.SETRANGE("Link to Table", ContactBusinessRelation."Link to Table"::Customer);
                    ContactBusinessRelation.SETRANGE("No.", "Bill-to Customer No.");
                    IF ContactBusinessRelation.FINDFIRST() THEN
                        IF ContactBusinessRelation."Contact No." <> Contact."Company No." THEN
                            ERROR(Text002Err, Contact."No.", Contact.Name, "Bill-to Customer No.");
                END;
            end;
        }
        field(5; "Participant Name"; Text[100])
        {
            CalcFormula = Lookup(Contact.Name WHERE("No." = FIELD("Participant Contact No.")));
            Caption = 'Participant Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Registration Date"; Date)
        {
            Caption = 'Registration Date';
            Editable = false;
        }
        field(7; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = true;
        }
        field(8; Participated; Boolean)
        {
            Caption = 'Participated';
        }
        field(9; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
            Editable = false;
        }
        field(10; "Seminar Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Seminar Price';

            trigger OnValidate()
            begin
                VALIDATE("Line Discount %");
            end;
        }
        field(11; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                IF "Seminar Price" = 0 THEN
                    "Line Discount Amount" := 0
                ELSE BEGIN
                    GeneralLedgerSetup.Get();
                    "Line Discount Amount" := ROUND("Line Discount %" * "Seminar Price" * 0.01, GeneralLedgerSetup."Amount Rounding Precision");
                END;
                UpdateAmount();
            end;
        }
        field(12; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';

            trigger OnValidate()
            begin
                IF "Seminar Price" = 0 THEN
                    "Line Discount %" := 0
                ELSE BEGIN
                    GeneralLedgerSetup.Get();
                    "Line Discount %" := ROUND("Line Discount Amount" / "Seminar Price" * 100, GeneralLedgerSetup."Amount Rounding Precision");
                END;
                UpdateAmount();
            end;
        }
        field(13; Amount; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Amount';

            trigger OnValidate()
            begin
                TESTFIELD("Bill-to Customer No.");
                TESTFIELD("Seminar Price");
                GeneralLedgerSetup.Get();
                Amount := ROUND(Amount, GeneralLedgerSetup."Amount Rounding Precision");
                "Line Discount Amount" := "Seminar Price" - Amount;
                IF "Seminar Price" = 0 THEN
                    "Line Discount %" := 0
                ELSE
                    "Line Discount %" := ROUND("Line Discount Amount" / "Seminar Price" * 100, GeneralLedgerSetup."Amount Rounding Precision");
            end;
        }
        field(14; Registered; Boolean)
        {
            Caption = 'Registered';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD(Registered, FALSE);
    end;

    trigger OnInsert()
    begin
        GetSeminarRegistrationHeader();
        "Registration Date" := WORKDATE();
        "Seminar Price" := SeminarRegistrationHeader."Seminar Price";
        Amount := SeminarRegistrationHeader."Seminar Price";
    end;

    var
        SeminarRegistrationHeader: Record "Seminar Registration Header";
        SeminarRegistrationLine: Record "Seminar Registration Line";
        ContactBusinessRelation: Record "Contact Business Relation";
        Contact: Record Contact;
        GeneralLedgerSetup: Record "General Ledger Setup";
        SkipBillToContact: Boolean;
        Text001Err: Label 'You cannot change the %1, because %2 is %3.', Comment = '%1 comment %2 comment %3 comment';
        Text002Err: Label 'Contact %1 %2 is related to a different company than customer %3.', Comment = '%1 comment %2 comment %3 comment';

    internal procedure GetSeminarRegistrationHeader()
    begin
        IF SeminarRegistrationHeader."No." <> "Document No." THEN
            SeminarRegistrationHeader.GET("Document No.")
    end;

    internal procedure CalculateAmount()
    begin
        Amount := ROUND(("Seminar Price" / 100) * (100 - "Line Discount %"));
    end;

    internal procedure UpdateAmount()
    begin
        GeneralLedgerSetup.Get();
        Amount := ROUND("Seminar Price" - "Line Discount Amount", GeneralLedgerSetup."Amount Rounding Precision");
    end;
}

