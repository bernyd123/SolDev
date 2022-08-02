page 56713 "Seminar Registration List"
{
    // CSD1.00 - 2013-03-02 - D. E. Veloper
    //   Chapter 3 - Lab 2
    //     - Created new page

    Caption = 'Seminar Registration List';
    CardPageID = "Seminar Registration";
    Editable = false;
    PageType = List;
    SourceTable = "Seminar Registration Header";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
                field("Room Code"; Rec."Room Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Default Tooltip from Upgrade';
                }
            }
        }
        area(factboxes)
        {
            systempart(SemRegListLinks; Links)
            {
                ApplicationArea = All;
            }
            systempart(SemRegListNotes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Seminar Registration")
            {
                Caption = '&Seminar Registration';
                action("Comments")
                {
                    Caption = 'Comments';
                    Image = Comment;
                    RunObject = Page 56706;
                    RunPageLink = "No." = FIELD("No.");
                    RunPageView = where("Document Type" = const("Seminar Registration"));
                    ApplicationArea = All;
                    ToolTip = 'Default TOoltip from upgrade.';
                }
                action("Charges")
                {
                    Caption = 'Charges';
                    Image = Costs;
                    RunObject = Page 56724;
                    RunPageLink = "Document No." = FIELD("No.");
                    ApplicationArea = All;
                    ToolTip = 'Default TOoltip from upgrade.';
                }
            }
        }
    }
}

