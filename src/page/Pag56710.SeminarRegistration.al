page 56710 "Seminar Registration"
{
    // CSD1.00 - 2013-03-02 - D. E. Veloper
    //   Chapter 3 - Lab 2
    //     - Created new page

    Caption = 'Seminar Registration';
    PageType = Card;
    SourceTable = "Seminar Registration Header";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE();
                    end;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default tooltip on upgrade.';
                }
            }
            group("Seminar Room")
            {
                field("Room Code"; Rec."Room Code")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room Name"; Rec."Room Name")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room Address"; Rec."Room Address")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room City"; Rec."Room City")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
                field("Room County"; Rec."Room County")
                {
                    ApplicationArea = All;
                    Tooltip = 'Default Tooltip From UPgrade.';
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    TOoltip = 'Default ToolTip from Upgrade';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    TOoltip = 'Default ToolTip from Upgrade';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    TOoltip = 'Default ToolTip from Upgrade';
                }
            }
        }
        area(factboxes)
        {
            part(CustDetailsFactbox; "Customer Details FactBox")
            {
                ApplicationArea = All;
            }
            systempart(SemRegLinksPart; Links)
            {
                ApplicationArea = All;
            }
            systempart(SemREgNotesPart; Notes)
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
                Caption = 'Seminar Registration';
                action("Comments")
                {
                    Caption = 'Comments';
                    Image = Comment;
                    RunObject = Page "Seminar Comment Sheet";
                    RunPageLink = "No." = FIELD("No.");
                    RunPageView = where("Document Type" = const("Seminar Registration"));
                    ToolTip = 'Default TooTIp from UPgrade.';
                    ApplicationArea = All;
                }
                action("Charges")
                {
                    Caption = 'Charges';
                    Image = Costs;
                    RunObject = Page "Seminar Charges";
                    RunPageLink = "Document No." = FIELD("No.");
                    ToolTip = 'Default TooTIp from UPgrade.';
                    ApplicationArea = All;
                }
            }
        }
    }
}

