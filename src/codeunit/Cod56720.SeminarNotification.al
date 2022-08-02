codeunit 56720 "Seminar Notification"
{
    procedure CreateNoSeries(NotificationParm: Notification)
    var
        NoSeries: Record "No. Series";
        NoSeriesLines: Record "No. Series Line";
        SeminarSetup: Record "Seminar Setup";
    begin
        If not (NoSeries.Get('Sem')) then begin
            NoSeries.Init();
            NoSeries.Code := 'Sem';
            NoSeries.Description := 'Seminar Numbers';
            NoSeries."Default Nos." := true;
            NoSeries.Insert();
            NoSeriesLines.Init();
            NoSeriesLines."Series Code" := NoSeries.Code;
            NoSeriesLines."Starting No." := 'SEM001';
            NoSeriesLines."Ending No." := 'SEM999';
            NoSeriesLines.Insert();
        end;

        SeminarSetup.Get();
        SeminarSetup."Seminar Nos." := NoSeries.Code;
        SeminarSetup.Modify();
    end;

    procedure DoNothing(NotificationParm: Notification)
    begin

    end;
}
