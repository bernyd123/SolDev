page 56762 "Headline Seminar"
{
    Caption = 'Headline';
    PageType = HeadlinePart;
    RefreshOnActivate = true;

    layout
    {
        area(content)
        {
            group(Control1)
            {
                ShowCaption = false;
                field(TopSellingSeminar; TopSellingSeminar)
                {
                    ApplicationArea = All;
                    Caption = 'Best Selling Seminar';
                    DrillDown = true;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        page.run(page::"Seminar Registration List");
                    end;
                }
            }
            group(Control2)
            {
                ShowCaption = false;
                field(SeminarRegistrations; SeminarRegistrations)
                {
                    ApplicationArea = All;
                    Caption = 'Best Selling Seminar';
                    DrillDown = true;
                    Editable = false;

                    trigger OnDrillDown()
                    begin
                        page.run(page::"Seminar List");
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        TopSellingSeminar := 'Your best selling <emphasize>Seminar</emphasize> is Development.';
        SeminarRegistrations := 'You have <emphasize>x</emphasize> amount of Seminar Registrations.';
    end;

    var
        TopSellingSeminar, SeminarRegistrations : Text;
}

