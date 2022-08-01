tableextension 56701 "ResourceExt" extends Resource
{
    fields
    {
        field(56701; "Internal/External"; Enum "Seminar Internal/External")
        {
            Caption = 'Internal/External';
            DataClassification = ToBeClassified;
        }
        field(56702; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(56703; "Quantity Per Day"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
}
