pageextension 56701 "ResourceListExt" extends "Resource List"
{
    layout
    {
        addlast(Control1)
        {
            field(InternalExternal; rec."Internal/External")
            {
                ApplicationArea = All;
                ToolTip = 'Is the resource an Internal or External Resource.';
                Visible = ShowType;
            }
            field(MaxParticipants; Rec."Maximum Participants")
            {
                ApplicationArea = All;
                ToolTip = 'The maximum number of participants a room can take.';
                Visible = ShowMaxParticipants;
            }
        }
    }
    var
        [InDataSet]
        ShowType, ShowMaxParticipants : boolean;

    trigger OnOpenPage()
    begin
        Rec.FILTERGROUP(3);
        ShowType := Rec.GETFILTER(Type) = '';
        ShowMaxParticipants := Rec.GETFILTER(Type) = FORMAT(Rec.Type::Machine);
        Rec.FILTERGROUP(0);
    end;
}
