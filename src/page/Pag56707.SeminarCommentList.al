page 56707 "Seminar Comment List"
{
    // CSD1.00 - 2013-03-01 - D. E. Veloper
    //   Chapter 3 - Lab 1
    //     - Created new table

    DataCaptionFields = "No.";
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Seminar Comment Line";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Default Tooltip';
                    ApplicationArea = All;
                }
                field(Date; Rec.Date)
                {
                    ToolTip = 'Default Tooltip';
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Default Tooltip';
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    Visible = false;
                    ToolTip = 'Default Tooltip';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

