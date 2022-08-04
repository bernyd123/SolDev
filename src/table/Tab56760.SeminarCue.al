table 56760 "Seminar Cue"
{
    Caption = 'Seminar Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
        }
        field(2; Seminars; Integer)
        {
            Caption = 'Seminars';
            FieldClass = FlowField;
            CalcFormula = count(Seminar where("Blocked " = const(false)));
        }
        field(3; "Seminar Registrations"; Integer)
        {
            Caption = 'Seminar Registrations';
            FieldClass = FlowField;
            CalcFormula = count("Seminar Registration Header");
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
