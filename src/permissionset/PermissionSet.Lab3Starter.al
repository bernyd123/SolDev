permissionset 56701 "Lab3 Starter"
{
    Assignable = true;
    Caption = 'Lab3 Starter', MaxLength = 30;
    Permissions =
        table "Seminar Comment Line" = X,
        tabledata "Seminar Comment Line" = RMID,
        table "Seminar Registration Line" = X,
        tabledata "Seminar Registration Line" = RMID,
        table "Seminar Charge" = X,
        tabledata "Seminar Charge" = RMID,
        table "Seminar Registration Header" = X,
        tabledata "Seminar Registration Header" = RMID,
        codeunit "Seminar Notification" = X,
        page "Seminar Comment List" = X,
        page "Seminar Comment Sheet" = X;
}
