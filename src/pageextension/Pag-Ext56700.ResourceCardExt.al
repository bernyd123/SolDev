pageextension 56700 "ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("Internal/Exterenal"; rec."Internal/External")
            {
                ApplicationArea = All;
                ToolTip = 'Is the Resource and Internal or an External Resource.';
            }
            field(QuantityPerDat; rec."Quantity Per Day")
            {
                ApplicationArea = All;
                ToolTip = 'How much per day is allowed.';
            }
        }
        addlast(content)
        {
            group(Room)
            {
                field("Maximum Participants"; rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Maximum Number of Participants that can be added to a room.';
                }
            }
        }
    }
}
