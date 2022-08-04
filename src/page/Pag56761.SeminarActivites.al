page 56761 "Seminar Activites"
{
    Caption = 'Seminar Activites';
    PageType = CardPart;
    SourceTable = "Seminar Cue";

    layout
    {
        area(content)
        {
            cuegroup(General)
            {
                Caption = 'Seminar Statistics';

                field(Seminars; Rec.Seminars)
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Seminar List";
                    ToolTip = 'How many active Seminars do you have at the moment.';
                }
                field("Seminar Registrations"; Rec."Seminar Registrations")
                {
                    ApplicationArea = All;
                    ToolTip = 'How many active Seminar Registations do you have at the moment.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
