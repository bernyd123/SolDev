permissionset 56700 "Seminar"
{
    Assignable = true;
    Caption = 'Seminar', MaxLength = 30;
    Permissions =
        table "Seminar Setup" = X,
        tabledata "Seminar Setup" = RMID,
        table Seminar = X,
        tabledata Seminar = RMID,
        page "Seminar List" = X,
        page "Seminar Card" = X,
        page "Seminar Setup" = X;
}
