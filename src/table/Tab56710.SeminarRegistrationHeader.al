table 56710 "Seminar Registration Header"
{
    // CSD1.00 - 2013-03-01 - D. E. Veloper
    //   Chapter 3 - Lab 1
    //     - Created new table


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                IF "No." <> xRec."No." THEN BEGIN
                    SeminarSetup.GET();
                    NoSeriesManagement.TestManual(SeminarSetup."Seminar Registration Nos.");
                    "No. Series" := '';
                END;
            end;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                IF "Starting Date" <> xRec."Starting Date" THEN
                    TESTFIELD(Status, Status::Planning);
            end;
        }
        field(3; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = Seminar;

            trigger OnValidate()
            begin
                IF "Seminar No." <> xRec."Seminar No." THEN BEGIN
                    SeminarRegistrationLine.RESET();
                    SeminarRegistrationLine.SETRANGE("Document No.", "No.");
                    SeminarRegistrationLine.SETRANGE(Registered, TRUE);
                    IF NOT SeminarRegistrationLine.ISEMPTY THEN
                        ERROR(
                          Text002Err,
                          FIELDCAPTION("Seminar No."),
                          SeminarRegistrationLine.TABLECAPTION,
                          SeminarRegistrationLine.FIELDCAPTION(Registered),
                          TRUE);

                    Seminar.GET("Seminar No.");
                    Seminar.TESTFIELD("Blocked ", FALSE);
                    Seminar.TESTFIELD("Gen. Prod. Posting Group");
                    Seminar.TESTFIELD("VAT Prod. Posting Group");
                    "Seminar Name" := Seminar.Name;
                    Rec.Duration := Seminar."Seminar Duration";
                    Rec."Seminar Price" := Seminar."Seminar Price";
                    Rec."Gen. Prod. Posting Group" := Seminar."Gen. Prod. Posting Group";
                    Rec."VAT Prod. Posting Group" := Seminar."VAT Prod. Posting Group";
                    Rec."Minimum Participants" := Seminar."Minimum Participants";
                    Rec."Maximum Participants" := Seminar."Maximum Participants";
                END;
            end;
        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';
        }
        field(5; "Instructor Code"; Code[10])
        {
            Caption = 'Instructor Code';
            TableRelation = Resource WHERE(Type = CONST(Person));

            trigger OnValidate()
            begin
                CALCFIELDS("Instructor Name");
            end;
        }
        field(6; "Instructor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD("Instructor Code"),
                                                      Type = CONST(Person)));
            Caption = 'Instructor Name';
            Editable = false;
        }
        field(7; Status; enum "Seminar Reg. Header Status")
        {
            Caption = 'Status';
        }
        field(8; Duration; Decimal)
        {
            Caption = 'Duration';
            DecimalPlaces = 0 : 1;
        }
        field(9; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(10; "Minimum Participants"; Integer)
        {
        }
        field(11; "Room Code"; Code[10])
        {
            Caption = 'Room Code';
            TableRelation = Resource WHERE(Type = CONST(Machine));

            trigger OnValidate()
            begin
                IF "Room Code" = '' THEN BEGIN
                    "Room Name" := '';
                    "Room Address" := '';
                    "Room Address 2" := '';
                    "Room Post Code" := '';
                    "Room City" := '';
                    "Room County" := '';
                    "Room Country/Reg. Code" := '';
                END ELSE BEGIN
                    ResourceSeminarRoom.GET("Room Code");
                    "Room Name" := ResourceSeminarRoom.Name;
                    "Room Address" := ResourceSeminarRoom.Address;
                    "Room Address 2" := ResourceSeminarRoom."Address 2";
                    "Room Post Code" := ResourceSeminarRoom."Post Code";
                    "Room City" := ResourceSeminarRoom.City;
                    "Room County" := ResourceSeminarRoom.County;
                    "Room Country/Reg. Code" := ResourceSeminarRoom."Country/Region Code";

                    IF (CurrFieldNo <> 0) THEN
                        IF (ResourceSeminarRoom."Maximum Participants" <> 0) AND
                           (ResourceSeminarRoom."Maximum Participants" < "Maximum Participants")
                        THEN
                            IF CONFIRM(Text003Err, TRUE,
                                 "Maximum Participants",
                                 ResourceSeminarRoom."Maximum Participants",
                                 FIELDCAPTION("Maximum Participants"),
                                 "Maximum Participants",
                                 ResourceSeminarRoom."Maximum Participants")
                            THEN
                                "Maximum Participants" := ResourceSeminarRoom."Maximum Participants";
                END;
            end;
        }
        field(12; "Room Name"; Text[100])
        {
            Caption = 'Room Name';
        }
        field(13; "Room Address"; Text[100])
        {
            Caption = 'Room Address';
        }
        field(14; "Room Address 2"; Text[50])
        {
            Caption = 'Room Address 2';
        }
        field(15; "Room Post Code"; Code[20])
        {
            Caption = 'Room Post Code';
            TableRelation = "Post Code".Code;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode("Room City", "Room Post Code", "Room County", "Room Country/Reg. Code", (CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(16; "Room City"; Text[30])
        {
            Caption = 'Room City';

            trigger OnValidate()
            begin
                PostCode.ValidateCity("Room City", "Room Post Code", "Room County", "Room Country/Reg. Code", (CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(17; "Room Country/Reg. Code"; Code[10])
        {
            Caption = 'Room Country/Reg. Code';
            TableRelation = "Country/Region";
        }
        field(18; "Room County"; Text[30])
        {
            Caption = 'Room County';
        }
        field(19; "Seminar Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Seminar Price';

            trigger OnValidate()
            begin
                IF ("Seminar Price" <> xRec."Seminar Price") AND
                   (Status <> Status::Canceled)
                THEN BEGIN
                    SeminarRegistrationLine.Reset();
                    SeminarRegistrationLine.SETRANGE("Document No.", "No.");
                    SeminarRegistrationLine.SETRANGE(Registered, FALSE);
                    IF SeminarRegistrationLine.FINDSET(FALSE, FALSE) THEN
                        IF CONFIRM(Text005Msg, FALSE,
                             FIELDCAPTION("Seminar Price"),
                             SeminarRegistrationLine.TABLECAPTION)
                        THEN BEGIN
                            REPEAT
                                SeminarRegistrationLine.VALIDATE("Seminar Price", "Seminar Price");
                                SeminarRegistrationLine.MODIFY();
                            UNTIL SeminarRegistrationLine.NEXT() = 0;
                            MODIFY();
                        END;
                END;
            end;
        }
        field(20; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(21; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group".Code;
        }
        field(22; Comment; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist("Seminar Comment Line" WHERE("Document Type" = CONST("Seminar Registration"),
                                                              "No." = FIELD("No.")));
            Caption = 'Comment';
            Editable = false;
        }
        field(23; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(24; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(25; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code".Code;
        }
        field(26; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series".Code;
        }
        field(27; "Posting No. Series"; Code[20])
        {
            Caption = 'Posting No. Series';
            TableRelation = "No. Series".Code;

            trigger OnLookup()
            begin
                SeminarRegistrationHeader := Rec;
                SeminarSetup.GET();
                SeminarSetup.TESTFIELD("Seminar Registration Nos.");
                SeminarSetup.TESTFIELD("Posted Seminar Reg. Nos.");
                IF NoSeriesManagement.LookupSeries(SeminarSetup."Posted Seminar Reg. Nos.", SeminarRegistrationHeader."Posting No. Series")
                THEN
                    SeminarRegistrationHeader.VALIDATE("Posting No. Series");
                Rec := SeminarRegistrationHeader;
            end;

            trigger OnValidate()
            begin
                IF "Posting No. Series" <> '' THEN BEGIN
                    SeminarSetup.GET();
                    SeminarSetup.TESTFIELD("Seminar Registration Nos.");
                    SeminarSetup.TESTFIELD("Posted Seminar Reg. Nos.");
                    NoSeriesManagement.TestSeries(SeminarSetup."Posted Seminar Reg. Nos.", "Posting No. Series");
                END;
                TESTFIELD("Posting No.", '');
            end;
        }
        field(28; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Room Code")
        {
            SumIndexFields = Duration;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        SeminarRegistrationLine.RESET();
        SeminarRegistrationLine.SETRANGE("Document No.", "No.");
        SeminarRegistrationLine.SETRANGE(Registered, TRUE);
        IF SeminarRegistrationLine.FIND('-') THEN
            ERROR(
              Text001Err,
              SeminarRegistrationLine.TABLECAPTION,
              SeminarRegistrationLine.FIELDCAPTION(Registered),
              TRUE);
        SeminarRegistrationLine.SETRANGE(Registered);
        SeminarRegistrationLine.DELETEALL(TRUE);

        SeminarCharge.RESET();
        SeminarCharge.SETRANGE("Document No.", "No.");
        IF NOT SeminarCharge.ISEMPTY THEN
            ERROR(Text006Err, SeminarCharge.TABLECAPTION);

        SeminarCommentLine.RESET();
        SeminarCommentLine.SETRANGE("Document Type", SeminarCommentLine."Document Type"::"Seminar Registration");
        SeminarCommentLine.SETRANGE("No.", "No.");
        SeminarCommentLine.DELETEALL();
    end;

    trigger OnInsert()
    begin
        IF "No." = '' THEN BEGIN
            SeminarSetup.Get();
            SeminarSetup.TESTFIELD("Seminar Registration Nos.");
            NoSeriesManagement.InitSeries(SeminarSetup."Seminar Registration Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;

        IF "Posting Date" = 0D THEN
            "Posting Date" := WORKDATE();
        "Document Date" := WORKDATE();
        SeminarSetup.Get();
        NoSeriesManagement.SetDefaultSeries("Posting No. Series", SeminarSetup."Posted Seminar Reg. Nos.");
    end;

    var
        PostCode: Record "Post Code";
        Seminar: Record Seminar;
        SeminarCommentLine: Record "Seminar Comment Line";
        SeminarCharge: Record "Seminar Charge";
        SeminarRegistrationHeader: Record "Seminar Registration Header";
        SeminarRegistrationLine: Record "Seminar Registration Line";
        ResourceSeminarRoom: Record Resource;
        SeminarSetup: Record "Seminar Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        Text001Err: Label 'You cannot delete the Seminar Registration, because there is at least one %1 where %2=%3.', Comment = '%1 Seminar Registration %2 Registration %3 true or false';
        Text002Err: Label 'You cannot change the %1, because there is at least one %2 with %3=%4.', Comment = '%1 comment %2 comment %3 comment %4 comment';
        Text003Err: Label 'This Seminar is for %1 participants. \The selected Room has a maximum of %2 participants \Do you want to change %3 for the Seminar from %4 to %5?', Comment = '%1 comment %2 comment %3 comment %4 comment %5 comment';
        Text005Msg: Label 'Should the new %1 be copied to all %2 that are not yet invoiced?', Comment = '%1 comment %2 comment';
        Text006Err: Label 'You cannot delete the Seminar Registration, because there is at least one %1.', Comment = '%1 comment';

    internal procedure AssistEdit(OldSeminarRegistrationHeader: Record "Seminar Registration Header"): Boolean
    begin
        SeminarRegistrationHeader := Rec;
        SeminarSetup.Get();
        SeminarSetup.TESTFIELD("Seminar Registration Nos.");
        IF NoSeriesManagement.SelectSeries(SeminarSetup."Seminar Registration Nos.", OldSeminarRegistrationHeader."No. Series", SeminarRegistrationHeader."No. Series") THEN BEGIN
            SeminarSetup.Get();
            SeminarSetup.TESTFIELD("Seminar Registration Nos.");
            NoSeriesManagement.SetSeries(SeminarRegistrationHeader."No.");
            Rec := SeminarRegistrationHeader;
            EXIT(TRUE);
        END;
    end;
}

