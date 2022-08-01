tableextension 56700 "ResourceExt" extends Resource
{
    fields
    {
        field(56700; "Internal/External"; Enum "Seminar Internal/External")
        {
            Caption = 'Internal/External';
            DataClassification = ToBeClassified;
        }
        field(56701; "Maximum Participants"; Integer)
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
