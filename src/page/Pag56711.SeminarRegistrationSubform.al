page 56711 "Seminar Registration Subform"
{
    // CSD1.00 - 2013-03-02 - D. E. Veloper
    //   Chapter 3 - Lab 2
    //     - Created new page

    Caption = 'Lines';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Seminar Registration Line";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field(Participated; Rec.Participated)
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("To Invoice"; Rec."To Invoice")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field(Registered; Rec.Registered)
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
                field(Amount; Rec.Amount)
                {
                    APplicationArea = All;
                    ToolTip = 'Default Tooltip from upgrade.';
                }
            }
        }
    }

    actions
    {
    }
}

